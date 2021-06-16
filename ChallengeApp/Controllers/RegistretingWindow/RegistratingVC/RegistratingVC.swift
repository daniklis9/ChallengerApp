//
//  RegistratingVC.swift
//  ChallengeApp
//
//  Created by Даниил on 20.04.21.
//

import UIKit


class RegistratingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var players = [User]()
    
    let idCell = "Cell"
    
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var warningLabel: UILabel!
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        nextButton.isHidden = true
        designButton(btn: addPlayerButton)
        designButton(btn: nextButton)
        backgroundDesign(view: view, tableView: tableView)

    }
    
    
    
    // MARK: - viewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        animateAddButton(btn: addPlayerButton)
        animateAddButton(btn: nextButton)
    }
    
    
    
    // MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return players.count
    }
    
    
    // MARK: - cellForRowAt
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = SettingsCell()
        cell.awakeFromNib()
        cell.textLabel?.text = players[indexPath.row].name
        cell.backgroundColor = UIColor.clear
        
        if players.count >= 2 {
            warningLabel.isHidden = false
        }
        
        return cell
        
    }
    
    

    // MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                players[indexPath.row].isAgree = false
            } else {
                cell.accessoryType = .checkmark
                players[indexPath.row].isAgree = true
            }
            
            
            var value = 0
            
            for i in self.players {
                if i.isAgree == true && players.count >= 2  {
                    value += 1
                }
                
                if value == players.count {
                    nextButton.isHidden = false
                } else {
                    nextButton.isHidden = true
                }
            }
        }
    }
    
  
    
    // MARK: - editingStyle
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.players.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .top)
            
            if players.count != 0 && !players.isEmpty {
                
                for i in 0...players.count - 1 {
                    players[i].isAgree = false
                }
            } else {
                return
            }
            
        }
        
        self.tableView.reloadData()
        nextButton.isHidden = true
        
        print(players)
    }
    

    
    // MARK: - addPlayerButtonAction
    @IBAction func addPlayerButtonAction() {
        
        
        
        let alert = UIAlertController(title: "Новый игрок", message: "Введите никнейм", preferredStyle: .alert)
        
        let savePlayers = UIAlertAction(title: "Сохранить", style: .default) { [self] _ in
            
            let textField = alert.textFields?.first
            // Спросить про добавление
            let newPlayerName = textField?.text
            let newPlayer = User.init(name: newPlayerName!, isAgree: false, points: 0)
            if newPlayer.name.isEmpty { return }
            
            // узнать про пробелы в строке
            if newPlayer.name != " " {
                self.players.append(newPlayer)
            } else { return }
            self.nextButton.isEnabled = true
            self.tableView.reloadData()
            for i in 0...players.count - 1 { //Self
                players[i].isAgree = false
            }
        }
        
        
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(savePlayers)
        alert.addTextField()
        
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - nextButtonAction
    
    @IBAction func nextButtonAction() {
        guard let thirdVC = storyboard?.instantiateViewController(withIdentifier: "CategoriesVC") as? CategoriesVC else { return }
        
        thirdVC.players = players
        print(players)
        navigationController?.pushViewController(thirdVC, animated: false)
    }
    
    // MARK: - backButtonAction
    
    @IBAction func backButtonAction() {
        navigationController?.popViewController(animated: false)
        
    }


func backgroundDesign(view: UIView, tableView: UITableView) {
    
    let gradietLayer = CAGradientLayer()
    gradietLayer.frame = view.bounds
    tableView.backgroundColor = UIColor.clear
    gradietLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
    gradietLayer.startPoint = CGPoint(x: 0, y: 1)
    gradietLayer.endPoint = CGPoint(x: 2, y: 0)
    view.layer.insertSublayer(gradietLayer, at: 0)
    tableView.backgroundView?.layer.insertSublayer(gradietLayer, at: 1)
}
    


func designButton(btn: UIButton) {
    
   
    btn.layer.backgroundColor = UIColor.clear.cgColor
    btn.layer.cornerRadius = 15
    btn.layer.borderWidth = 3
    btn.layer.borderColor = #colorLiteral(red: 0.5583833456, green: 0.3523419499, blue: 0.9668788314, alpha: 1)
    btn.layer.shadowColor = UIColor.black.cgColor
    btn.layer.shadowRadius = 7
    btn.layer.shadowOpacity = 1
    btn.layer.shadowOffset = CGSize(width: 1, height: 1)
}

 func animateAddButton(btn: UIButton) {
    UIView.animate(withDuration: 0.4, delay: 0, options: [.repeat,.autoreverse,.allowUserInteraction], animations: {
        btn.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    

 }
)
    
 }
}






