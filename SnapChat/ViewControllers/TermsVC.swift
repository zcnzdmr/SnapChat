//
//  TermsVC.swift
//  SnapChat
//
//  Created by Özcan on 29.07.2024.
//

import UIKit
import WebKit

class TermsVC: UIViewController,WKUIDelegate {
    
//    let texViewDeneme = UITextView()
    var webView : WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
//        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismisDoneButton))
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
        let myUrl = URL(string: "https://policies.google.com/terms?hl=en-US")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    
    @objc func dismisDoneButton() {
        self.dismiss(animated: true)
    }
   
}
