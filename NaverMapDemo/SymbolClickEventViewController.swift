 /*
  Copyright 2018 NAVER Corp.
  
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

class SymbolClickEventViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - MapView Delegate
    
    func didTapMapView(_ point: CGPoint, latLng latlng: NMGLatLng) {
        let alertController = UIAlertController(title: "지도 클릭", message: latlng.positionString(), preferredStyle: .alert)
        present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 0.5), execute: {
                alertController.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        let alertController = UIAlertController(title: symbol.caption, message: symbol.position.positionString(), preferredStyle: .alert)
        present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 0.5), execute: {
                alertController.dismiss(animated: true, completion: nil)
            })
        }
        
        return true
    }

}
