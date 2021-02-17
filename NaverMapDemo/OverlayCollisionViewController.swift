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

class OverlayCollisionViewController: MapViewController {
    
    @IBOutlet weak var captionAlignButton: UIButton!
    
    let pathString = NMGLineString(points: [
        NMGLatLng(lat: 37.5594084, lng: 126.9745830),
        NMGLatLng(lat: 37.5599980, lng: 126.9748245),
        NMGLatLng(lat: 37.5601083, lng: 126.9748951),
        NMGLatLng(lat: 37.5601980, lng: 126.9749873),
        NMGLatLng(lat: 37.5601998, lng: 126.9749896),
        NMGLatLng(lat: 37.5602478, lng: 126.9750492),
        NMGLatLng(lat: 37.5603158, lng: 126.9751371),
        NMGLatLng(lat: 37.5604241, lng: 126.9753616),
        NMGLatLng(lat: 37.5604853, lng: 126.9755401),
        NMGLatLng(lat: 37.5605225, lng: 126.9756157),
        NMGLatLng(lat: 37.5605353, lng: 126.9756405),
        NMGLatLng(lat: 37.5605652, lng: 126.9756924),
        NMGLatLng(lat: 37.5606143, lng: 126.9757679),
        NMGLatLng(lat: 37.5606903, lng: 126.9758432),
        NMGLatLng(lat: 37.5608510, lng: 126.9758919),
        NMGLatLng(lat: 37.5611353, lng: 126.9759964),
        NMGLatLng(lat: 37.5611949, lng: 126.9760186),
        NMGLatLng(lat: 37.5612383, lng: 126.9760364),
        NMGLatLng(lat: 37.5615796, lng: 126.9761721),
        NMGLatLng(lat: 37.5619326, lng: 126.9763123),
        NMGLatLng(lat: 37.5621502, lng: 126.9763991),
        NMGLatLng(lat: 37.5622776, lng: 126.9764492),
        NMGLatLng(lat: 37.5624374, lng: 126.9765137),
        NMGLatLng(lat: 37.5630911, lng: 126.9767753),
        NMGLatLng(lat: 37.5631345, lng: 126.9767931),
        NMGLatLng(lat: 37.5635163, lng: 126.9769240),
        NMGLatLng(lat: 37.5635506, lng: 126.9769351),
        NMGLatLng(lat: 37.5638061, lng: 126.9770239),
        NMGLatLng(lat: 37.5639153, lng: 126.9770605),
        NMGLatLng(lat: 37.5639577, lng: 126.9770749),
        NMGLatLng(lat: 37.5640074, lng: 126.9770927),
        NMGLatLng(lat: 37.5644783, lng: 126.9771755),
        NMGLatLng(lat: 37.5649229, lng: 126.9772482),
        NMGLatLng(lat: 37.5650330, lng: 126.9772667),
        NMGLatLng(lat: 37.5652152, lng: 126.9772971),
        NMGLatLng(lat: 37.5654569, lng: 126.9773170),
        NMGLatLng(lat: 37.5655173, lng: 126.9773222),
        NMGLatLng(lat: 37.5656534, lng: 126.9773258),
        NMGLatLng(lat: 37.5660418, lng: 126.9773004),
        NMGLatLng(lat: 37.5661985, lng: 126.9772914),
        NMGLatLng(lat: 37.5664663, lng: 126.9772952),
        NMGLatLng(lat: 37.5668827, lng: 126.9773047),
        NMGLatLng(lat: 37.5669467, lng: 126.9773054),
        NMGLatLng(lat: 37.5670567, lng: 126.9773080),
        NMGLatLng(lat: 37.5671360, lng: 126.9773097),
        NMGLatLng(lat: 37.5671910, lng: 126.9773116),
        NMGLatLng(lat: 37.5672785, lng: 126.9773122),
        NMGLatLng(lat: 37.5674668, lng: 126.9773120),
        NMGLatLng(lat: 37.5677264, lng: 126.9773124),
        NMGLatLng(lat: 37.5680410, lng: 126.9773068),
        NMGLatLng(lat: 37.5689242, lng: 126.9772871),
        NMGLatLng(lat: 37.5692829, lng: 126.9772698),
        NMGLatLng(lat: 37.5693829, lng: 126.9772669),
        NMGLatLng(lat: 37.5696659, lng: 126.9772615),
        NMGLatLng(lat: 37.5697524, lng: 126.9772575),
        NMGLatLng(lat: 37.5698659, lng: 126.9772499),
        NMGLatLng(lat: 37.5699671, lng: 126.9773070),
        NMGLatLng(lat: 37.5700151, lng: 126.9773395),
        NMGLatLng(lat: 37.5700748, lng: 126.9773866),
        NMGLatLng(lat: 37.5701164, lng: 126.9774373),
        NMGLatLng(lat: 37.5701903, lng: 126.9776225),
        NMGLatLng(lat: 37.5701905, lng: 126.9776723),
        NMGLatLng(lat: 37.5701897, lng: 126.9777006),
        NMGLatLng(lat: 37.5701869, lng: 126.9784990),
        NMGLatLng(lat: 37.5701813, lng: 126.9788591),
        NMGLatLng(lat: 37.5701770, lng: 126.9791139),
        NMGLatLng(lat: 37.5701741, lng: 126.9792702),
        NMGLatLng(lat: 37.5701743, lng: 126.9793098),
        NMGLatLng(lat: 37.5701752, lng: 126.9795182),
        NMGLatLng(lat: 37.5701761, lng: 126.9799315),
        NMGLatLng(lat: 37.5701775, lng: 126.9800380),
        NMGLatLng(lat: 37.5701800, lng: 126.9804048),
        NMGLatLng(lat: 37.5701832, lng: 126.9809189),
        NMGLatLng(lat: 37.5701845, lng: 126.9810197),
        NMGLatLng(lat: 37.5701862, lng: 126.9811986),
        NMGLatLng(lat: 37.5701882, lng: 126.9814375),
        NMGLatLng(lat: 37.5701955, lng: 126.9820897),
        NMGLatLng(lat: 37.5701996, lng: 126.9821860)
    ])
    var markers: [NMFMarker] = []
    var forceShowIcon: Bool = false
    var forceShowCaption: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NMFPath(lineString: pathString as! NMGLineString<AnyObject>)
        path?.width = 8
        path?.outlineWidth = 2
        path?.color = UIColor(red: 0, green: 196.0/255.0, blue: 46.0/255.0, alpha: 1)
        path?.outlineColor = UIColor.white
        path?.mapView = mapView
        
