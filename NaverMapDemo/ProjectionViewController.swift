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

import Foundation
import NMapsMap

class ProjectionViewController: MapViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var crossHair: UIImageView!
    let marker = NMFMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addCameraDelegate(delegate: self)
        
        marker.position = mapView.cameraPosition.target
        marker.mapView = mapView
    }
    
    func update() {
        let point = mapView.projection.point(from: marker.position)
        marker.captionText = String(format: "화면좌표: (%.1f, %.1f)\n지도 좌표: (%.5f, %.5f)", point.x, point.y, marker.position.lat, marker.position.lng)
        
        let coord = mapView.projection.latlng(from: crossHair.center)
        textView.text = String(format: "화면좌표: (%.1f, %.1f)\n지도좌표: (%.5f, %.5f)", crossHair.center.x, crossHair.center.y, coord.lat, coord.lng)
    }
}

extension ProjectionViewController: NMFMapViewCameraDelegate {
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        update()
    }
    
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        update()
    }
}
