//
//  SignUpVC.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    private let authView = AuthHeaderView(title: "Sign Up", subtitle: "Create your account")
    private let emailTF = CustomTextField(textFieldType: .email)
    private let usernameTF = CustomTextField(textFieldType: .username)
    private let passwordTF = CustomTextField(textFieldType: .password)
    private let signUpButton = CustomButton(title: "Sign Up", buttonType: .big,hasbackground: true)
    private let signInButton = CustomButton(title: "Already have an account? Sign In.", buttonType: .medium)
    
    private let termsLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setUpUI()
        tapGesture()
    }
    
    func tapGesture() {
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel))
        view.addGestureRecognizer(tapGestureRecognizer1)
    }
    
    
        func extraComponents() {
    
            let text1 = "By creating an account you aggree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy"
            termsLabel.text = text1
            termsLabel.textAlignment = .center
    //        termsLabel.layer.borderWidth = 1
            termsLabel.font = .systemFont(ofSize: 10, weight: .medium)
            termsLabel.numberOfLines = .zero
            termsLabel.isUserInteractionEnabled = true
    
        }
    
    
    @objc func handleTapOnLabel(gesture: UITapGestureRecognizer) {
        
    }
    
    
    //MARK: UI SETUP
    private func setUpUI() {
        
        self.view.addSubview(authView)
        self.view.addSubview(emailTF)
        self.view.addSubview(usernameTF)
        self.view.addSubview(passwordTF)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)
        self.view.addSubview(termsLabel)
        
        
        authView.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            authView.topAnchor.constraint(equalTo: self.view.topAnchor),
            authView.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 270),
            authView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            authView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            
            emailTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            emailTF.topAnchor.constraint(equalTo: authView.bottomAnchor, constant: 30),
            emailTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            emailTF.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            
            usernameTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            usernameTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 10),
            usernameTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            usernameTF.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            
            passwordTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 10),
            passwordTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            passwordTF.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            
            
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 15),
            signUpButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            signUpButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            
            
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 80),
            signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            signInButton.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.05),
            
            
            termsLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            termsLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 8),
            termsLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.80),
            termsLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09)
            
        ])
    }
}

