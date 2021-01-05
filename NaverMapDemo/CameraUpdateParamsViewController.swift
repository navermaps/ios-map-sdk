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

class CameraUpdateParamsViewController: MapViewController {

    let coord = NMGLatLng(lat: 37.5666102, lng: 126.9783881)
    var step: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK:- IBActions
    
    @IBAction func respondToMove(_ sender: UIButton) {
        let params = NMFCameraUpdateParams()
        if step == 0 {
            params.scroll(to: coord)
            params.zoom(to: 10)
            params.rotate(to: 0)
        } else if step == 1 {
            params.scroll(by: CGPoint(x: 200, y: -100))
        } else {
            params.rotate(to: 90)
        }
        step = (step + 1) % 3
        let camUpdate = NMFCameraUpdate(params: params)
        camUpdate.animation = .easeIn
        camUpdate.animationDuration = 0.2
        mapView.moveCamera(camUpdate)
    }

}
