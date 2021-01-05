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

class PolygonOverlayViewController: MapViewController {
    
    let coords1 = [NMGLatLng(lat: 37.5734571, lng: 126.975335),
                   NMGLatLng(lat: 37.5694007, lng: 126.9739434),
                   NMGLatLng(lat: 37.5678124, lng: 126.9812127),
                   NMGLatLng(lat: 37.5738912, lng: 126.9825649),
                   NMGLatLng(lat: 37.5734571, lng: 126.975335)]
    let coords2 = [NMGLatLng(lat: 37.5640984, lng: 126.9712268),
                   NMGLatLng(lat: 37.5651279, lng: 126.9767904),
                   NMGLatLng(lat: 37.5625365, lng: 126.9832241),
                   NMGLatLng(lat: 37.5585305, lng: 126.9809297),
                   NMGLatLng(lat: 37.5590777, lng: 126.974617),
                   NMGLatLng(lat: 37.5640984, lng: 126.9712268)]
    let holes = [NMGLatLng(lat: 37.5612243, lng: 126.9768938),
                 NMGLatLng(lat: 37.5627692, lng: 126.9795502),
                 NMGLatLng(lat: 37.5628377, lng: 126.976066),
                 NMGLatLng(lat: 37.5612243, lng: 126.9768938)]

    override func viewDidLoad() {
        super.viewDidLoad()

        let polygon = NMGPolygon(ring: NMGLineString(points: coords1))
        let polygonOverlay = NMFPolygonOverlay(polygon as! NMGPolygon<AnyObject>)
        polygonOverlay?.fillColor = UIColor(red: 25.0/255.0, green: 192.0/255.0, blue: 46.0/255.0, alpha: 31.0/255.0)
        polygonOverlay?.outlineColor = primaryColor
        polygonOverlay?.outlineWidth = 3
        polygonOverlay?.mapView = mapView
        
        let polygon2 = NMGPolygon(ring: NMGLineString(points: coords2), interiorRings: [NMGLineString(points: holes)])
        let polygonWithHole = NMFPolygonOverlay(polygon2 as! NMGPolygon<AnyObject>)
        polygonWithHole?.fillColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 127.0/255.0)
        polygonWithHole?.mapView = mapView
    }

}
