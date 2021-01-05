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

class MapTypesAndLayerGroupsViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(DEFAULT_CAMERA_POSITION.target, zoom: 16, tilt: 40, heading: 0)))
    }
    
    // MARK: - IBAction
    @IBAction func respondToMapType(_ sender: UIButton) {
        let alertController = UIAlertController(title: "지도 유형", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Basic", style: .default, handler: { [weak self] (action) in
            self?.mapView.mapType = .basic
            sender.setTitle("Basic", for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "Navi", style: .default, handler: { [weak self] (action) in
            self?.mapView.mapType = .navi
            sender.setTitle("Navi", for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { [weak self] (action) in
            self?.mapView.mapType = .satellite
            sender.setTitle("Satellite", for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { [weak self] (action) in
            self?.mapView.mapType = .hybrid
            sender.setTitle("Hybrid", for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "Terrain", style: .default, handler: { [weak self] (action) in
            self?.mapView.mapType = .terrain
            sender.setTitle("Terrain", for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "None", style: .default, handler: { [weak self] (action) in
            self?.mapView.mapType = .none
            sender.setTitle("None", for: .normal)
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
    
    @IBAction func respondToLayerGroups(_ sender: UIButton) {
        let alertController = UIAlertController(title: "레이어 그룹", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "건물",
                                                style: (mapView.getLayerGroupEnabled(NMF_LAYER_GROUP_BUILDING) ? .destructive : .default),
                                                handler: { [weak self] (action) in
                                                    self?.mapView.setLayerGroup(NMF_LAYER_GROUP_BUILDING, isEnabled: (action.style == .default))
        }))
        alertController.addAction(UIAlertAction(title: "실시간 교통정보",
                                                style: (mapView.getLayerGroupEnabled(NMF_LAYER_GROUP_TRAFFIC) ? .destructive : .default),
                                                handler: { [weak self] (action) in
                                                    self?.mapView.setLayerGroup(NMF_LAYER_GROUP_TRAFFIC, isEnabled: (action.style == .default))
        }))
        alertController.addAction(UIAlertAction(title: "대중교통",
                                                style: (mapView.getLayerGroupEnabled(NMF_LAYER_GROUP_TRANSIT) ? .destructive : .default),
                                                handler: { [weak self] (action) in
                                                    self?.mapView.setLayerGroup(NMF_LAYER_GROUP_TRANSIT, isEnabled: (action.style == .default))
        }))
        alertController.addAction(UIAlertAction(title: "자전거",
                                                style: (mapView.getLayerGroupEnabled(NMF_LAYER_GROUP_BICYCLE) ? .destructive : .default),
                                                handler: { [weak self] (action) in
                                                    self?.mapView.setLayerGroup(NMF_LAYER_GROUP_BICYCLE, isEnabled: (action.style == .default))
        }))
        alertController.addAction(UIAlertAction(title: "지적도",
                                                style: (mapView.getLayerGroupEnabled(NMF_LAYER_GROUP_CADASTRAL) ? .destructive : .default),
                                                handler: { [weak self] (action) in
                                                    self?.mapView.setLayerGroup(NMF_LAYER_GROUP_CADASTRAL, isEnabled: (action.style == .default))
        }))
        alertController.addAction(UIAlertAction(title: "등산로",
                                                style: (mapView.getLayerGroupEnabled(NMF_LAYER_GROUP_MOUNTAIN) ? .destructive : .default),
                                                handler: { [weak self] (action) in
                                                    self?.mapView.setLayerGroup(NMF_LAYER_GROUP_MOUNTAIN, isEnabled: (action.style == .default))
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

}
