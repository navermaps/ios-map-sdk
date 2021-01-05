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

import Foundation
import NMapsMap
 
 class TileCoverHelperViewController: MapViewController {
    var tileCoverHelper: NMFTileCoverHelper!
    var overlays: [Int : NMFPolygonOverlay] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tileCoverHelper = NMFTileCoverHelper(mapView)
        tileCoverHelper.delegate = self
    }
    
 }
 
 extension TileCoverHelperViewController: NMFTileCoverHelperDelegate {
    
    func onTileChanged(_ addedTileIds: [NSNumber]?, removedTileIds: [NSNumber]?) {
        if let addedTiles = addedTileIds as? [CLong] {
            for tileId in addedTiles {
                let bounds = NMFTileId.toLatLngBounds(fromTileId: tileId)
                let polygon = NMGPolygon(ring: NMGLineString(points: [bounds.southWest,
                                                                      NMGLatLng(lat: bounds.northEastLat, lng: bounds.southWestLng),
                                                                      bounds.northEast,
                                                                      NMGLatLng(lat: bounds.southWestLat, lng: bounds.northEastLng),
                                                                      bounds.southWest]))
                let overlay = NMFPolygonOverlay(polygon as! NMGPolygon<AnyObject>)
                overlay?.fillColor = UIColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)),
                                            green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)),
                                            blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)),
                                            alpha: 0.3)
                overlay?.mapView = mapView
                overlays[tileId] = overlay
            }
        }
        
        if let removeTiles = removedTileIds as? [CLong] {
            for tileId in removeTiles {
                if let overlay = overlays[tileId] {
                    overlay.mapView = nil
                    overlays.removeValue(forKey: tileId)
                }
            }
        }
    }
    
 }
