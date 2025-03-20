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

class MinMaxZoomViewController: MapViewController {
    @IBOutlet weak var zoomView: ValueView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addCameraDelegate(delegate: self)
        
        mapView.minZoomLevel = 10
        mapView.maxZoomLevel = 16
        
        zoomView.setValue(mapView.zoomLevel)
    }
}

// MARK:- MapView Camera Delegate
extension MinMaxZoomViewController: NMFMapViewCameraDelegate {
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        zoomView.setValue(mapView.zoomLevel)
    }
    
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        zoomView.setValue(mapView.zoomLevel)
    }
    
    func mapViewCameraIdle(_ mapView: NMFMapView) {
        zoomView.setValue(mapView.zoomLevel)
    }
}
