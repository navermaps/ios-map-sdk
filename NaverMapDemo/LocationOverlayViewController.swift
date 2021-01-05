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

class LocationOverlayViewController: MapViewController {
    
    @IBOutlet weak var headingSlider: UISlider!
    @IBOutlet weak var headingLabel: UILabel!
    
    var circleTimer: CADisplayLink?
    var opacity: Double = 0
    var radius: Double = 10
    var counter: Int = 0
    let circleColor = UIColor(red: 0.58, green: 0.78, blue: 0.98, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.touchDelegate = self
        
        let locationOverlay = naverMapView.mapView.locationOverlay
        locationOverlay.location = DEFAULT_CAMERA_POSITION.target
        locationOverlay.circleOutlineWidth = 0
        locationOverlay.hidden = false
        locationOverlay.icon = NMFOverlayImage(name: "imgLocationDirection", in: Bundle.naverMapFramework())
        locationOverlay.subIcon = nil
        locationOverlay.circleColor = circleColor
        weak var weakSelf = self
        locationOverlay.touchHandler = { Bool in
            weakSelf?.circleAnimation(true)
            return true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        circleTimer = CADisplayLink(target: self, selector: #selector(updateCircle))
        if #available(iOS 10.0, *) {
            circleTimer?.preferredFramesPerSecond = 20
        } else {
            // Fallback on earlier versions
            // CADisplayLink.frameInterval does not support more than 60 FPS (and
            // no device that supports >60 FPS ever supported iOS 9).
            let maximumFrameRate = 60
            let newFrameRate = 20
            
            circleTimer?.frameInterval = maximumFrameRate / min(newFrameRate, maximumFrameRate)
        }
        circleTimer?.add(to: RunLoop.current, forMode: RunLoop.Mode.default)
        circleTimer?.isPaused = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        circleTimer?.invalidate()
    }
    
    func circleAnimation(_ animated: Bool) {
        let locationOverlay = naverMapView.mapView.locationOverlay
        opacity = 1
        radius = 10
        locationOverlay.circleRadius = 0
        
        if animated {
            circleTimer?.isPaused = false
            counter = 0
        } else {
            circleTimer?.isPaused = true
        }
    }
    
    @objc func updateCircle() {
        let locationOverlay = naverMapView.mapView.locationOverlay
        let duration = circleTimer?.duration ?? 0
        let constantValue = duration * 250
        radius += 1.0 * constantValue;
        opacity -= 0.02 * constantValue;
        
        locationOverlay.circleRadius = CGFloat(radius)
        locationOverlay.circleColor = circleColor.withAlphaComponent(CGFloat(opacity))
        if radius > 50.0 {
            radius = 10;
            opacity = 1;
            counter += 1
            if counter > 2 {
                counter = 0
                circleAnimation(false)
            }
        }
    }
    
    // MARK:- IBActions
    @IBAction func respondToHeadingSlider(_ sender: UISlider) {
        let locationOverlay = naverMapView.mapView.locationOverlay
        locationOverlay.heading = CGFloat(sender.value)
        headingLabel.text = "\(Int(sender.value))°"
    }
}
 
 // MARK:- MapView Touch Delegate
 
 extension LocationOverlayViewController: NMFMapViewTouchDelegate {
     func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        naverMapView.mapView.locationOverlay.location = latlng
        circleAnimation(true)
    }
 }
