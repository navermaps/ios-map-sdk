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

class FitBoundsViewController: MapViewController {
    
    let bounds1 = NMGLatLngBounds(southWest: NMGLatLng(lat: 37.4282975, lng: 126.7644840),
                                  northEast: NMGLatLng(lat: 37.7014553, lng: 127.1837949))
    let bounds2 = NMGLatLngBounds(southWest: NMGLatLng(lat: 34.8357234, lng: 128.7614072),
                                  northEast: NMGLatLng(lat: 35.3890374, lng: 129.3055979))
    var boundsFlag = false

    override func viewDidLoad() {
        super.viewDidLoad()

        let ne1 = NMFMarker(position: bounds1.northEast)
        ne1.mapView = mapView
        let sw1 = NMFMarker(position: bounds1.southWest)
        sw1.mapView = mapView
        let ne2 = NMFMarker(position: bounds2.northEast)
        ne2.mapView = mapView
        let sw2 = NMFMarker(position: bounds2.southWest)
        sw2.mapView = mapView
    }
    
    // MARK:- IBActions
    
    @IBAction func respondToMove(_ sender: UIButton) {
        let camUpdate = NMFCameraUpdate(fit: boundsFlag ? bounds2 : bounds1, padding: 24)
        camUpdate.animation = .fly
        camUpdate.animationDuration = 5
        naverMapView.mapView.moveCamera(camUpdate)
        boundsFlag = !boundsFlag
    }

}
