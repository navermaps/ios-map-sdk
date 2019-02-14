 /*
  Copyright 2018-2019 NAVER Corp.
  
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
    
    let camPositionFormat = "(%.5f, %.5f) / %.2f / %.2f / %.2f"
    let COORD_1 = NMGLatLng(lat: 35.1798159, lng: 129.0750222)
    let COORD_2 = NMGLatLng(lat: 37.5666102, lng: 126.9783881)
    
    var positionFlag: Bool = false
    var moving: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let marker1 = NMFMarker(position: COORD_1)
        marker1.mapView = mapView
        let marker2 = NMFMarker(position: COORD_2)
        marker2.mapView = mapView
    }
    
    // MARK:- MapView Delegate
    
    func mapViewRegionIsChanging(_ mapView: NMFMapView, byReason reason: Int) {
        let camPosition = mapView.cameraPosition
        changeLabel.text = String(format: camPositionFormat, camPosition.target.lat, camPosition.target.lng, camPosition.zoom, camPosition.tilt, camPosition.heading)
    }
    
    func mapViewIdle(_ mapView: NMFMapView) {
        let camPosition = mapView.cameraPosition
        idleLabel.text = String(format: camPositionFormat, camPosition.target.lat, camPosition.target.lng, camPosition.zoom, camPosition.tilt, camPosition.heading)
    }
    
    // MARK:- IBActions
    
    @IBAction func respondToMove(_ sender: UIButton) {
        if moving {
            mapView.cancelTransitions()
        } else {
            let camUpdate = NMFCameraUpdate(scrollTo: positionFlag ? COORD_2 : COORD_1)
            camUpdate.animation = .fly
            camUpdate.animationDuration = 5
            
            mapView.moveCamera(camUpdate) { [weak self] isCancelled in
                self?.moving = false
                self?.moveButton.isSelected = false
                let alert = UIAlertController(title: isCancelled ? "카메라 이동 취소" : "카메라 이동 완료",
                                              message: nil,
                                              preferredStyle: .alert)
                self?.present(alert, animated: true, completion: {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                        alert.dismiss(animated: true, completion: nil)
                    })
                })
            }
            moving = true
            moveButton.isSelected = true
            positionFlag = !positionFlag
        }
    }

}
