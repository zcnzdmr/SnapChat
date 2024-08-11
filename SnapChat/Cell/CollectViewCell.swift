//
//  CollectViewCell.swift
//  SnapChat
//
//  Created by Özcan on 9.08.2024.
//

import UIKit

class CollectViewCell: UICollectionViewCell {
    
    
    static let identifier = "CollectViewCell"
    
    let imageViewm = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCollectCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpCollectCellUI() {
            
        imageViewm.layer.borderWidth = 0.7
        imageViewm.layer.cornerRadius = 10
        imageViewm.layer.borderColor = UIColor.systemBackground.cgColor
        imageViewm.clipsToBounds = true
        
        contentView.addSubview(imageViewm)
//        contentView.addSubview(label)
        
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageViewm.leadingAnchor.constraint(equalTo: self.contentView/*.layoutMarginsGuide*/.leadingAnchor),
            imageViewm.trailingAnchor.constraint(equalTo: self.contentView/*.layoutMarginsGuide*/.trailingAnchor),
            imageViewm.topAnchor.constraint(equalTo: self.contentView/*.layoutMarginsGuide*/.topAnchor),
            imageViewm.bottomAnchor.constraint(equalTo: self.contentView/*.layoutMarginsGuide*/.bottomAnchor),
            
            
//            label.centerXAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerXAnchor),
//            label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
//            label.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8),
//            label.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.06)
        ])
    }
}
