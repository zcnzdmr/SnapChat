//
//  SignInVC.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class SignInVC: UIViewController {
    
    
    // it is used to terminate keyboard that is open on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    let ViewModel = SignInVM()
    
    // MARK: UI Components
    private let headerView = AuthHeaderView(title: "Sign In", subtitle: "Sign in to your account")
    private let emailTF = CustomTextField(textFieldType: .email)
    private let password = CustomTextField(textFieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", buttonType: .big, hasbackground: true)
    private let signUpButton = CustomButton(title: "New user? Create Account", buttonType: .medium)
    private let forgotPasswordButton = CustomButton(title: "Forgot password ?", buttonType: .small)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpUI()
        buttonsTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true // it is used to hide backbutton after navigating from TabBars
    }
    
    private func buttonsTarget() {
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didTapsigUp), for: .touchUpInside)
    }
    
    @objc func didTapSignIn() {
        // TODO: Add user signing in function of Firebase and if statements for alerts
//        self.navigationController?.pushViewController(HomePage(), animated: true)
        
        if emailTF.text == nil || emailTF.text == "" {
            
            AlertManager.showEmptyEmailError(vc: self)
          
        }else if password.text == nil || password.text == ""{
            
            AlertManager.showEmptyPasswordError(vc: self)
        }else {
            
            if let email = emailTF.text, let password = password.text {
                self.ViewModel.signInWithEmail(email: email, password: password) { success, error in
                    
                    if success {
                        DispatchQueue.main.async {
                            
                            let tab = TabBarController()
                            tab.setUpTabBars(vc: self)
                        }
                    }else{
                        
                        if let error = error {
                            AlertManager.showRegistrationError(vc: self, error: error)
                        }
                    }
                    
                }
                
                
            }
            

        }
    }
    
    @objc func didTapsigUp() {
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
        //        self.navigationController?.present(SignUpVC(), animated: true) // this is for modal presentation
    }
    
    @objc func didTapForgotPassword() {
        self.navigationController?.pushViewController(ForgotVC(), animated: true)
    }
    
    
    //MARK: UI SETUP
    private func setUpUI() {
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailTF)
        self.view.addSubview(password)
        self.view.addSubview(signInButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            
            emailTF.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300),
            emailTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            emailTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            emailTF.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            
            password.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 10),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            password.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            
            
            signInButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 50),
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            signInButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 8),
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            signUpButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            
            
            forgotPasswordButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 5),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 90),
            forgotPasswordButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.45),
            forgotPasswordButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04)
            
        ])
    }
    
}
