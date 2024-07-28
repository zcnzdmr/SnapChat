//
//  CustomTextField.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class CustomTextField: UITextField {
    
    enum TextFieldType {
        case username
        case email
        case password
    }
    
    private let authFieldType : TextFieldType
    
//    private let userNameTF : UITextField  = {
//        
//        let textField = UITextField()
//        textField.placeholder = "  username or email"
//        textField.keyboardType = .emailAddress
//        textField.textAlignment = .left
//        textField.autocapitalizationType = .none
//        textField.autocorrectionType = .no
//        textField.textContentType = .emailAddress
//        textField.layer.cornerRadius = 10
//        textField.layer.borderColor = UIColor(.gray.opacity(0.8)).cgColor
//        textField.layer.borderWidth = 1
//        textField.font = .systemFont(ofSize: 15, weight: .medium)
//        return textField
//    }()
    
//    private let passwordTF : UITextField  = {
//        
//        let textField = UITextField()
//        textField.placeholder = "  password"
//        textField.keyboardType = .default
//        textField.textAlignment = .left
//        textField.autocapitalizationType = .none
//        textField.autocorrectionType = .no
//        textField.isSecureTextEntry = true
//        textField.layer.cornerRadius = 10
//        textField.layer.borderColor = UIColor(.gray.opacity(0.8)).cgColor
//        textField.textContentType = .oneTimeCode
//        textField.layer.borderWidth = 1
//        textField.font = .systemFont(ofSize: 15, weight: .medium)
//        return textField
//    }()
    
    
    init(textFieldType: TextFieldType) {
        self.authFieldType = textFieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.textAlignment = .left
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.returnKeyType = .done
        
        switch authFieldType {
            
        case .username:
            
            self.placeholder = "  username or email"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .email:
            
            self.placeholder = "  username or email"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .password:
            
            self.placeholder = "  password"
            self.isSecureTextEntry = true
            self.textContentType = .oneTimeCode
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
