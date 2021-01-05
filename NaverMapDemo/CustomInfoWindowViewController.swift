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

class CustomInfoWindowViewController: MapViewController {

    let infoWindow = NMFInfoWindow()
    var customInfoWindowDataSource = CustomInfoWindowDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.touchDelegate = self

        infoWindow.anchor = CGPoint(x: 0, y: 1)
        infoWindow.dataSource = customInfoWindowDataSource
        infoWindow.offsetX = -40
        infoWindow.offsetY = -5
        infoWindow.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
            self?.infoWindow.close()
            return true
        }
        
        let marker1 = NMFMarker(position: NMGLatLng(lat: 37.57000, lng: 126.97618))
        marker1.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
            self?.infoWindow.open(with: marker1)
            return true
        }
        marker1.userInfo = ["title" : "Marker 1"]
        marker1.mapView = mapView
        
        let marker2 = NMFMarker(position: NMGLatLng(lat: 37.56138, lng: 126.97970))
        marker2.angle = 270.0
        marker2.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
            self?.infoWindow.open(with: marker2, alignType: NMFAlignType.left)
            return true
        }
        marker2.userInfo = ["title" : "Marker 2"]
        marker2.mapView = mapView
        
        infoWindow.open(with: marker1)
    }
}

 // MARK:- MapView Touch Delegate
 
 extension CustomInfoWindowViewController: NMFMapViewTouchDelegate {
     func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        infoWindow.close()
        
        infoWindow.position = latlng
        infoWindow.open(with: mapView)
    }
 }
