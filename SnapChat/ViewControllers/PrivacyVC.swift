//
//  PrivacyVC.swift
//  SnapChat
//
//  Created by Özcan on 29.07.2024.
//

import UIKit
import WebKit

class PrivacyVC: UIViewController {
    
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapBarButton))
        
        let myUrl = URL(string: "https://policies.google.com/privacy?hl=en-US")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
        self.view = webView
        
    }
//    @objc func didTapBarButton() {
//        self.dismiss(animated: true) {
//            print("this view is closed") // while dissmissing or terminating Viewcontroller you can make this code do anything like sending message to other VC's or performing some task as soon as it is terminated.
//        }
//    }
}
