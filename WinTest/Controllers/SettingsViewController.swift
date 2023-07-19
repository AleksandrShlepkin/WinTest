//
//  SettingsViewController.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBAction func removeDataButton(_ sender: Any) {
        removeDataTaped()

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func removeDataTaped() {
        let key = Keys.name.rawValue
        let progress = Keys.progress.rawValue
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.removeObject(forKey: progress)
        performSegue(withIdentifier: "goBack", sender: nil)
    }
    

}
