//
//  SignUpVC.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FirebaseCore


class SignUpVC: UIViewController {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    let textView1 : UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.delaysContentTouches = false // while scrolling, it decelarate your touch speed.
        tv.layer.cornerRadius = 12
        tv.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        return tv
    }()
    
    private let viewModel = SignUpVM()
    private let authView = AuthHeaderView(title: "Sign Up", subtitle: "Create your account")
    private let emailTF = CustomTextField(textFieldType: .email)
    private let usernameTF = CustomTextField(textFieldType: .username)
    private let passwordTF = CustomTextField(textFieldType: .password)
    private let signUpButton = CustomButton(title: "Sign Up", buttonType: .big,hasbackground: true)
    private let signInButton = CustomButton(title: "Already have an account? Sign In.", buttonType: .medium)
    private let signInGoogle = GIDSignInButton()
    private let faceBookSignInButton = CustomButton(title: "GitHub", buttonType: .medium, hasbackground: true)
    
    
    //    override func loadView() {
    //        // this function is launched before viewDidLoad
    //        print("s")
    //    }
    
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
        signInGoogle.addTarget(self, action: #selector(didTapGoogleButton), for: .touchUpInside)
        faceBookSignInButton.addTarget(self, action: #selector(didTapGitHubButton), for: .touchUpInside)
    }
    
    @objc func  didTapSignUp() {
        
        if emailTF.text == nil || emailTF.text == "" {
            
            AlertManager.showEmptyEmailError(vc: self)
            
        }else if usernameTF.text == nil || usernameTF.text == "" {
            
            AlertManager.showEmptyUsernameError(vc: self)
            
        }else if passwordTF.text == nil || passwordTF.text == ""{
            
            AlertManager.showEmptyPasswordError(vc: self)
        }else {
            
            if let email = emailTF.text, let username = usernameTF.text, let userPassword = passwordTF.text {
                
                viewModel.signUpWithEmail(email: email, username: username, password: userPassword) { success, error in
                    
                    if success {
                        
                        DispatchQueue.main.async {
//                            let homeVC = HomePage()
//                            homeVC.modalPresentationStyle = .fullScreen
//                            self.present(homeVC, animated: true, completion: nil)
                            
                            TabBarController().setUpTabBars(vc: self)
                            
                        }
                    }else {
                        
                        if let error = error {
                            AlertManager.showRegistrationError(vc: self, error: error)
                        }
                    }
                    
                }
            }
        }
    }
    
    // MARK: Google Sign In Button Function
    @objc func didTapGoogleButton() {
        
        print("google button tapped")
        
        viewModel.googleSingIn { success, error in
            
            if success {
                print("success")
                TabBarController().setUpTabBars(vc: self)
            }else{
                AlertManager.showRandomAlert(vc: self)
            }
            
        }
    }
    
    // MARK: Sign In Button Function
    @objc func didTapSignIn() {
        //        self.navigationController?.pushViewController(SignInVC(), animated: false)
        self.navigationController?.popToRootViewController(animated: true) // this is used to be headed to rootViewController of navigation controller.
    }
    
    
    @objc func didTapGitHubButton() {
        print("didtap github button")
        viewModel.faceBookSignIn { success, error in
            
            if success {
                TabBarController().setUpTabBars(vc: self)
            }else {
                AlertManager.showRandomAlert(vc: self)
            }
            
        }
    }
    
    
    func extraComponents() {
        
        let text1 = "By creating an account you aggree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy"
        let attributedString = NSMutableAttributedString(string: text1)
        
        let termsRange1 = ( text1 as NSString).range(of: "Terms & Conditions")
        attributedString.addAttribute(.link, value: "policy", range: termsRange1)
        
        let termsRange2 = (text1 as NSString).range(of: "Privacy Policy")
        attributedString.addAttribute(.link, value: "privacy", range: termsRange2)
        
        textView1.linkTextAttributes = [.font: UIFont.systemFont(ofSize: 12, weight: .semibold),
                                        .foregroundColor : UIColor.red]
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
        self.view.addSubview(signInGoogle)
        self.view.addSubview(faceBookSignInButton)
        
        
        authView.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        usernameTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        textView1.translatesAutoresizingMaskIntoConstraints = false
        signInGoogle.translatesAutoresizingMaskIntoConstraints = false
        faceBookSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        
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
            textView1.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            textView1.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06),
         
            signInGoogle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInGoogle.topAnchor.constraint(equalTo: self.textView1.bottomAnchor, constant: 60),
            signInGoogle.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            signInGoogle.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06),
            
            faceBookSignInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            faceBookSignInButton.centerYAnchor.constraint(equalTo: self.signInGoogle.bottomAnchor, constant: 60),
            faceBookSignInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            faceBookSignInButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06)
            
        ])
    }
}


// MARK: UITextViewDelegate extension
extension SignUpVC : UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if URL.absoluteString == "policy" {
            let termsVC = TermsVC()
            let navCont = UINavigationController(rootViewController: termsVC)
            self.navigationController?.present(navCont, animated: true)
        } else if URL.absoluteString == "privacy" {
            let privacyVC = PrivacyVC()
            //                let nav = UINavigationController(rootViewController: privacyVC)
            self.navigationController?.present(privacyVC, animated: true)
        }
        return false
    }
    
    // this code is used to specify what to do with attributed string URL.
}

