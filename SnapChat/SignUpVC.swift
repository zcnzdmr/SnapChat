//
//  SignUpVC.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    
    let textView1 : UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.layer.cornerRadius = 12
        tv.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        return tv
    }()
    
    
    private let authView = AuthHeaderView(title: "Sign Up", subtitle: "Create your account")
    private let emailTF = CustomTextField(textFieldType: .email)
    private let usernameTF = CustomTextField(textFieldType: .username)
    private let passwordTF = CustomTextField(textFieldType: .password)
    private let signUpButton = CustomButton(title: "Sign Up", buttonType: .big,hasbackground: true)
    private let signInButton = CustomButton(title: "Already have an account? Sign In.", buttonType: .medium)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        extraComponents()
        setUpUI()
        addTargetsToButtons()
    }
    
    private func addTargetsToButtons() {
        
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
    }
    
    @objc func didTapSignUp() {
        self.navigationController?.show(HomePage(), sender: nil)
    }
    
    @objc func didTapSignIn() {
        //        self.navigationController?.pushViewController(SignInVC(), animated: false)
        self.navigationController?.popToRootViewController(animated: true) // this is used to be headed to rootViewController of navigation controller.
    }
    
    
    func extraComponents() {
        
        
        
        let text1 = "By creating an account you aggree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy"
        let attributedString = NSMutableAttributedString(string: text1)
        
        let termsRange1 = ( text1 as NSString).range(of: "Terms & Conditions")
        attributedString.addAttribute(.link, value: "terms://", range: termsRange1)
        
        let termsRange2 = (text1 as NSString).range(of: "Privacy Policy")
        attributedString.addAttribute(.link, value: "privacy://", range: termsRange2)
        
        textView1.attributedText = attributedString
        textView1.delegate = self
        
    }
    
    
    //MARK: UI SETUP
    private func setUpUI() {
        
        self.view.addSubview(authView)
        self.view.addSubview(emailTF)
        self.view.addSubview(usernameTF)
        self.view.addSubview(passwordTF)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)
        self.view.addSubview(textView1)
        
        
        authView.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        textView1.translatesAutoresizingMaskIntoConstraints = false
        
        
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
            
            
            textView1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textView1.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 8),
            textView1.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.88),
            textView1.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06)
            
        ])
    }
}


// MARK: UITextViewDelegate extension
extension SignUpVC : UITextViewDelegate {
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
            if URL.scheme == "terms" {
                let termsVC = TermsVC()
                self.navigationController?.present(termsVC, animated: true)
            } else if URL.scheme == "privacy" {
                let privacyVC = PrivacyVC()
                self.navigationController?.present(privacyVC, animated: true)
            }
            return true
        }
    // this code is used to specify what to do with attributed string URL. 
}

