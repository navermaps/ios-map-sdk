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

class ContentPaddingViewController: MapViewController {
    
    @IBOutlet weak var contentBoundsLabel: UILabel!
    @IBOutlet weak var coveringBoundsLabel: UILabel!
    
    let coord1 = NMGLatLng(lat: 37.5666102, lng: 126.9783881)
    let coord2 = NMGLatLng(lat: 35.1798159, lng: 129.0750222)
    var positionFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let marker1 = NMFMarker(position: coord1)
        marker1.mapView = mapView
        let marker2 = NMFMarker(position: coord2)
        marker2.mapView = mapView
        
        mapView.contentInset = UIEdgeInsets(top: 100, left: 20, bottom: 100, right: 60)
        mapView.moveCamera(NMFCameraUpdate(scrollTo: coord1))
        
        mapView.addCameraDelegate(delegate: self)
    }
    
    // MARK: - IBAction

    @IBAction func respondToMoveCamera(_ sender: UIButton) {
        let camUpdate = NMFCameraUpdate(scrollTo: positionFlag ? coord1 : coord2)
        camUpdate.animation = .fly
        camUpdate.animationDuration = 3
        mapView.moveCamera(camUpdate)
        positionFlag = !positionFlag
    }
    
    func updateBounds() {
        let boundsFormat = "(%1$.4f, %2$.4f) (%3$.4f, %4$.4f)"
        let content = mapView.contentBounds
        contentBoundsLabel.text = String(format: boundsFormat, content.southWestLat, content.southWestLng, content.northEastLat, content.northEastLng)
        let covering = mapView.coveringBounds
        coveringBoundsLabel.text = String(format: boundsFormat, covering.southWestLat, covering.southWestLng, covering.northEastLat, covering.northEastLng)
    }
 }
 
 extension ContentPaddingViewController: NMFMapViewCameraDelegate {
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        updateBounds()
    }
    
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
       updateBounds()
    }
 }
