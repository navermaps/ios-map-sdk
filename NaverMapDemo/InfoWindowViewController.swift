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
class InfoWindowViewController: MapViewController {
    var infoWindow = NMFInfoWindow()
    var defaultInfoWindowImage = NMFInfoWindowDefaultTextSource.data()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.touchDelegate = self

        infoWindow.dataSource = defaultInfoWindowImage
        defaultInfoWindowImage.title = "인포 윈도우"
        infoWindow.position = NMGLatLng(lat: 37.5666102, lng: 126.9783881)
        infoWindow.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
            self?.infoWindow.close()
            return true
        }
        infoWindow.mapView = mapView
        
        let marker1 = NMFMarker(position: NMGLatLng(lat: 37.57000, lng: 126.97618))
        marker1.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
            self?.infoWindow.close()
            self?.defaultInfoWindowImage.title = marker1.userInfo["tag"] as! String
            self?.infoWindow.open(with: marker1)
            return true
        }
        marker1.userInfo = ["tag" : "Marker 1"]
        marker1.mapView = mapView
        
        let marker2 = NMFMarker(position: NMGLatLng(lat: 37.56138, lng: 126.97970))
        marker2.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
            self?.infoWindow.close()
            self?.defaultInfoWindowImage.title = marker2.userInfo["tag"] as! String
            self?.infoWindow.open(with: marker2, alignType: NMFAlignType.left)
            return true
        }
        marker2.userInfo = ["tag" : "Marker 2"]
        marker2.mapView = mapView
    }
}

 // MARK:- MapView Touch Delegate
 
 extension InfoWindowViewController: NMFMapViewTouchDelegate {
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        infoWindow.close()
        
        let latlngStr = String(format: "좌표:(%.5f, %.5f)", latlng.lat, latlng.lng)
        defaultInfoWindowImage.title = latlngStr
        infoWindow.position = latlng
        infoWindow.open(with: mapView)
    }
 }
