//
//  SignInVC.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class SignInVC: UIViewController {
    
    
    var headerView = AuthHeaderView(title: "Sign In", subtitle: "Sign in to your account")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
    }
    
    
    //MARK: UI SETUP
    private func setUpUI() {
        
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3)
        ])
    }
    
}
