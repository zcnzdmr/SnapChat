//
//  SignInVC.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: UI Components
    let headerView = AuthHeaderView(title: "Sign In", subtitle: "Sign in to your account")
    let usernameTF = CustomTextField(textFieldType: .username)
    let password = CustomTextField(textFieldType: .password)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
    }
    
    
    //MARK: UI SETUP
    private func setUpUI() {
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameTF)
        self.view.addSubview(password)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            
            usernameTF.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300),
            usernameTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            usernameTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            usernameTF.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            
            password.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 10),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            password.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            
        ])
    }
    
}
