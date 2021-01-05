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

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.8274509804, blue: 0.3254901961, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func respondToMoreOption(_ sender: Any) {
        let alertController = UIAlertController(title: "Menu", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "캐시 초기화", style: .default, handler: { [weak self] (action) in
            DispatchQueue.main.async {
                NMFOfflineStorage.shared.flushCache(completionHandler: { (error) in
                    let alert = UIAlertController(title: error != nil ? "캐시 초기화 실패" : "캐시 초기화",
                                                  message: error != nil ? error?.localizedDescription : "",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                })
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "버전 정보", style: .default, handler: { [weak self] (action) in
            var versionString = "Version \(Bundle.naverMapFramework().infoDictionary?["CFBundleShortVersionString"] as! String)\n\n"
            versionString += "Copyright © 2018-2021 NAVER Corp.\nAll rights reserved."
            let alert = UIAlertController(title: "NAVER Map iOS SDK", message: versionString, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            let messageText = NSAttributedString(
                string: versionString,
                attributes: [
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.foregroundColor : UIColor.black,
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)
                ]
            )
            alert.setValue(messageText, forKey: "attributedMessage")
            self?.present(alert, animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "오픈소스 라이선스", style: .default, handler: { action in
            let mapView = NMFMapView()
            mapView.showOpenSourceLicense()
        }))
        
        alertController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
 }
