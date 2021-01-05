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

class NightModeViewController: MapViewController {
    
    let markerCoords: [NMGLatLng] = [
        NMGLatLng(lat: 37.5666102, lng: 126.9783881),
        NMGLatLng(lat: 37.57000, lng: 126.97618),
        NMGLatLng(lat: 37.56138, lng: 126.97970)
    ]
    var markers: [NMFMarker] = []
    var isNightModeEnabled = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addOptionDelegate(delegate: self)
        
        mapView.mapType = .navi
        mapView.isNightModeEnabled = true

        for latlng in markerCoords {
            let marker = NMFMarker(position: latlng)
            marker.iconImage = NMFOverlayImage(name: "mSNormalNight", in: Bundle.naverMapFramework())
            marker.mapView = mapView
            markers.append(marker)
        }
    }

    // MARK: - IBAction

    @IBAction func respondToNightMode(_ sender: UISwitch) {
        mapView.isNightModeEnabled = sender.isOn
    }
}

 extension NightModeViewController: NMFMapViewOptionDelegate {
    func mapViewOptionChanged(_ mapView: NMFMapView) {
        if (isNightModeEnabled != mapView.isNightModeEnabled) {
            isNightModeEnabled = mapView.isNightModeEnabled
            
            mapView.backgroundColor = isNightModeEnabled ? NMFDefaultBackgroundDarkColor : NMFDefaultBackgroundLightColor
            mapView.backgroundImage = isNightModeEnabled ? NMFDefaultBackgroundDarkImage : NMFDefaultBackgroundLightImage
            
            let iconName = isNightModeEnabled ? "mSNormalNight" : "mSNormal"
            for marker in markers {
                marker.iconImage = NMFOverlayImage(name: iconName, in: Bundle.naverMapFramework())
            }
        }
    }
 }
