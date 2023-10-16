//
//  StartGameVC.swift
//  ChallengeApp
//
//  Created by Даниил on 17.05.21.
//

import UIKit

class StartGameVC: UIViewController {
    
    
    var task: [String]!
    var players = [User]()
    var timer = Timer()
    var currentUser = 0
    
    
    
    
    var time = 50 {
        didSet {
            timeLabel.text = "\(time)"
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressViewOutlet: UIProgressView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tasksLabel: UILabel!
    @IBOutlet weak var failedButton: UIButton!
    @IBOutlet weak var ableButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var nameOfPoints: UILabel!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        ableButton.isHidden = true
        failedButton.isHidden = true
        randomElementForTask()
        firstElementForName()
        settingsUIStartGameVC(view: view)
        settingsLabels(label: timeLabel)
        settingsLabels(label: nameLabel)
        settingsLabels(label: tasksLabel)
        completeBtnSettings(btn: completeButton)
        progressViewOutlet.progress = 1
        progressViewOutlet.transform = progressViewOutlet.transform.scaledBy(x: 1, y: 4)
        progressViewOutlet.layer.shadowColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        progressViewOutlet.layer.shadowOffset = CGSize(width: 0, height: 3)
//          btn.layer.shadowRadius = 5
//        progressViewOutlet.layer.shadowRadius = 1.3
   
        progressViewOutlet.layer.borderWidth = 0.3
        progressViewOutlet.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        progressViewOutlet.layer.shadowOpacity = 0.7
        progressViewOutlet.layer.masksToBounds = false
        progressViewOutlet.layer.backgroundColor = UIColor.clear.cgColor
        progressViewOutlet.tintColor = .systemPink
        progressViewOutlet.layer.cornerRadius = 2
        pointsLabel.text = "0"
        nameOfPoints.textColor = UIColor.white
        pointsLabel.textColor = UIColor.white
        failedButton.layer.cornerRadius = 10
        failedButton.layer.borderWidth = 3
        failedButton.layer.borderColor = #colorLiteral(red: 0.5583833456, green: 0.3523419499, blue: 0.9668788314, alpha: 1)
        ableButton.layer.cornerRadius = 10
        ableButton.layer.borderWidth = 3
        ableButton.layer.borderColor = #colorLiteral(red: 0.5583833456, green: 0.3523419499, blue: 0.9668788314, alpha: 1)
        
        failedButton.frame = CGRect(x: 30, y: 670, width: 140, height: 40)
        ableButton.frame = CGRect(x: 225, y: 670, width: 140, height: 40)
        
        
       
        

        

        
    }
    // MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        progressViewOutlet.setProgress(50, animated: true)
        
        
        
    }
    
    
    
    // MARK: - tickFunc
    @objc func tick() {
        time -= 1
        
        if progressViewOutlet.progress != 0 {
            progressViewOutlet.progress -= 0.02
        }
        
        if time == 0 {
            progressViewOutlet.progress = 0
            timer.invalidate()
            completeButton.isHidden = true
            ableButton.isHidden = false
            failedButton.isHidden = false
//            completeButton.transform = .identity
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let alert = sb.instantiateViewController(identifier: "AlertVC")
            
            
            
            showDetailViewController(alert, sender: nil)
            
            
        }
    }
    
    
    // MARK: - ableButtonAction
    
    @IBAction func ableButtonAction() {
        progressViewOutlet.progress = 1
        time = 50
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        currentUser += 1
        
        if currentUser == players.count  {
            players[currentUser - 1].points += 1
            currentUser = 0
        } else {
            players[currentUser - 1].points += 1
        }
        
        print(players)
        pointsLabel.text = String(players[currentUser].points)
        nameLabel.text = players[currentUser].name
        tasksLabel.text = task.randomElement()
        ableButton.isHidden = true
        failedButton.isHidden = true
        completeButton.isHidden = false
        
        for i in players {
            if i.points == 5 && players.allSatisfy({$0.completedTask == 5}){
                print("PL = \(players)")
                print("cr = \(currentUser)")
                timer.invalidate()
                completeButton.isHidden = true
                ableButton.isHidden = true
                failedButton.isHidden = true
                nameLabel.isHidden = true
                tasksLabel.isHidden = true
                timeLabel.isHidden = true
                timer.invalidate()
                guard let vc = storyboard?.instantiateViewController(identifier: "ResultsVC") as? ResultsVC else { return }
                if players.last?.points == 5 {
                    vc.name = players.last?.name
                } else {
                    vc.name = players[currentUser - 1].name
                }
                showDetailViewController(vc, sender: nil)
                
            }
        }
    }
    
    // MARK: - failedButtonAction
    
    @IBAction func failedButtonAction() {
        
        progressViewOutlet.progress = 1
        
        timer.invalidate()
        time = 50
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
        currentUser += 1
        
        
        
        if currentUser == players.count {
            pointsLabel.text = String(players[currentUser-1].points)
            currentUser = 0
            print(players)
        }
        pointsLabel.text = String(players[currentUser].points)
        nameLabel.text = players[currentUser].name
        print("CurUser = \(currentUser)")
        
        tasksLabel.text = task.randomElement()
        ableButton.isHidden = true
        failedButton.isHidden = true
        completeButton.isHidden = false
     
    }
    // MARK: - completeButtonAction
    
    
    
    @IBAction func completeButtonAction() {
        
        completeButton.isHidden = true
        ableButton.isHidden = false
        failedButton.isHidden = false
        timer.invalidate()
        
    }
    
    
    
    
    
    
    func randomElementForTask() {
        tasksLabel.text = task.randomElement()
    }
    
    func firstElementForName() {
        
        nameLabel.text = players[currentUser].name
        
        
    }
    
    
    func settingsUIStartGameVC(view: UIView) {
        
        let gradietLayer = CAGradientLayer()
        gradietLayer.frame = view.bounds
        gradietLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
        gradietLayer.startPoint = CGPoint(x: 0, y: 1)
        gradietLayer.endPoint = CGPoint(x: 2, y: 0)
        view.layer.insertSublayer(gradietLayer, at: 0)
        
    }
    func settingsLabels(label: UILabel) {
        label.textColor = .white
    }
    
    
    func completeBtnSettings(btn: UIButton) {
        btn.layer.masksToBounds = false
        btn.layer.backgroundColor = UIColor.clear.cgColor
        btn.layer.borderColor = #colorLiteral(red: 0.5583833456, green: 0.3523419499, blue: 0.9668788314, alpha: 1)
        btn.layer.borderWidth = 3
        btn.layer.shadowColor = UIColor.white.cgColor
        btn.layer.shadowRadius = 7
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = CGSize(width: 1, height: 1)
        btn.frame = CGRect(x: 0, y: 480, width: 175, height: 175)
        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        
        btn.center.x = self.view.center.x
        
        
    }
    

}
