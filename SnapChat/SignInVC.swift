//
//  SignInVC.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: UI Components
    private let headerView = AuthHeaderView(title: "Sign In", subtitle: "Sign in to your account")
    private let usernameTF = CustomTextField(textFieldType: .username)
    private let password = CustomTextField(textFieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", buttonType: .big, hasbackground: true)
    private let signUpButton = CustomButton(title: "New user? Create Account", buttonType: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    //MARK: UI SETUP
    private func setUpUI() {
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameTF)
        self.view.addSubview(password)
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        
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
            password.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            
            signInButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            signInButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            signUpButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06)
            
        ])
    }
    
}
