//
//  StatisticViewController.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import UIKit

class StatisticViewController: UIViewController {
    
    
    
    @IBOutlet weak var distansTextField: UITextField!
    @IBOutlet weak var squatansTextField: UITextField!
    @IBOutlet weak var shootLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var resultButtonOutlet: UIButton!
    @IBAction func resultButtonAction(_ sender: Any) {
        getResult()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
setupUI()

    }
    
    func setupUI() {
        resultButtonOutlet.layer.cornerRadius = 12
        squatansTextField.layer.borderColor = UIColor.white.cgColor
        squatansTextField.layer.borderWidth = 2
        squatansTextField.backgroundColor = .clear
        
        distansTextField.layer.borderColor = UIColor.white.cgColor
        distansTextField.layer.borderWidth = 2
        distansTextField.backgroundColor = .clear
        
        guard let progress = UserDefaults.standard.object(forKey: Keys.progress.rawValue) else { return }
        pointsLabel.text = "\(progress)Р"
    }
    
    func getResult(){
        
        guard let distans = distansTextField.text else { return }
        guard let squats = squatansTextField.text else { return }
        guard let weight = UserSettings.userWeight else { return }
        
        let sumDistansSquats = (Int(distans) ?? 0) + (Int(squats) ?? 0) * 10
        let sum = Int(sumDistansSquats * (Int(weight) ?? 0))
        let result = sum / 10
        
        UserSettings.userProgress = result
        guard let progress = UserDefaults.standard.object(forKey: Keys.progress.rawValue) else { return }
        pointsLabel.text = "\(Int(progress as! Int + result))Р"
    }

}
