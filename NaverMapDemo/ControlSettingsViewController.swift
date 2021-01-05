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

class ControlSettingsViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let param = NMFCameraUpdateParams()
        param.scroll(to: NMGLatLng(lat: 37.5116620, lng: 127.0594274))
        param.zoom(to: 16)
        param.tilt(to: 0)
        param.rotate(to: 90)
        mapView.moveCamera(NMFCameraUpdate(params: param))
        mapView.isIndoorMapEnabled = true
    }
    
    // MARK: - IBAction

    @IBAction func respondToSwitch(_ sender: UISwitch) {
        switch sender.tag {
        case 0: // compass
            naverMapView.showCompass = sender.isOn
        case 1: // scale
            naverMapView.showScaleBar = sender.isOn
        case 2: // zoom
            naverMapView.showZoomControls = sender.isOn
        case 3: // indoor
            naverMapView.showIndoorLevelPicker = sender.isOn
        case 4: // location
            naverMapView.showLocationButton = sender.isOn
        default:
            break
        }
    }
    
    @IBAction func respondToLogoPosition(_ sender: UIButton) {
        var align = mapView.logoAlign
        if align.rawValue >= 3 {
            align = .leftBottom
        } else {
            align = NMFLogoAlign(rawValue: align.rawValue + 1) ?? .leftBottom
        }
        mapView.logoAlign = align
    }

}
