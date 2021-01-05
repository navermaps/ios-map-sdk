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

class DisplayOptionsViewController: MapViewController {

    @IBOutlet weak var mapLightnessLabel: UILabel!
    @IBOutlet weak var buildingHeightLabel: UILabel!
    @IBOutlet weak var symbolScaleLabel: UILabel!
    @IBOutlet weak var symbolPerspectiveRatioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(DEFAULT_CAMERA_POSITION.target, zoom: 16, tilt: 40, heading: 0)))
        mapView.setLayerGroup(NMF_LAYER_GROUP_BUILDING, isEnabled: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func respondToMapLightness(_ sender: UISlider) {
        mapView.lightness = CGFloat(sender.value)
        mapLightnessLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func respondToBuildingHeight(_ sender: UISlider) {
        mapView.buildingHeight = sender.value
        buildingHeightLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func respondToSymbolScale(_ sender: UISlider) {
        mapView.symbolScale = CGFloat(sender.value)
        symbolScaleLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func respondToSymbolPerspective(_ sender: UISlider) {
        mapView.symbolPerspectiveRatio = CGFloat(sender.value)
        symbolPerspectiveRatioLabel.text = String(format: "%.2f", sender.value)
    }

}
