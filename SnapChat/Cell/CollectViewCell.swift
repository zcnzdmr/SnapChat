//
//  CollectViewCell.swift
//  SnapChat
//
//  Created by Özcan on 9.08.2024.
//

import UIKit

class CollectViewCell: UICollectionViewCell {
    
    
    static let identifier = "CollectViewCell"
    
    private var imageView : UIImageView {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
