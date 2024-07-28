//
//  AuthHeaderView.swift
//  SnapChat
//
//  Created by Özcan Özdemir on 28.07.2024.
//

import UIKit

class AuthHeaderView: UIView {
    
    
    private let image1 : UIImageView =  {
        let iv1 = UIImageView()
//        iv1.contentMode = .scaleAspectFit
        iv1.image = UIImage(named: "cat")
        iv1.layer.borderWidth = 1
        iv1.tintColor = .black
        iv1.layer.cornerRadius = 70
        return iv1
    }()
    
    
    private let titleLabel : UILabel = {
        let l1 = UILabel()
        l1.textColor = .label
        l1.textAlignment = .center
        l1.font = .systemFont(ofSize: 25, weight: .bold)
        l1.text = "Sign In"
//        l1.layer.borderWidth = 1
        return l1
    }()
    
    
    private let subtitleLabel : UILabel = {
        let l2 = UILabel()
        l2.font = .systemFont(ofSize: 20, weight: .semibold)
        l2.textAlignment = .center
        l2.textColor = .secondaryLabel
        l2.text = "Sign in to your account"
        return l2
    }()
    
    // MARK: Life Cycle
    
    init(title:String,subtitle:String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.backgroundColor = .systemBackground
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI SETUP
    private func setUpUI() {
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(image1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        image1.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            image1.topAnchor.constraint(equalTo: self.topAnchor,constant: 50),
            image1.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image1.widthAnchor.constraint(equalToConstant: 140),
            image1.heightAnchor.constraint(equalTo: image1.widthAnchor),

            titleLabel.topAnchor.constraint(equalTo: image1.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            subtitleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12)
            
            
        ])
    }
}
