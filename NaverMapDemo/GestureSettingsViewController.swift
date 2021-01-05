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

class GestureSettingsViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction

    @IBAction func respondToSwitch(_ sender: UISwitch) {
        switch sender.tag {
        case 0: // scroll
            mapView.isScrollGestureEnabled = sender.isOn
        case 1: // zoom
            mapView.isZoomGestureEnabled = sender.isOn
        case 2: // tilt
            mapView.isTiltGestureEnabled = sender.isOn
        case 3: // rotate
            mapView.isRotateGestureEnabled = sender.isOn
        case 4: // stop
            mapView.isStopGestureEnabled = sender.isOn
        default:
            break
        }
    }

}
