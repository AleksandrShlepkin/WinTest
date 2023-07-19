//
//  StatisticViewController.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import UIKit

class StatisticViewController: UIViewController {

    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var SquatsTextField: UITextField!
    @IBOutlet weak var DistansTextField: UITextField!
    
    @IBOutlet weak var sumOutlet: UILabel!
    @IBOutlet weak var resultOutlet: UIButton!
    @IBAction func ResultButton(_ sender: Any) {
        getResult()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
setupUI()

    }
    
    func setupUI() {
        resultOutlet.layer.cornerRadius = 12
        SquatsTextField.layer.borderColor = UIColor.white.cgColor
        SquatsTextField.layer.borderWidth = 2
        SquatsTextField.backgroundColor = .clear
        
        DistansTextField.layer.borderColor = UIColor.white.cgColor
        DistansTextField.layer.borderWidth = 2
        DistansTextField.backgroundColor = .clear
        
        guard let progress = UserDefaults.standard.object(forKey: Keys.progress.rawValue) else { return }
        ResultLabel.text = "ПРОГРЕСС:"
        sumOutlet.text = "\(progress)Р"
    }
    
    func getResult(){
        
        guard let distans = DistansTextField.text else { return }
        guard let squats = SquatsTextField.text else { return }
        guard let weight = UserSettings.userWeight else { return }
        
        let sumDistansSquats = (Int(distans) ?? 0) + (Int(squats) ?? 0) * 10
        let sum = Int(sumDistansSquats * (Int(weight) ?? 0))
        let result = sum / 10
        
        UserSettings.userProgress = result
        guard let progress = UserDefaults.standard.object(forKey: Keys.progress.rawValue) else { return }
        sumOutlet.text = "\(Int(progress as! Int + result))Р"
    }

}
