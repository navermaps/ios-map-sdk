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

class MarkerViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let param = NMFCameraUpdateParams()
        param.scroll(to: DEFAULT_CAMERA_POSITION.target)
        param.zoom(to: DEFAULT_CAMERA_POSITION.zoom)
        param.tilt(to: 30)
        param.rotate(to: 45)
        mapView.moveCamera(NMFCameraUpdate(params: param))

        let marker = NMFMarker(position: NMGLatLng(lat: 37.5666102, lng: 126.9783881))
        marker.iconImage = NMF_MARKER_IMAGE_BLACK
        marker.mapView = mapView
        
        let markerWithCustomIcon = NMFMarker(position: NMGLatLng(lat: 37.57000, lng: 126.97618))
        markerWithCustomIcon.iconImage = NMF_MARKER_IMAGE_GRAY
        markerWithCustomIcon.angle = 315
        markerWithCustomIcon.mapView = mapView
        
        let flatMarker = NMFMarker(position: NMGLatLng(lat: 37.57145, lng: 126.98191))
        flatMarker.iconImage = NMF_MARKER_IMAGE_BLUE
        flatMarker.isFlat = true
        flatMarker.angle = 90
        flatMarker.mapView = mapView
        
        let markerWithAnchor = NMFMarker(position: NMGLatLng(lat: 37.56768, lng: 126.98602))
        markerWithAnchor.iconImage = NMFOverlayImage(name: "imgInfowindow22XWhite", in: Bundle.naverMapFramework())
        markerWithAnchor.anchor = CGPoint(x: 1, y: 1)
        markerWithAnchor.angle = 90
        markerWithAnchor.mapView = mapView
        
        let markerWithCaption = NMFMarker(position: NMGLatLng(lat: 37.56436, lng: 126.97499))
        markerWithCaption.iconImage = NMF_MARKER_IMAGE_YELLOW
        markerWithCaption.captionMinZoom = 12.0
        markerWithCaption.captionAligns = [NMFAlignType.left]
        markerWithCaption.captionText = "☀캡션이 있는 마커🎉"
        markerWithCaption.mapView = mapView
        
        let markerWithSubCaption = NMFMarker(position: NMGLatLng(lat: 37.56138, lng: 126.97970))
        markerWithSubCaption.iconImage = NMF_MARKER_IMAGE_PINK
        markerWithSubCaption.captionTextSize = 14
        markerWithSubCaption.captionText = "서브 캡션이 있는 마커"
        markerWithSubCaption.captionMinZoom = 12.0
        markerWithSubCaption.subCaptionTextSize = 10
        markerWithSubCaption.subCaptionColor = UIColor.gray
        markerWithSubCaption.subCaptionText = "🇰🇷서브 캡션👩🏿‍🍳"
        markerWithSubCaption.subCaptionMinZoom = 13.0
        markerWithSubCaption.mapView = mapView

        let tintColorMarker = NMFMarker(position: NMGLatLng(lat: 37.56500, lng: 126.9783881))
        tintColorMarker.iconImage = NMF_MARKER_IMAGE_BLACK
        tintColorMarker.iconTintColor = UIColor.red
        tintColorMarker.alpha = 0.5
        tintColorMarker.mapView = mapView
    }
}
