 /*
  Copyright 2018-2025 NAVER Corp.
  
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

class CircleOverlayViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let circleOverlay = NMFCircleOverlay(NMGLatLng(lat: 37.5666102, lng: 126.9783881), radius: 500)
        circleOverlay.fillColor = primaryColor.withAlphaComponent(31/255)
        circleOverlay.outlineColor = primaryColor
        circleOverlay.outlineWidth = 3
        circleOverlay.mapView = mapView
    }

}
