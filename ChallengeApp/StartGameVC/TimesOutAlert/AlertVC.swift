//
//  AlertVC.swift
//  ChallengeApp
//
//  Created by Даниил on 26.05.21.
//

import UIKit

class AlertVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        designAlert()
  

    }

    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var okBtnOutlet: UIButton!

    @IBOutlet weak var imageView: UIImageView!
    
    
    

    @IBAction func okBtnAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func designAlert() {
        
        viewOutlet.layer.cornerRadius = 25
        viewOutlet.layer.shadowColor = UIColor.black.cgColor
        viewOutlet.layer.shadowRadius = 15
        viewOutlet.layer.shadowOpacity = 1.9
        viewOutlet.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewOutlet.layer.masksToBounds = false
        
        
        
    }
    
}
