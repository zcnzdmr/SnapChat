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
        iv.layer.borderWidth = 1
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    
    var label : UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 1
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            image.widthAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.95),
            image.heightAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.heightAnchor, multiplier: 0.5),
            
            label.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 10),
            label.widthAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.85),
            label.heightAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.heightAnchor, multiplier: 0.08)
        ])
    }
}
