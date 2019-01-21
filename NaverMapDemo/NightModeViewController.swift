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

class NightModeViewController: MapViewController {
    
    let MARKER_COORDS: [NMGLatLng] = [
        NMGLatLng(lat: 37.5666102, lng: 126.9783881),
        NMGLatLng(lat: 37.57000, lng: 126.97618),
        NMGLatLng(lat: 37.56138, lng: 126.97970)
    ]
    var markers: [NMFMarker] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapType = .navi
        mapView.isNightModeEnabled = true

        for latlng in MARKER_COORDS {
            let marker = NMFMarker(position: latlng)
            marker.iconImage = NMFOverlayImage(name: "mSNormalNight", in: Bundle.naverMapFramework())
            marker.mapView = mapView
            markers.append(marker)
        }
        
    }

    @IBAction func respondToNightMode(_ sender: UISwitch) {
        mapView.isNightModeEnabled = sender.isOn
        for marker in markers {
            marker.iconImage = NMFOverlayImage(name: sender.isOn ? "mSNormalNight" : "mSNormal", in: Bundle.naverMapFramework())
        }
    }

}
