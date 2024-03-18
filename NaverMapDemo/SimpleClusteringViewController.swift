/*
 Copyright 2018-2024 NAVER Corp.
 
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

let ICONS: [NMFOverlayImage] = [
    NMF_MARKER_IMAGE_DEFAULT,
    NMF_MARKER_IMAGE_BLUE,
    NMF_MARKER_IMAGE_RED,
    NMF_MARKER_IMAGE_YELLOW
]

class SimpleClusteringViewController: MapViewController {
    class ItemKey: NSObject, NMCClusteringKey {
        let identifier: Int
        let position: NMGLatLng

        init(identifier: Int, position: NMGLatLng) {
            self.identifier = identifier
            self.position = position
        }

        static func markerKey(withIdentifier identifier: Int, position: NMGLatLng) -> ItemKey {
            return ItemKey(identifier: identifier, position: position)
        }

        override func isEqual(_ o: Any?) -> Bool {
            guard let o = o as? ItemKey else {
                return false
            }
            if self === o {
                return true
            }

            return o.identifier == self.identifier
        }

        override var hash: Int {
            return self.identifier
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            return ItemKey(identifier: self.identifier, position: self.position)
        }
    }
    
    class LeafMarkerUpdater: NMCDefaultLeafMarkerUpdater {
        var clusterer: NMCClusterer<ItemKey>?
        
        override func updateLeafMarker(_ info: NMCLeafMarkerInfo, _ marker: NMFMarker) {
            super.updateLeafMarker(info, marker)
            assert(info.tag != nil)
            marker.iconImage = ICONS[info.tag as! Int]
            marker.touchHandler = { [weak self] (overlay: NMFOverlay) -> Bool in
                if let clusterer = self?.clusterer, let key = info.key as? ItemKey {
                    clusterer.remove(key)
                }
                return true
            }
        }
    }

    var clusterer: NMCClusterer<ItemKey>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let EXTENT_KOREA = NMGLatLngBounds(southWest: NMGLatLng(lat: 31.43, lng: 122.37),
                                           northEast: NMGLatLng(lat: 44.35, lng: 132))
        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(EXTENT_KOREA.center, zoom: 4)))
        
        let builder = NMCBuilder<ItemKey>()
        let leafMarkerUpdater = LeafMarkerUpdater()
        builder.leafMarkerUpdater = leafMarkerUpdater
        self.clusterer = builder.build()
        leafMarkerUpdater.clusterer = self.clusterer
        
        let south = EXTENT_KOREA.southWestLat
        let west = EXTENT_KOREA.southWestLng
        let height = EXTENT_KOREA.northEastLat - south
        let width = EXTENT_KOREA.northEastLng - west
        
        var keyTagMap = [ItemKey: NSObject]()
        for i in 0..<5000 {
            let key = ItemKey(identifier: i, position: NMGLatLng(lat: height * Double.random(in: 0...1) + south, lng: width * Double.random(in: 0...1) + west))
            keyTagMap[key] = NSNumber(value: Int.random(in: 0..<ICONS.count))
        }
        
        self.clusterer?.addAll(keyTagMap)
        self.clusterer?.mapView = self.mapView
    }
}
