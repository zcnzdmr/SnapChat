//
//  CustomButton.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class CustomButton: UIButton {

    enum ButtonType {
        
        case big
        case medium
        case small
    }
    
    private let authButtonType : ButtonType
    
    init(title:String, buttonType: ButtonType, hasbackground:Bool = false) {
        self.authButtonType = buttonType
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
//        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true

        self.backgroundColor = hasbackground ? .systemBlue : .clear
        
        
        let titleColor : UIColor = hasbackground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch authButtonType {
            
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
