//
//  ControlSettingViewController.swift
//  NaverMapDemo
//
//  Created by Won-Young Son on 2018. 9. 25..
//  Copyright © 2018년 NaverCorp. All rights reserved.
//

import UIKit
import NMapsMap

class ControlSettingsViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let param = NMFCameraUpdateParams()
        param.scroll(to: NMGLatLngMake(37.5116620, 127.0594274))
        param.zoom(to: 16)
        param.tilt(to: 0)
        param.rotate(to: 90)
        mapView.moveCamera(NMFCameraUpdate(params: param))
    }
    
    @IBAction func respondToSwitch(_ sender: UISwitch) {
        switch sender.tag {
        case 0: // compass
            naverMapView.showCompass = sender.isOn
            break
        case 1: // scale
            naverMapView.showScale = sender.isOn
            break
        case 2: // zoom
            naverMapView.showZoomControls = sender.isOn
            break
        case 3: // indoor
            naverMapView.showIndoorMap = sender.isOn
            break
        case 4: // location
            naverMapView.showUserLocation = sender.isOn
            break
        default:
            break
        }
    }

}
