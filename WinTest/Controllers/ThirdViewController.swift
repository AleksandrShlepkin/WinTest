//
//  ThirdViewController.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var TraningOutlet: UIButton!
    @IBOutlet weak var StaticOutlet: UIButton!
    @IBOutlet weak var SettingOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        TraningOutlet.layer.cornerRadius = 12
        TraningOutlet.backgroundColor?.withAlphaComponent(0.5)
        
        StaticOutlet.layer.cornerRadius = 12
        StaticOutlet.backgroundColor?.withAlphaComponent(0.5)
        
        SettingOutlet.layer.cornerRadius = 12
        SettingOutlet.backgroundColor?.withAlphaComponent(0.5)
        
        guard let progress = UserDefaults.standard.object(forKey: Keys.progress.rawValue) else { return }
        
        progressLabel.text = "\(progress)"
        updateViewConstraints()
    }
    
    
}
