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

class MultipartPathOverlayViewController: MapViewController {

    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!

    var progressMultipartPath: NMFMultipartPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.touchDelegate = self

        let width: CGFloat = 8
        let outlineWidth: CGFloat = 2
        
        if let lineString = MultipartData.lineString1 as? [NMGLineString<AnyObject>], let multipartPathOverlay = NMFMultipartPath(lineString) {
            multipartPathOverlay.colorParts = MultipartData.colors1
            multipartPathOverlay.width = width
            multipartPathOverlay.outlineWidth = outlineWidth
            multipartPathOverlay.progress = 0.3
            multipartPathOverlay.mapView = naverMapView.mapView
            progressMultipartPath = multipartPathOverlay
        }
        
        if let lineString = MultipartData.lineString2 as? [NMGLineString<AnyObject>], let multipartPathWithPattern = NMFMultipartPath(lineString) {
            multipartPathWithPattern.colorParts = MultipartData.colors2
            multipartPathWithPattern.width = width
            multipartPathWithPattern.outlineWidth = 0
            multipartPathWithPattern.patternIcon = NMFOverlayImage(image: #imageLiteral(resourceName: "route_path_arrow"))
            multipartPathWithPattern.patternInterval = 10
            multipartPathWithPattern.mapView = naverMapView.mapView
        }
    }

    // MARK: - IBAction
    
