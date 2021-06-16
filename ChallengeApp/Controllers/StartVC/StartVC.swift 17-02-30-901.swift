//
//  StartVC.swift
//  ChallengeApp
//
//  Created by Даниил on 20.04.21.
//

import UIKit



class StartVC: UIViewController {
    
    

    
    // MARK: - Outlets
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var startButtonOutlet: UIButton!
    

    
    // MARK: - viewDidLoad
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designForStartButton(btn: startButtonOutlet)
        designForAppNameLabel(label: appNameLabel)
        
        startButtonOutlet.center = self.view.center
        
        let gradietLayer = CAGradientLayer()
        gradietLayer.frame = self.view.bounds
        gradietLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        gradietLayer.startPoint = CGPoint(x: 0, y: 1)
        gradietLayer.endPoint = CGPoint(x: 2, y: 0)
//        self.view.layer.addSublayer(gradietLayer)
        self.view.layer.insertSublayer(gradietLayer, at: 0)

    
//        view.layer.backgroundColor = gradientLayer.backgroundColor
        
        
        print("Vlad")
        
    
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {  }

    
    // MARK: - viewWillAppear
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        animateForAddButton(btn: startButtonOutlet)
        animateForAddButton()
        animate(newText: "Challenger", characterDelay: 0.2)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    // MARK: - Actions
    
    
    @IBAction func startButtonAction() {
//        animateForAddButton()
        destination()
       
    }
    
    // MARK: - destination
    
    
    func destination() {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier:"RegistratingVC") as? RegistratingVC else { return }
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func designForAppNameLabel(label: UILabel) {
        
        label.textColor = #colorLiteral(red: 0.567645926, green: 0.5168095154, blue: 0.7510313554, alpha: 1)
        label.layer.shadowRadius = 2
        label.layer.shadowColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        label.layer.shadowOpacity = 1.1
        label.layer.shadowOffset = CGSize(width: 3, height: 0)
        label.layer.masksToBounds = false
        
    }
    
    func designForStartButton(btn: UIButton) {
          
          btn.layer.shadowColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
          btn.layer.shadowOffset = CGSize(width: 4, height: 8)
//          btn.layer.shadowRadius = 5
          btn.layer.superlayer?.shadowRadius = 5
          btn.layer.borderWidth = 4
          btn.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
          btn.layer.shadowOpacity = 0.8
          btn.layer.masksToBounds = false
          btn.layer.backgroundColor = UIColor.clear.cgColor
          btn.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
          btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
          btn.tintColor = .systemPink
          btn.setTitleColor(.white, for: UIControl.State.normal)
        
  }

//    func animateForAddButton() {
//    UIView.animate(withDuration: 0.6,
//        animations: {
//            self.startButtonOutlet.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
//        },
//        completion: { _ in
//            UIView.animate(withDuration: 0.6) {
//                self.startButtonOutlet.transform = CGAffineTransform.identity
//            }
//        })}
//
    func animateForAddButton() {
//        UIView.animate(withDuration: 0.8,
//           animations: {
        
        UIView.animate(withDuration: 0.6, delay: 0, options: [.repeat,.autoreverse,.allowUserInteraction], animations: {
            self.startButtonOutlet.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
     
            
            
//            self.startButtonOutlet.transform.d = CGFloat(1.6)
//
//            self.startButtonOutlet.transform.a = CGFloat(1.4)
//            self.startButtonOutlet.transform = CGAffineTransform.identity

           },
        completion: { _ in
        self.startButtonOutlet.transform = CGAffineTransform.identity
        
        
//            UIView.animate(withDuration: 0.8) {

//                btn.transform.a = CGFloat(3.4)
//                btn.transform.d = CGFloat(2.1)
//
//                   btn.transform = CGAffineTransform.identity
//               }
//           })
//   }

//}
        })}
    func animate(newText: String, characterDelay: TimeInterval) {

        DispatchQueue.main.async {

            self.appNameLabel.text = ""

            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.appNameLabel.text?.append(character)
                }
            }
        }
    

}

}


// MARK: - extension





