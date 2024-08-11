//
//  FirstTableViewCell.swift
//  SnapChat
//
//  Created by Özcan on 9.08.2024.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    static let identifier = "FirstTableViewCell"
    
    var image: UIImageView = {
        
        let iv = UIImageView()
        //        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
//        iv.layer.borderWidth = 1
        iv.layer.cornerRadius = 10
        return iv
    }()

    
    var label : UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray.withAlphaComponent(0.2)
        label.textAlignment = .center
        label.textColor = .label
        label.clipsToBounds = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 11
        label.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var image2: UIImageView = {
        let iv2 = UIImageView()
        //        iv.contentMode = .scaleAspectFill
        iv2.translatesAutoresizingMaskIntoConstraints = false
        iv2.clipsToBounds = true
        iv2.layer.borderWidth = 1
        iv2.layer.cornerRadius = 20
        iv2.layer.borderColor = UIColor.lightGray.cgColor
        return iv2
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setUpCellUIs()
        // Configure the view for the selected state
    }
    
    
    func setUpCellUIs() {
        
        self.contentView.addSubview(label)
        self.contentView.addSubview(image)
        self.contentView.addSubview(image2)
        
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 45),
            image.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            image.widthAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.widthAnchor),
            image.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            
            label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            label.widthAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.widthAnchor),
            label.heightAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.heightAnchor, multiplier: 0.08),
            
            
            image2.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            image2.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            image2.heightAnchor.constraint(equalToConstant: 40),
            image2.widthAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}