    @IBAction func respondToProgress(_ sender: UISlider) {
        progressMultipartPath?.progress = Double(sender.value)
        progressLabel.text = "\(Int(sender.value * 100))%"
    }

}
 
 // MARK:- MapView Touch Delegate
 
 extension MultipartPathOverlayViewController: NMFMapViewTouchDelegate {
     func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        if let multipartPathOverlay = progressMultipartPath {
            let progress = NMFGeometryUtils.progress(with: multipartPathOverlay.lineParts, targetLatLng: latlng)
            multipartPathOverlay.progress = progress
            progressSlider.value = Float(progress)
            progressLabel.text = "\(Int(progress * 100))%"
        }
    }
 }

 struct MultipartData {
    static let lineString1: [NMGLineString<NMGLatLng>] = [
        NMGLineString(points: [
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
            NMGLatLng(lat: 37.5611949, lng: 126.9760186)]),
        NMGLineString(points: [
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
            NMGLatLng(lat: 37.5649229, lng: 126.9772482)]),
        NMGLineString(points: [
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
            NMGLatLng(lat: 37.5672785, lng: 126.9773122)]),
        NMGLineString(points: [
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
            NMGLatLng(lat: 37.5701869, lng: 126.9784990)]),
        NMGLineString(points: [
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
            NMGLatLng(lat: 37.5701996, lng: 126.9821860)])
    ]

    static let lineString2: [NMGLineString<NMGLatLng>] = [
        NMGLineString(points: [
            NMGLatLng(lat: 37.5660645, lng: 126.9826732),
            NMGLatLng(lat: 37.5660294, lng: 126.9826723),
            NMGLatLng(lat: 37.5658526, lng: 126.9826611),
            NMGLatLng(lat: 37.5658040, lng: 126.9826580),
            NMGLatLng(lat: 37.5657697, lng: 126.9826560),
            NMGLatLng(lat: 37.5654413, lng: 126.9825880),
            NMGLatLng(lat: 37.5652157, lng: 126.9825273),
            NMGLatLng(lat: 37.5650560, lng: 126.9824843),
            NMGLatLng(lat: 37.5647789, lng: 126.9824114),
            NMGLatLng(lat: 37.5646788, lng: 126.9823861),
            NMGLatLng(lat: 37.5644062, lng: 126.9822963),
            NMGLatLng(lat: 37.5642519, lng: 126.9822566),
            NMGLatLng(lat: 37.5641517, lng: 126.9822312),
            NMGLatLng(lat: 37.5639965, lng: 126.9821915),
            NMGLatLng(lat: 37.5636536, lng: 126.9820920),
            NMGLatLng(lat: 37.5634424, lng: 126.9820244),
            NMGLatLng(lat: 37.5633241, lng: 126.9819890),
            NMGLatLng(lat: 37.5632772, lng: 126.9819712),
            NMGLatLng(lat: 37.5629404, lng: 126.9818433),
            NMGLatLng(lat: 37.5627733, lng: 126.9817584),
            NMGLatLng(lat: 37.5626694, lng: 126.9816980)]),
        NMGLineString(points: [
            NMGLatLng(lat: 37.5626694, lng: 126.9816980),
            NMGLatLng(lat: 37.5624588, lng: 126.9815738),
            NMGLatLng(lat: 37.5620376, lng: 126.9813140),
            NMGLatLng(lat: 37.5619426, lng: 126.9812252),
            NMGLatLng(lat: 37.5613227, lng: 126.9814831),
            NMGLatLng(lat: 37.5611995, lng: 126.9815372),
            NMGLatLng(lat: 37.5609414, lng: 126.9816749),
            NMGLatLng(lat: 37.5606785, lng: 126.9817390),
            NMGLatLng(lat: 37.5605659, lng: 126.9817499),
            NMGLatLng(lat: 37.5604892, lng: 126.9817459),
            NMGLatLng(lat: 37.5604540, lng: 126.9817360),
            NMGLatLng(lat: 37.5603484, lng: 126.9816993),
            NMGLatLng(lat: 37.5602092, lng: 126.9816097),
            NMGLatLng(lat: 37.5600048, lng: 126.9814390)]),
        NMGLineString(points: [
            NMGLatLng(lat: 37.5600048, lng: 126.9814390),
            NMGLatLng(lat: 37.5599702, lng: 126.9813612),
            NMGLatLng(lat: 37.5599401, lng: 126.9812923),
            NMGLatLng(lat: 37.5597114, lng: 126.9807346),
            NMGLatLng(lat: 37.5596905, lng: 126.9806826),
            NMGLatLng(lat: 37.5596467, lng: 126.9805663),
            NMGLatLng(lat: 37.5595203, lng: 126.9801199),
            NMGLatLng(lat: 37.5594901, lng: 126.9800149),
            NMGLatLng(lat: 37.5594544, lng: 126.9798883),
            NMGLatLng(lat: 37.5594186, lng: 126.9797436),
            NMGLatLng(lat: 37.5593948, lng: 126.9796634),
            NMGLatLng(lat: 37.5593132, lng: 126.9793526),
            NMGLatLng(lat: 37.5592831, lng: 126.9792622),
            NMGLatLng(lat: 37.5590904, lng: 126.9788854),
            NMGLatLng(lat: 37.5589081, lng: 126.9786365),
            NMGLatLng(lat: 37.5587088, lng: 126.9784125),
            NMGLatLng(lat: 37.5586699, lng: 126.9783698)])
    ]
    
    static let colors1: [NMFPathColor] = [
        NMFPathColor(color: UIColor.red, outlineColor: UIColor.white, passedColor: UIColor.gray, passedOutlineColor: UIColor.white),
        NMFPathColor(color: UIColor.yellow, outlineColor: UIColor.white, passedColor: UIColor.gray, passedOutlineColor: UIColor.white),
        NMFPathColor(color: UIColor.green, outlineColor: UIColor.white, passedColor: UIColor.gray, passedOutlineColor: UIColor.white),
        NMFPathColor(color: UIColor.red, outlineColor: UIColor.white, passedColor: UIColor.gray, passedOutlineColor: UIColor.white),
        NMFPathColor(color: UIColor.yellow, outlineColor: UIColor.white, passedColor: UIColor.gray, passedOutlineColor: UIColor.white)
    ]
    
    static let colors2: [NMFPathColor] = [
        NMFPathColor(color: UIColor.lightGray, outlineColor: UIColor.white, passedColor: UIColor.lightGray, passedOutlineColor: UIColor.white),
        NMFPathColor(color: UIColor.gray, outlineColor: UIColor.white, passedColor: UIColor.gray, passedOutlineColor: UIColor.white),
        NMFPathColor(color: UIColor.darkGray, outlineColor: UIColor.white, passedColor: UIColor.darkGray, passedOutlineColor: UIColor.white)
    ]
 }
