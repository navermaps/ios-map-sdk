 /*
  Copyright 2018-2019 NAVER Corp.
  
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

public let DEFAULT_CAMERA_POSITION = NMFCameraPosition(NMGLatLng(lat: 37.5666102, lng: 126.9783881), zoom: 14, tilt: 0, heading: 0)
public let primaryColor = UIColor(red: 25.0/255.0, green: 192.0/255.0, blue: 46.0/255.0, alpha: 1)

class MapViewController: UIViewController, NMFMapViewDelegate {
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    weak var mapView: NMFMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 211/255, blue: 83/255, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        mapView = naverMapView.mapView
        naverMapView.mapView.moveCamera(NMFCameraUpdate(position: DEFAULT_CAMERA_POSITION))
    }
    
    deinit {
        mapView = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NMGLatLng {
    func positionString() -> String {
        return String(format: "(%.5f, %.5f)", lat, lng)
    }
}
