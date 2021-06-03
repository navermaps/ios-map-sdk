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

class IndoorMapViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.isIndoorMapEnabled = true
        mapView.addIndoorSelectionDelegate(delegate: self)
        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(NMGLatLng(lat: 37.5116620, lng: 127.0594274), zoom: 16)))
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        mapView.removeIndoorSelectionDelegate(delegate: self)
    }
}

 extension IndoorMapViewController: NMFIndoorSelectionDelegate {
    func indoorSelectionDidChanged(_ indoorSelection: NMFIndoorSelection?) {
        if let selection = indoorSelection, let name = indoorSelection?.level.name {
            print("index: \(selection.levelIndex), level name: \(name)")
        }
    }
}
