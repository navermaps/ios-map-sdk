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

class LocaleViewController: MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction

    @IBAction func respondToLocale(_ sender: UIButton) {
        let alertController = UIAlertController(title: "언어 설정", message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "시스템 설정 사용", style: .default, handler: { [weak self] (action) in
            self?.mapView.locale = nil
            sender.setTitle(action.title, for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "한국어", style: .default, handler: { [weak self] (action) in
            self?.mapView.locale = "ko-KR"
            sender.setTitle(action.title, for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "English", style: .default, handler: { [weak self] (action) in
            self?.mapView.locale = "en-US"
            sender.setTitle(action.title, for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "日本語", style: .default, handler: { [weak self] (action) in
            self?.mapView.locale = "ja-JP"
            sender.setTitle(action.title, for: .normal)
        }))
        alertController.addAction(UIAlertAction(title: "中文", style: .default, handler: { [weak self] (action) in
            self?.mapView.locale = "zh-CN"
            sender.setTitle(action.title, for: .normal)
        }))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = view
                popoverController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
                present(alertController, animated: true, completion: nil)
            }
        } else {
            present(alertController, animated: true, completion: nil)
        }
    }

}
