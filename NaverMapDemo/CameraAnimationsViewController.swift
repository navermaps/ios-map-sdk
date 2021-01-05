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

class CameraAnimationsViewController: MapViewController {
    
    let position1 = NMFCameraPosition(NMGLatLng(lat: 37.5666102, lng: 126.9783881), zoom: 6)
    let position2 = NMFCameraPosition(NMGLatLng(lat: 35.1798159, lng: 129.0750222), zoom: 8)
    var positionFlag: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        let marker1 = NMFMarker(position: position1.target)
        marker1.mapView = mapView
        
        let marker2 = NMFMarker(position: position2.target)
        marker2.mapView = mapView
    }
    
    // MARK:- IBActions
    
    @IBAction func respondToMove(_ sender: UIButton) {
        let camUpdate = NMFCameraUpdate(position: positionFlag ? position2 : position1)
        camUpdate.animation = .easeIn
        camUpdate.animationDuration = 5
        mapView.moveCamera(camUpdate)
        positionFlag = !positionFlag
    }

}
