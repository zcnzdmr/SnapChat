//
//  PrivacyVC.swift
//  SnapChat
//
//  Created by Özcan on 29.07.2024.
//

import UIKit
import WebKit

class PrivacyVC: UIViewController, WKUIDelegate {
    
    var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapBarButton))
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.frame, configuration: webConfiguration)
        
        let myUrl = URL(string: "https://policies.google.com/privacy?hl=en-US")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
        
        view = webView
        
//        webView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//                
//            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            webView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        
//            ])
        
        webView.uiDelegate = self
        
    }
    @objc func didTapBarButton() {
        self.dismiss(animated: true)
    }
}
