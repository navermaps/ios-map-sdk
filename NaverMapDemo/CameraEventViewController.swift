 /*
  Copyright 2018-2021 NAVER Corp.
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
  http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  */


import UIKit
import NMapsMap
 
class CameraEventViewController: MapViewController {
    
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var idleLabel: UILabel!
    @IBOutlet weak var noticeLabel: UILabel!

    let camPositionFormat = "(%.5f, %.5f) / %.2f / %.2f / %.2f"
    let coord1 = NMGLatLng(lat: 35.1798159, lng: 129.0750222)
    let coord2 = NMGLatLng(lat: 37.5666102, lng: 126.9783881)
    
    var moving: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addCameraDelegate(delegate: self)
        
        let marker1 = NMFMarker(position: coord1)
        marker1.mapView = mapView
        let marker2 = NMFMarker(position: coord2)
        marker2.mapView = mapView
    }
    
    // MARK:- IBActions
    
    @IBAction func respondToMove(_ sender: UIButton) {
        if moving {
            mapView.cancelTransitions()
        } else {
            self.moveCamera(coord1) { [weak self] isCancelled in
                if isCancelled {
                     self?.setIdle(isCancelled)
                } else {
                    guard let coord2 = self?.coord2 else { return }
                    self?.moveCamera(coord2) { [weak self] isCancelled in
                        self?.setIdle(isCancelled)
                    }
                }
            }
            
            moving = true
            moveButton.isSelected = true
        }
    }
    
    func moveCamera(_ target: NMGLatLng, completionHandler: ((Bool) -> Void)? = nil) {
        let camUpdate = NMFCameraUpdate(scrollTo: target)
        camUpdate.animation = .fly
        camUpdate.animationDuration = 3
        mapView.moveCamera(camUpdate) { isCancelled in
            completionHandler?(isCancelled)
        }
    }
    
    func setIdle(_ isCancelled: Bool) {
        moving = false
        moveButton.isSelected = false
        noticeLabel.text = isCancelled ? "카메라 이동 취소" : "카메라 이동 완료"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            self.noticeLabel.text = ""
        })
    }
}

// MARK:- MapView Camera Delegate

extension CameraEventViewController: NMFMapViewCameraDelegate {
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        let camPosition = mapView.cameraPosition
        changeLabel.text = String(format: camPositionFormat, camPosition.target.lat, camPosition.target.lng, camPosition.zoom, camPosition.tilt, camPosition.heading)
    }
    
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        let camPosition = mapView.cameraPosition
        changeLabel.text = String(format: camPositionFormat, camPosition.target.lat, camPosition.target.lng, camPosition.zoom, camPosition.tilt, camPosition.heading)
    }
    
    func mapViewCameraIdle(_ mapView: NMFMapView) {
        let camPosition = mapView.cameraPosition
        idleLabel.text = String(format: camPositionFormat, camPosition.target.lat, camPosition.target.lng, camPosition.zoom, camPosition.tilt, camPosition.heading)
    }
}