        if markers.isEmpty {
            let bounds = pathString.bounds as! NMGLatLngBounds
            weak var weakSelf = self
            for index in 1...50 {
                let marker = NMFMarker(position:
                    NMGLatLng(
                        lat: (bounds.northEastLat - bounds.southWestLat) * drand48() + bounds.southWestLat,
                        lng: (bounds.northEastLng - bounds.southWestLng) * drand48() + bounds.southWestLng
                    )
                )
                setImportant(marker, index < 10)
                marker.captionText = "Marker #\(index)"
                marker.touchHandler = { (overlay: NMFOverlay) -> Bool in
                    let important = (marker.tag > 0)
                    weakSelf!.setImportant(marker, !important)
                    return true
                }
                marker.mapView = mapView
                markers.append(marker)
            }
        }
    }
    
    func setImportant(_ marker: NMFMarker, _ important: Bool) {
        marker.iconImage = important ? NMF_MARKER_IMAGE_GREEN : NMF_MARKER_IMAGE_GRAY
        marker.zIndex = important ? 1 : 0
        marker.tag = UInt(truncating: NSNumber(value: important))
        marker.isForceShowIcon = important && forceShowIcon
        marker.isForceShowCaption = important && forceShowCaption
    }
    
    // MARK: - IBAction
    @IBAction func respondToHideCollidedSymbols(_ sender: UISwitch) {
        for marker in markers {
            marker.isHideCollidedSymbols = sender.isOn
        }
    }
    
    @IBAction func respondToHideCollidedMarkers(_ sender: UISwitch) {
        for marker in markers {
            marker.isHideCollidedMarkers = sender.isOn
        }
    }
    
    @IBAction func respondToHideCollidedCaption(_ sender: UISwitch) {
        for marker in markers {
            marker.isHideCollidedCaptions = sender.isOn
        }
    }
    
    @IBAction func respondToForceShowIcon(_ sender: UISwitch) {
        for marker in markers {
            let important = Bool(truncating: marker.tag as NSNumber)
            marker.isForceShowIcon = important && sender.isOn
        }
    }
    
    @IBAction func respondToForceShowCaption(_ sender: UISwitch) {
        for marker in markers {
            let important = Bool(truncating: marker.tag as NSNumber)
            marker.isForceShowCaption = important && sender.isOn
        }
    }
    
    @IBAction func respondToCaptionAlign(_ sender: UIButton) {
        let alertController = UIAlertController(title: "캡션 정렬 방향", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "아래", style: .default, handler: { [weak self] (action) in
            sender.setTitle("아래", for: .normal)
            DispatchQueue.main.async {
                for marker in self!.markers {
                    marker.captionAligns = [NMFAlignType.bottom]
                }
            }
        }))
        alertController.addAction(UIAlertAction(title: "모서리", style: .default, handler: { [weak self] (action) in
            sender.setTitle("모서리", for: .normal)
            DispatchQueue.main.async {
                for marker in self!.markers {
                    marker.captionAligns = [NMFAlignType.bottom, NMFAlignType.right, NMFAlignType.left, NMFAlignType.top]
                }
            }
        }))
        alertController.addAction(UIAlertAction(title: "꼭지점", style: .default, handler: { [weak self] (action) in
            sender.setTitle("꼭지점", for: .normal)
            DispatchQueue.main.async {
                for marker in self!.markers {
                    marker.captionAligns = [NMFAlignType.bottomRight, NMFAlignType.bottomLeft, NMFAlignType.topRight, NMFAlignType.topLeft]
                }
            }
        }))
        alertController.addAction(UIAlertAction(title: "바깥쪽", style: .default, handler: { [weak self] (action) in
            sender.setTitle("바깥쪽", for: .normal)
            DispatchQueue.main.async {
                for marker in self!.markers {
                    marker.captionAligns = [NMFAlignType.bottom, NMFAlignType.right, NMFAlignType.left, NMFAlignType.top, NMFAlignType.bottomRight, NMFAlignType.bottomLeft, NMFAlignType.topRight, NMFAlignType.topLeft]
                }
            }
        }))

        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = view
                popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
        }
        present(alertController, animated: true, completion: nil)
    }
}
