 /*
  Copyright 2018-2022 NAVER Corp.
  
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

class MapViewCreatedInCodeController: UIViewController {
    let naverMapView = NMFNaverMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(naverMapView)
        
        naverMapView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            naverMapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            naverMapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        }
        naverMapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        naverMapView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        naverMapView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        naverMapView.mapView.moveCamera(NMFCameraUpdate(position: DEFAULT_CAMERA_POSITION))
    }
}
