//
//  ResultsVC.swift
//  ChallengeApp
//
//  Created by Даниил on 7.06.21.
//

import UIKit

class ResultsVC: UIViewController {
    
    var name: String!
    
    

    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabelOutlet.text = "Победитель: \(name!)"
        viewOutlet.layer.cornerRadius = 25
        viewOutlet.backgroundColor = #colorLiteral(red: 0.5337196165, green: 0.5964059541, blue: 0.2614531312, alpha: 1)
        viewOutlet.layer.shadowColor = UIColor.white.cgColor
        viewOutlet.layer.shadowRadius = 15
        viewOutlet.layer.shadowOffset = CGSize(width: 2, height: 2)
    

    }
    
    @IBAction func newGameButtonAction() {
        self.performSegue(withIdentifier: "seg", sender: self)
    }
    


}
