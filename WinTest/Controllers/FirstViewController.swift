//
//  ViewController.swift
//  TestMaket
//
//  Created by Mac on 16.07.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    func chekUser(key: String) -> Bool {
        guard let _ = UserDefaults.standard.object(forKey: key) else { return false }
        return true
    }
    
    private func animatedViwe() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.chekUser(key: Keys.name.rawValue) == true {
                self.performSegue(withIdentifier: "DoublSegue", sender: nil)
            } else {
                self.performSegue(withIdentifier: "pushSecond", sender: nil)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedViwe()
        
    }
    
    
}

