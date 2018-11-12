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

class MarkerCollisionViewController: MapViewController {
    
    @IBOutlet weak var hideCollideSymbolSwitch: UISwitch!
    @IBOutlet weak var hideCollideCaptionSwitch: UISwitch!
    
    var maxZIndex: Int = 0
    var hasMarkersInserted: Bool = false
    var markers: [NMFMarker] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if markers.isEmpty {
            let bounds = mapView.contentBounds
            weak var weakSelf = self
            for index in 1...50 {
                let marker = NMFMarker(position:
                    NMGLatLng(
                        lat: (bounds.northEastLat - bounds.southWestLat) * drand48() + bounds.southWestLat,
                        lng: (bounds.northEastLng - bounds.southWestLng) * drand48() + bounds.southWestLng
                    )
                )
                marker.captionText = "Marker #\(index)"
                marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
                    weakSelf!.maxZIndex += 1
                    marker.zIndex = weakSelf!.maxZIndex
                    return true
                }
                marker.mapView = mapView
                markers.append(marker)
            }
        }
    }
    
    @IBAction func respondToHideSymbol(_ sender: UISwitch) {
        for marker in markers {
            marker.isHideCollidedSymbols = sender.isOn
        }
    }
    
    @IBAction func respondToHideCaption(_ sender: UISwitch) {
        for marker in markers {
            marker.isHideCollidedCaptions = sender.isOn
        }
    }

}
