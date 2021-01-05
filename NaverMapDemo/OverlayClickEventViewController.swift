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

class OverlayClickEventViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.touchDelegate = self

        let sdkBundle = Bundle.naverMapFramework()
        let marker1 = NMFMarker(position: NMGLatLng(lat: 37.57207, lng: 126.97917))
        marker1.captionText = "이벤트 소비"
        marker1.touchHandler = { (overlay) in
            if let marker = overlay as? NMFMarker {
                if marker.iconImage.reuseIdentifier == "\(sdkBundle.bundleIdentifier ?? "").mSNormal" {
                    marker.iconImage = NMFOverlayImage(name: "mSNormalNight", in: Bundle.naverMapFramework())
                } else {
                    marker.iconImage = NMFOverlayImage(name: "mSNormal", in: Bundle.naverMapFramework())
                }
            }
            return true
        }
        marker1.mapView = mapView
        
        let marker2 = NMFMarker(position: NMGLatLng(lat: 37.56361, lng: 126.97439))
        marker2.captionText = "이벤트 전파"
        marker2.touchHandler = { (overlay) in
            if let marker = overlay as? NMFMarker {
                if marker.iconImage.reuseIdentifier == "\(sdkBundle.bundleIdentifier ?? "").mSNormal" {
                    marker.iconImage = NMFOverlayImage(name: "mSNormalNight", in: Bundle.naverMapFramework())
                } else {
                    marker.iconImage = NMFOverlayImage(name: "mSNormal", in: Bundle.naverMapFramework())
                }
            }
            return false
        }
        marker2.mapView = mapView
        
        let marker3 = NMFMarker(position: NMGLatLng(lat: 37.56671, lng: 126.98260))
        marker3.captionText = "이벤트 리스너 없음"
        marker3.mapView = mapView
    }
 }
 
 // MARK:- MapView Touch Delegate
 
 extension OverlayClickEventViewController: NMFMapViewTouchDelegate {
     func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        let alertController = UIAlertController(title: "지도 클릭", message: latlng.positionString(), preferredStyle: .alert)
        present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 0.5), execute: {
                alertController.dismiss(animated: true, completion: nil)
            })
        }
    }
 }
