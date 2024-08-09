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
    
//    let imageView : UIImageView {
//        let imageView = UIImageView()
//        imageView.layer.borderWidth = 1
//        imageView.layer.cornerRadius = 10
//        imageView.clipsToBounds = true
//        
//        return imageView
//    }()
    
    
    var label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 6
  
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCollectCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpCollectCellUI() {
        
        
        imageViewm.layer.borderWidth = 0.7
        
        
        contentView.addSubview(imageViewm)
        contentView.addSubview(label)
        
        imageViewm.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageViewm.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            imageViewm.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),
            imageViewm.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 50),
            imageViewm.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            
            
            label.centerXAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.centerYAnchor)            
        ])
    }
}
