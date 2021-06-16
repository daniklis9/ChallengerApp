//
//  SettingsCell.swift
//  ChallengeApp
//
//  Created by Даниил on 22.04.21.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    let idCell = "Cell"
    var players = [User]()

    override func awakeFromNib() {
        super.awakeFromNib()
        super.layoutSubviews()
        
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
      
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 4
        self.layer.borderColor = CGColor(red: 0, green: 2, blue: 4, alpha: 0.4)
       
        self.contentView.frame.inset(by: UIEdgeInsets(top: 40, left: 40, bottom: 10, right: 40))
        self.layer.shadowRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 0)
        self.layer.shadowOpacity = 1.1

        self.separatorInset.left = 30
        self.textLabel?.textColor = .white
        self.tintColor = UIColor.white
        
  
 

}
}
