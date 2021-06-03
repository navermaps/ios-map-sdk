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

class CustomControlLayoutViewController: MapViewController {
    
    @IBOutlet weak var compassView: NMFCompassView!
    @IBOutlet weak var locationButton: NMFLocationButton!
    @IBOutlet weak var scaleView: NMFScaleView!
    @IBOutlet weak var zoomControlView: NMFZoomControlView!
    @IBOutlet weak var indoorLevelPickerView: NMFIndoorLevelPickerView!
    
    @IBOutlet weak var scaleViewLeftAlignConstraint: NSLayoutConstraint!
    @IBOutlet weak var scaleViewRightAlignConstraint: NSLayoutConstraint!

    private let locationManager = NMFLocationManager.sharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager?.add(self)

        compassView.mapView = mapView
        locationButton.mapView = mapView
        scaleView.mapView = mapView
        zoomControlView.mapView = mapView
        indoorLevelPickerView.mapView = mapView
        mapView.isIndoorMapEnabled = true
        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(NMGLatLng(lat: 37.5116620, lng: 127.0594274), zoom: 16)))
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        locationManager?.remove(self)
    }
    
    @IBAction func changeLayout(_ sender: UIButton) {
        let align = mapView.logoAlign
        if align == .leftBottom {
            mapView.logoAlign = .leftTop
            scaleViewRightAlignConstraint.isActive = false
            scaleViewLeftAlignConstraint.isActive = true
        } else {
            mapView.logoAlign = .leftBottom
            scaleViewLeftAlignConstraint.isActive = false
            scaleViewRightAlignConstraint.isActive = true
        }
    }
}

extension CustomControlLayoutViewController: NMFLocationManagerDelegate {

}
