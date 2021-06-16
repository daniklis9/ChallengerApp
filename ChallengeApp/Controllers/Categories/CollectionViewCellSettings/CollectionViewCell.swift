//
//  CollectionViewCell.swift
//  ChallengeApp
//
//  Created by Даниил on 28.04.21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelCategNameOutlet: UILabel!
    
    func settingsCell(cell: UICollectionViewCell) {
        cell.layer.shadowColor = #colorLiteral(red: 0.700084956, green: 0.503015875, blue: 0.2413661266, alpha: 0.5569259947)
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 10
        cell.layer.cornerRadius = 25
        cell.layer.borderWidth = 2
        cell.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        cell.backgroundColor = .clear
        cell.layer.masksToBounds = false
        UIView.animate(withDuration: 0.8, delay: 0, options: [.repeat,.autoreverse,.allowUserInteraction], animations: {
            self.transform.a = CGFloat(1.2)
    

    })
        
    }
    
}
