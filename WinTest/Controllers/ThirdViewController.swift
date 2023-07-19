//
//  ThirdViewController.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    

    @IBOutlet weak var traningOutlet: UIButton!
    @IBOutlet weak var analyticOutlet: UIButton!
    @IBOutlet weak var questionOutlet: UIButton!
    @IBOutlet weak var settingsOutlet: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        traningOutlet.layer.cornerRadius = 12
        traningOutlet.backgroundColor?.withAlphaComponent(0.5)
        
        analyticOutlet.layer.cornerRadius = 12
        analyticOutlet.backgroundColor?.withAlphaComponent(0.5)
        
        questionOutlet.layer.cornerRadius = 12
        questionOutlet.backgroundColor?.withAlphaComponent(0.5)
        
        settingsOutlet.layer.cornerRadius = 12
        settingsOutlet.backgroundColor?.withAlphaComponent(0.5)
        
        guard let progress = UserDefaults.standard.object(forKey: Keys.progress.rawValue) else { return }
        
        countLabel.text = "\(progress)"
        updateViewConstraints()
    }
    
    
}
