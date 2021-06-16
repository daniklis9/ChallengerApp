//
//  CategoriesVC.swift
//  ChallengeApp
//
//  Created by Даниил on 27.04.21.
//

import UIKit

class CategoriesVC: UIViewController {
    
    var players = [User]()
    
    // MARK: - outlets
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tasks.count)
        settingsUICategoriesVC(view: view, collectionView: collectionViewOutlet)
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func backButtonAction() {
        navigationController?.popViewController(animated: false)
    }
    
    
}
    // MARK: - Delegate, DataSource

extension CategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        
        cell.labelCategNameOutlet.text = tasks[indexPath.row].category
        cell.settingsCell(cell: cell)
        
        return cell
    }
    
    // MARK: - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let newVC = storyboard?.instantiateViewController(withIdentifier: "StartGameVC") as? StartGameVC else { return }
        
        newVC.task = tasks[indexPath.row].tasks
        newVC.players = players
        
        show(newVC, sender: nil)
        
        
    }
}

func settingsUICategoriesVC(view: UIView, collectionView: UICollectionView) {
    
    let gradietLayer = CAGradientLayer()
    gradietLayer.frame = view.bounds
    
    
    gradietLayer.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor]
    gradietLayer.startPoint = CGPoint(x: 0, y: 1)
    gradietLayer.endPoint = CGPoint(x: 2, y: 0)
    collectionView.backgroundColor = UIColor.clear
    view.layer.insertSublayer(gradietLayer, at: 0)
}
   // MARK: - UICollectionViewDelegateFlowLayout

extension CategoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 450)
    }
}


