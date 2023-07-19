//
//  SecondViewController.swift
//  TestMaket
//
//  Created by Mac on 16.07.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var growthTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBAction func startButtonAction(_ sender: Any) {
        
        if nameTextField.hasText, growthTextField.hasText, weightTextField.hasText {
            print(chekUser(key: Keys.name.rawValue))
            saveUser()
            performSegue(withIdentifier: "mainScreen", sender: nil)
        } else {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func saveUser(){
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let growth = growthTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let weight = weightTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        
        UserSettings.userName = name
        UserSettings.userGrowth = growth
        UserSettings.userWeight = weight
        
        let userObject = UserModel(name: name, growth: growth, wieght: weight)
        
    }
    
    private func setupUI() {
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 3
        nameTextField.layer.cornerRadius = 12
        nameTextField.placeholder = "Name"
        nameTextField.backgroundColor = .clear
        
        growthTextField.layer.borderColor = UIColor.white.cgColor
        growthTextField.layer.borderWidth = 3
        growthTextField.layer.cornerRadius = 12
        growthTextField.placeholder = "Рост"
        growthTextField.backgroundColor = .clear
        
        weightTextField.layer.borderColor = UIColor.white.cgColor
        weightTextField.layer.borderWidth = 3
        weightTextField.layer.cornerRadius = 12
        weightTextField.placeholder = "Вес"
        weightTextField.backgroundColor = .clear
        
        startButtonOutlet.layer.cornerRadius = 16
    }
    
    
    func chekUser(key: String) -> Bool {
        guard let _ = UserDefaults.standard.object(forKey: key) else { return false }
        return true
    }
    
}
