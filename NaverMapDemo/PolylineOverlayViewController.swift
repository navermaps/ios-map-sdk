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

class PolylineOverlayViewController: MapViewController {

    let coords1 = [NMGLatLng(lat: 37.57152, lng: 126.97714),
                   NMGLatLng(lat: 37.56607, lng: 126.98268),
                   NMGLatLng(lat: 37.56445, lng: 126.97707),
                   NMGLatLng(lat: 37.55855, lng: 126.97822)]
    let coords2 = [NMGLatLng(lat: 37.57152, lng: 126.97714),
                   NMGLatLng(lat: 37.5744287, lng: 126.982625)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let lineString = NMGLineString(points: coords1)
        let polylineOverlay = NMFPolylineOverlay(lineString as! NMGLineString<AnyObject>)
        polylineOverlay?.width = 3
        polylineOverlay?.color = primaryColor
        polylineOverlay?.mapView = mapView
        
        let lineString2 = NMGLineString(points: coords2)
        let polylineOverlay2 = NMFPolylineOverlay(lineString2 as! NMGLineString<AnyObject>)
        polylineOverlay2?.width = 3
        polylineOverlay2?.pattern = [10, 10]
        polylineOverlay2?.color = UIColor.gray
        polylineOverlay2?.mapView = mapView
    }

}
