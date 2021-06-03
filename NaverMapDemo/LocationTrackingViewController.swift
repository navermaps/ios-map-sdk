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

class LocationTrackingViewController: MapViewController {
    
    @IBOutlet weak var selectButton: UIBarButtonItem!

    private let locationManager = NMFLocationManager.sharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager?.add(self)

        naverMapView.addObserver(self, forKeyPath: "positionMode", options: [.new, .old, .prior], context: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        locationManager?.remove(self)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "positionMode" {
            updateStateName()
        }
    }
    
    func updateStateName() {
        var stateStr = ""
        switch mapView.positionMode {
        case .disabled:
            stateStr = "None"
        case .normal:
            stateStr = "NoFollow"
        case .direction:
            stateStr = "Follow"
        case .compass:
            stateStr = "Face"
        default:
            stateStr = "None"
        }
        selectButton.title = stateStr
    }
    
    // MARK: - IBAction
    
    @IBAction func respondToTypeSelect(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "None",
                                               style: mapView.positionMode == .disabled ? .destructive : .default,
                                               handler: { [weak self] (action) in
                                                self?.mapView.positionMode = .disabled
        }))
        alertController.addAction(UIAlertAction(title: "No Follow",
                                               style: mapView.positionMode == .normal ? .destructive : .default,
                                               handler: { [weak self] (action) in
                                                self?.mapView.positionMode = .normal
        }))
        alertController.addAction(UIAlertAction(title: "Follow",
                                               style: mapView.positionMode == .direction ? .destructive : .default,
                                               handler: { [weak self] (action) in
                                                self?.mapView.positionMode = .direction
        }))
        alertController.addAction(UIAlertAction(title: "Face",
                                               style: mapView.positionMode == .compass ? .destructive : .default,
                                               handler: { [weak self] (action) in
                                                self?.mapView.positionMode = .compass
        }))
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = view
                popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
                present(alertController, animated: true, completion: nil)
            }
        } else {
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func respondToShowSwitch(_ sender: UISwitch) {
        naverMapView.showLocationButton = sender.isOn
    }
}

extension LocationTrackingViewController: NMFLocationManagerDelegate {

}
