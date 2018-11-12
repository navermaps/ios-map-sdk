 /*
  Copyright 2018 NAVER Corp.
  
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

    let COORD_1 = NMGLatLng(lat: 37.5666102, lng: 126.9783881)
    let COORD_2 = NMGLatLng(lat: 35.1798159, lng: 129.0750222)
    var positionFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let marker1 = NMFMarker(position: COORD_1)
        marker1.mapView = mapView
        let marker2 = NMFMarker(position: COORD_2)
        marker2.mapView = mapView
        
        mapView.contentInset = UIEdgeInsets(top: 40, left: 20, bottom: 100, right: 60)
        mapView.moveCamera(NMFCameraUpdate(scrollTo: COORD_1))
    }
    
    @IBAction func respondToMoveCamera(_ sender: UIButton) {
        let camUpdate = NMFCameraUpdate(scrollTo: positionFlag ? COORD_1 : COORD_2)
        camUpdate.animation = .fly
        camUpdate.animationDuration = 3
        mapView.moveCamera(camUpdate)
        positionFlag = !positionFlag
    }

}
