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

class CustomStyleViewController: MapViewController {
    @IBOutlet weak var customStyleLabel: UIButton!
    
    let customStyles: [(styleName: String, styleId: String?, nightModeEnabled: Bool)] = [
        (styleName: "적용 안 함", styleId: nil, nightModeEnabled: false),
        (styleName: "커스텀 라이트", styleId: "de2bd5ac-5c2c-490a-874a-11f620bc59ac", nightModeEnabled: false),
        (styleName: "커스텀 다크", styleId: "072a2b46-4cf7-4a60-8a32-c25399b97e4e", nightModeEnabled: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let customStyleId = customStyles[1].styleId {
            mapView.customStyleId = customStyleId
        }
        customStyleLabel.setTitle(customStyles[1].styleName, for: .normal)
    }
    
    // MARK: - IBAction
    @IBAction func respondToCustomStyle(_ sender: UIButton) {
        let alertController = UIAlertController(title: "커스텀 스타일", message: nil, preferredStyle: .actionSheet)
        for (styleName, styleId, nightModeEnabled) in customStyles {
            alertController.addAction(UIAlertAction(title: styleName, style: .default, handler: { [weak self] (action) in
                if let styleId = styleId {
                    self?.mapView.customStyleId = styleId
                } else {
                    self?.mapView.customStyleId = ""
                }
                self?.mapView.isNightModeEnabled = nightModeEnabled
                sender.setTitle(styleName, for: .normal)
            }))
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = view
                popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
                present(alertController, animated: true, completion: nil)
            }
        } else {
            present(alertController, animated: true, completion: nil)
        }
    }
}
