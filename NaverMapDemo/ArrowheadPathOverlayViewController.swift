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

class ArrowheadPathOverlayViewController: MapViewController {

    let coord1 = [NMGLatLng(lat: 37.568003, lng: 126.9782503),
                  NMGLatLng(lat: 37.5701573, lng: 126.9782503),
                  NMGLatLng(lat: 37.5701573, lng: 126.9803745)]

    let coord2 = [NMGLatLng(lat: 37.568003, lng: 126.9772503),
                  NMGLatLng(lat: 37.5701573, lng: 126.9772503),
                  NMGLatLng(lat: 37.5701573, lng: 126.9751261)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let arrowheadPathOverlay = NMFArrowheadPath(coord1)
        arrowheadPathOverlay?.width = 10
        arrowheadPathOverlay?.color = UIColor.white
        arrowheadPathOverlay?.outlineWidth = 2
        arrowheadPathOverlay?.outlineColor = primaryColor
        arrowheadPathOverlay?.mapView = mapView
        
        let shadowOverlay = NMFArrowheadPath(coord2)
        shadowOverlay?.width = 10
        shadowOverlay?.color = UIColor.black.withAlphaComponent(0.5)
        shadowOverlay?.outlineWidth = 2
        shadowOverlay?.outlineColor = UIColor.darkGray
        shadowOverlay?.mapView = mapView
        
        let elevationOverlay = NMFArrowheadPath(coord2)
        elevationOverlay?.width = 10
        elevationOverlay?.color = UIColor.white
        elevationOverlay?.outlineWidth = 2
        elevationOverlay?.outlineColor = primaryColor
        elevationOverlay?.elevation = 5
        elevationOverlay?.mapView = mapView
        
        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(NMGLatLng(lat: 37.5701573, lng: 126.9777503), zoom: 14, tilt: 50, heading: 0)))
    }
}
