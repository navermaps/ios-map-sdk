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

class OverlayMinMaxZoomController: MapViewController {
    @IBOutlet weak var zoomView: ZoomLevelView!
    
    let marker1Caption: String = "[15, 17]"
    let marker2Caption: String = "(15, 17]"
    let marker3Caption: String = "[15, 17)"
    let marker4Caption: String = "(15, 17)"

    let overlayMinZoom: Double = 15.0
    let overlayMaxZoom: Double = 17.0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addCameraDelegate(delegate: self)
        
        resetCamera()
        
        let marker1: NMFMarker = NMFMarker()
        marker1.iconImage = NMF_MARKER_IMAGE_RED
        marker1.position = NMGLatLng(lat: 37.56713851901027, lng: 126.97891430703686)
        marker1.captionText = marker1Caption
        marker1.minZoom = overlayMinZoom
        marker1.isMinZoomInclusive = true
        marker1.maxZoom = overlayMaxZoom
        marker1.isMaxZoomInclusive = true
        marker1.mapView = mapView
        
        let marker2: NMFMarker = NMFMarker()
        marker2.iconImage = NMF_MARKER_IMAGE_BLUE
        marker2.position = NMGLatLng(lat: 37.56713851901027, lng: 126.97786189296272)
        marker2.captionText = marker2Caption
        marker2.minZoom = overlayMinZoom
        marker2.isMinZoomInclusive = false
        marker2.maxZoom = overlayMaxZoom
        marker2.isMaxZoomInclusive = true
        marker2.mapView = mapView
        
        let marker3: NMFMarker = NMFMarker()
        marker3.iconImage = NMF_MARKER_IMAGE_GREEN
        marker3.position = NMGLatLng(lat: 37.566081877242425, lng: 126.97891430703686)
        marker3.captionText = marker3Caption
        marker3.minZoom = overlayMinZoom
        marker3.isMinZoomInclusive = true
        marker3.maxZoom = overlayMaxZoom
        marker3.isMaxZoomInclusive = false
        marker3.mapView = mapView
        
        let marker4: NMFMarker = NMFMarker()
        marker4.iconImage = NMF_MARKER_IMAGE_YELLOW
        marker4.position = NMGLatLng(lat: 37.566081877242425, lng: 126.97786189296272)
        marker4.captionText = marker4Caption
        marker4.minZoom = overlayMinZoom
        marker4.isMinZoomInclusive = false
        marker4.maxZoom = overlayMaxZoom
        marker4.isMaxZoomInclusive = false
        marker4.mapView = mapView
                
        zoomView.setZoomLevel(mapView.zoomLevel)
    }
    
    // MARK:- IBAction

    @IBAction func actionRefresh(_ sender: UIButton) {
        resetCamera()
    }
    
    // MARK:- Internal
    func resetCamera() {
        let cameraUpdate: NMFCameraUpdate = NMFCameraUpdate(scrollTo: DEFAULT_CAMERA_POSITION.target, zoomTo: 16.0)
        cameraUpdate.animation = .easeIn
        mapView.moveCamera(cameraUpdate)
    }
}

// MARK:- MapView Camera Delegate

extension OverlayMinMaxZoomController: NMFMapViewCameraDelegate {
    func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        zoomView.setZoomLevel(mapView.zoomLevel)
    }
    
    func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        zoomView.setZoomLevel(mapView.zoomLevel)
    }
}
