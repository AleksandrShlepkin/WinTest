//
//  SecondViewController.swift
//  TestMaket
//
//  Created by Mac on 16.07.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func startButton(_ sender: Any) {
        
        if nameTextField.hasText, growthTextField.hasText, weight.hasText {
            print(chekUser(key: Keys.name.rawValue))
            saveUser()
            performSegue(withIdentifier: "ThirdScreen", sender: nil)
        } else {
            print("Error")
        }

    }
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var growthTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func saveUser(){
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let growth = growthTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard let weight = weight.text?.trimmingCharacters(in: .whitespaces) else { return }
        
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
        
        weight.layer.borderColor = UIColor.white.cgColor
        weight.layer.borderWidth = 3
        weight.layer.cornerRadius = 12
        weight.placeholder = "Вес"
        weight.backgroundColor = .clear
        
        startOutlet.layer.cornerRadius = 16
    }
    
    
    func chekUser(key: String) -> Bool {
        guard let _ = UserDefaults.standard.object(forKey: key) else { return false }
        return true
    }
    
}
