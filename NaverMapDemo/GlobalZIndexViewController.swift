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

class GlobalZIndexViewController: MapViewController {
    
    let pathCoords = [NMGLatLng(lat: 37.5631345, lng: 126.9767931),
                      NMGLatLng(lat: 37.5635163, lng: 126.9769240),
                      NMGLatLng(lat: 37.5635506, lng: 126.9769351),
                      NMGLatLng(lat: 37.5638061, lng: 126.9770239),
                      NMGLatLng(lat: 37.5639153, lng: 126.9770605),
                      NMGLatLng(lat: 37.5639577, lng: 126.9770749),
                      NMGLatLng(lat: 37.5640074, lng: 126.9770927),
                      NMGLatLng(lat: 37.5644783, lng: 126.9771755),
                      NMGLatLng(lat: 37.5649229, lng: 126.9772482),
                      NMGLatLng(lat: 37.5650330, lng: 126.9772667),
                      NMGLatLng(lat: 37.5652152, lng: 126.9772971),
                      NMGLatLng(lat: 37.5654569, lng: 126.9773170),
                      NMGLatLng(lat: 37.5655173, lng: 126.9773222),
                      NMGLatLng(lat: 37.5656534, lng: 126.9773258),
                      NMGLatLng(lat: 37.5660418, lng: 126.9773004),
                      NMGLatLng(lat: 37.5661985, lng: 126.9772914),
                      NMGLatLng(lat: 37.5664663, lng: 126.9772952),
                      NMGLatLng(lat: 37.5668827, lng: 126.9773047),
                      NMGLatLng(lat: 37.5669467, lng: 126.9773054),
                      NMGLatLng(lat: 37.5670567, lng: 126.9773080),
                      NMGLatLng(lat: 37.5671360, lng: 126.9773097),
                      NMGLatLng(lat: 37.5671910, lng: 126.9773116),
                      NMGLatLng(lat: 37.5672785, lng: 126.9773122),
                      NMGLatLng(lat: 37.5674668, lng: 126.9773120),
                      NMGLatLng(lat: 37.5677264, lng: 126.9773124),
                      NMGLatLng(lat: 37.5680410, lng: 126.9773068),
                      NMGLatLng(lat: 37.5689242, lng: 126.9772871),
                      NMGLatLng(lat: 37.5692829, lng: 126.9772698),
                      NMGLatLng(lat: 37.5693829, lng: 126.9772669),
                      NMGLatLng(lat: 37.5696659, lng: 126.9772615),
                      NMGLatLng(lat: 37.5697524, lng: 126.9772575),
                      NMGLatLng(lat: 37.5698659, lng: 126.9772499),
                      NMGLatLng(lat: 37.5699671, lng: 126.9773070),
                      NMGLatLng(lat: 37.5700151, lng: 126.9773395),
                      NMGLatLng(lat: 37.5700748, lng: 126.9773866),
                      NMGLatLng(lat: 37.5701164, lng: 126.9774373),
                      NMGLatLng(lat: 37.5701903, lng: 126.9776225),
                      NMGLatLng(lat: 37.5701905, lng: 126.9776723),
                      NMGLatLng(lat: 37.5701897, lng: 126.9777006),
                      NMGLatLng(lat: 37.5701869, lng: 126.9784990),
                      NMGLatLng(lat: 37.5701813, lng: 126.9788591),
                      NMGLatLng(lat: 37.5701770, lng: 126.9791139),
                      NMGLatLng(lat: 37.5701741, lng: 126.9792702),
                      NMGLatLng(lat: 37.5701743, lng: 126.9793098),
                      NMGLatLng(lat: 37.5701752, lng: 126.9795182),
                      NMGLatLng(lat: 37.5701761, lng: 126.9799315),
                      NMGLatLng(lat: 37.5701775, lng: 126.9800380),
                      NMGLatLng(lat: 37.5701800, lng: 126.9804048),
                      NMGLatLng(lat: 37.5701832, lng: 126.9809189),
                      NMGLatLng(lat: 37.5701845, lng: 126.9810197),
                      NMGLatLng(lat: 37.5701862, lng: 126.9811986),
                      NMGLatLng(lat: 37.5701882, lng: 126.9814375),
                      NMGLatLng(lat: 37.5701955, lng: 126.9820897),
                      NMGLatLng(lat: 37.5701996, lng: 126.9821860)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        if let pathOverlay = NMFPath(points: pathCoords) {
            pathOverlay.width = 8
            pathOverlay.outlineWidth = 2
            pathOverlay.color = primaryColor
            pathOverlay.outlineColor = UIColor.white
            pathOverlay.mapView = mapView
        }
        
        let marker1 = NMFMarker()
        marker1.position = NMGLatLng(lat: 37.5701761, lng: 126.9799315)
        marker1.captionText = "경로선 위에 위치한 마커"
        marker1.mapView = mapView
        
        let marker2 = NMFMarker()
        marker2.position = NMGLatLng(lat: 37.5664663, lng: 126.9772952)
        marker2.iconImage = NMF_MARKER_IMAGE_BLUE
        marker2.captionText = "경로선 아래에 위치한 마커"
        marker2.globalZIndex = Int(NMF_PATH_OVERLAY_GLOBAL_Z_INDEX) - 1
        marker2.mapView = mapView
    }
}
