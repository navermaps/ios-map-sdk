/*
 Copyright 2018-2025 NAVER Corp.
 
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

class ComplexClusteringViewController: MapViewController {
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
    
    class ItemData: NSObject {
        let name: String
        let gu: String

        init(name: String, gu: String) {
            self.name = name
            self.gu = gu
        }
    }
    
    class MarkerManager: NMCDefaultMarkerManager {
        override func createMarker() -> NMFMarker {
            let marker = super.createMarker()
            marker.subCaptionTextSize = 10
            marker.subCaptionColor = UIColor.white
            marker.subCaptionHaloColor = UIColor.clear
            return marker
        }
    }
    
    // 데이터 © 서울특별시 (CC BY)
    // 서울 열린데이터 광장 - 서울시 공중화장실 위치정보
    // http://data.seoul.go.kr/dataList/OA-1370/S/1/datasetView.do
    // 2023.04.19.
    let CSV_ASSET_NAME = "seoul_toilet"
    
    let defaultDistanceStrategy = NMCDefaultDistanceStrategy()
    
    var clusterer: NMCClusterer<ItemKey>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(DEFAULT_CAMERA_POSITION.target, zoom: 10)))
        
        let builder = NMCComplexBuilder<ItemKey>()
        builder.minClusteringZoom = 9
        builder.maxClusteringZoom = 16
        builder.maxScreenDistance = 200
        builder.thresholdStrategy = self
        builder.distanceStrategy = self
        builder.tagMergeStrategy = self
        builder.markerManager = MarkerManager()
        builder.leafMarkerUpdater = self
        builder.clusterMarkerUpdater = self
        self.clusterer = builder.build()
        
        var keyTagMap = [ItemKey: ItemData]()
        do {
            if let path = Bundle.main.path(forResource: CSV_ASSET_NAME, ofType: "csv") {
                let contents = try String(contentsOfFile: path, encoding: .utf8)
                let lines = contents.components(separatedBy: .newlines)
                for (i, line) in lines.enumerated() {
                    let split = line.components(separatedBy: ",")
                    if split.count > 3 {
                        let key = ItemKey(identifier: i, position: NMGLatLng(lat: Double(split[3]) ?? 0.0, lng: Double(split[2]) ?? 0.0))
                        keyTagMap[key] = ItemData(name: split[0], gu: split[1])
                    }
                }
            }
        } catch {
        }
        self.clusterer?.addAll(keyTagMap)
        self.clusterer?.mapView = self.mapView
    }
}

extension ComplexClusteringViewController: NMCThresholdStrategy, NMCDistanceStrategy, NMCTagMergeStrategy,
                                           NMCClusterMarkerUpdater, NMCLeafMarkerUpdater {
    func getThreshold(_ zoom: Int) -> Double {
        if zoom <= 11 {
            return 0
        } else {
            return 70
        }
    }
    
    func getDistance(_ zoom: Int, node1: NMCNode, node2: NMCNode) -> Double {
        if zoom <= 9 {
            return -1
        }
        assert(node1.tag != nil)
        assert(node2.tag != nil)
        if let tag1 = node1.tag as? ItemData, let tag2 = node2.tag as? ItemData, tag1.gu == tag2.gu {
            if zoom <= 11 {
                return -1
            } else {
                return defaultDistanceStrategy.getDistance(zoom, node1: node1, node2: node2)
            }
        }
        return 10000
    }
    
    func mergeTag(_ cluster: NMCCluster) -> NSObject? {
        if cluster.maxZoom > 9 {
            if let tag = cluster.children.first?.tag as? ItemData {
                return ItemData(name: "", gu: tag.gu)
            }
        }
        return nil;
    }
    
    func updateClusterMarker(_ info: NMCClusterMarkerInfo, _ marker: NMFMarker) {
        let size = info.size
        if info.minZoom <= 10 {
            marker.iconImage = NMF_MARKER_IMAGE_CLUSTER_HIGH_DENSITY
        } else if size < 10 {
            marker.iconImage = NMF_MARKER_IMAGE_CLUSTER_LOW_DENSITY
        } else {
            marker.iconImage = NMF_MARKER_IMAGE_CLUSTER_MEDIUM_DENSITY
        }
        if info.minZoom == 10 {
            assert(info.tag != nil)
            if let tag = info.tag as? ItemData {
                marker.subCaptionText = tag.gu;
            }
        } else {
            marker.subCaptionText = ""
        }
        marker.anchor = NMF_CLUSTER_ANCHOR_DEFAULT
        marker.captionText = String(size)
        marker.captionAligns = [NMFAlignType.center]
        marker.captionColor = UIColor.white
        marker.captionHaloColor = UIColor.clear
        marker.touchHandler = { overlay in
            if let mapView = overlay.mapView {let position = NMFCameraPosition(info.position, zoom: Double(info.maxZoom + 1))
                let cameraUpdate = NMFCameraUpdate(position: position)
                cameraUpdate.animation = .easeIn
                mapView.moveCamera(cameraUpdate)
            }
            return true
        }
    }
    
    func updateLeafMarker(_ info: NMCLeafMarkerInfo, _ marker: NMFMarker) {
        assert(info.tag != nil)
        marker.iconImage = NMF_MARKER_IMAGE_DEFAULT
        marker.anchor = NMF_MARKER_ANCHOR_DEFAULT
        if let tag = info.tag as? ItemData {
            marker.captionText = tag.name;
        }
        marker.captionAligns = [NMFAlignType.bottom]
        marker.captionColor = UIColor.black
        marker.captionHaloColor = UIColor.white
        marker.subCaptionText = ""
        marker.touchHandler = nil
    }
}
