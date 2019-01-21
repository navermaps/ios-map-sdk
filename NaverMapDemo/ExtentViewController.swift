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

class ExtentViewController: MapViewController {

    let EXTENT = NMGLatLngBounds(southWestLat: 31.43, southWestLng: 122.37, northEastLat: 44.35, northEastLng: 132)

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.extent = EXTENT
        mapView.moveCamera(NMFCameraUpdate(fit: EXTENT, padding: 24))
        let polylineOverlay = NMFPolylineOverlay(points: [EXTENT.southWest,
                                                          NMGLatLng(lat: EXTENT.southWestLat, lng: EXTENT.northEastLng),
                                                          EXTENT.northEast,
                                                          NMGLatLng(lat: EXTENT.northEastLat, lng: EXTENT.southWestLng),
                                                          EXTENT.southWest])
        polylineOverlay?.mapView = mapView
    }

}
