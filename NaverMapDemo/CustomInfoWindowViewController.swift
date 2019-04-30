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

class CustomInfoWindowView: UIView {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
}

class CustomInfoWindowDataSource: NSObject, NMFOverlayImageDataSource {
    var rootView: CustomInfoWindowView!
    
    func view(with overlay: NMFOverlay) -> UIView {
        guard let infoWindow = overlay as? NMFInfoWindow else { return rootView }
        if rootView == nil {
            rootView = Bundle.main.loadNibNamed("CustomInfoWindowView", owner: nil, options: nil)?.first as? CustomInfoWindowView
        }
        
        if infoWindow.marker != nil {
            rootView.iconView.image = UIImage(named: "baseline_room_black_24pt")
            rootView.textLabel.text = infoWindow.marker.userInfo["title"] as? String
        } else {
            rootView.iconView.image = UIImage(named: "baseline_gps_fixed_black_24pt")
            rootView.textLabel.text = "\(infoWindow.position.lat), \(infoWindow.position.lng)"
        }
        rootView.textLabel.sizeToFit()
        let width = rootView.textLabel.frame.size.width + 80
        rootView.frame = CGRect(x: 0, y: 0, width: width, height: 88)
        rootView.layoutIfNeeded()
        
        
        return rootView
    }
}

class CustomInfoWindowViewController: MapViewController {

    let infoWindow = NMFInfoWindow()
    var customInfoWindowDataSource = CustomInfoWindowDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            self?.infoWindow.open(with: marker2, align: .left)
            return true
        }
        marker2.userInfo = ["title" : "Marker 2"]
        marker2.mapView = mapView
        
        infoWindow.open(with: marker1)
    }
    
    func didTapMapView(_ point: CGPoint, latLng latlng: NMGLatLng) {
        infoWindow.close()
        
        infoWindow.position = latlng
        infoWindow.open(with: mapView)
    }
}
