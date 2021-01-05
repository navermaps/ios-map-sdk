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

class PickAllViewController: MapViewController {
    
    @IBOutlet weak var textView: UITextView!
    var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.touchDelegate = self
        
        let marker1 = NMFMarker(position: NMGLatLng(lat: 37.56752, lng: 126.97385))
        marker1.captionText = "Marker 1"
        marker1.mapView = mapView
        
        let marker2 = NMFMarker(position: NMGLatLng(lat: 37.56211, lng: 126.98266))
        marker2.captionText = "Marker 2"
        marker2.mapView = mapView
        
        let marker3 = NMFMarker(position: NMGLatLng(lat: 37.563028, lng: 126.97629));
        marker3.captionText = "Marker 3"
        marker3.mapView = mapView
        
        let marker4 = NMFMarker(position: NMGLatLng(lat: 37.56992, lng: 126.98005));
        marker4.captionText = "Marker 4"
        marker4.mapView = mapView
    }
    
    func drawCircle(_ point: CGPoint) {
        if circleView == nil {
            circleView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            circleView.layer.cornerRadius = 30
            circleView.backgroundColor = primaryColor
            circleView.alpha = 0.3
            circleView.isUserInteractionEnabled = false
            naverMapView.addSubview(circleView)
        }
        circleView.center = point
    }
}

// MARK:- MapView Touch Delegate
extension PickAllViewController: NMFMapViewTouchDelegate {
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        var pickableListStr = ""
        for pickable in mapView.pickAll(point, withTolerance: 30) {
            if let symbol = pickable as? NMFSymbol {
                pickableListStr = pickableListStr + "Symbol(\(symbol.caption ?? ""))\n"
            } else if let marker = pickable as? NMFMarker {
                pickableListStr = pickableListStr + "Marker(\(marker.captionText))\n"
            } else {
                pickableListStr = pickableListStr + "Overlay\n"
            }
        }
        textView.text = pickableListStr
        drawCircle(point)
    }
}
