//
//  TraningViewController.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import UIKit
import SDWebImage

class TraningViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    

    var array = [WeekdayModel]()
    let manager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getData(weekday: getCurrentDate()) { [weak self] arr in
            guard let self = self else { return }
            self.array = arr
            setupUI()
        }
    }
    
    func getCurrentDate() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        switch weekday {
        case 1:
            return "sunday"
        case 2:
            return "monday"
        case 3:
            return "tuesday"
        case 4:
            return "wednesday"
        case 5:
            return "thursday"
        case 6:
            return "friday"
        default:
            return "suterday"
        }

    }
    
    func getDate() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        switch weekday {
        case 1:
            return "ВОСКРЕСЕНИЕ"
        case 2:
            return "ПОНЕДЕЛЬНИК"
        case 3:
            return "ВТОРНИК"
        case 4:
            return "СРЕДА"
        case 5:
            return "ЧЕТВЕРГ"
        case 6:
            return "ПЯТНИЦА"
        default:
            return "СУББОТА"
        }

    }
    
    func setupUI() {
        let img = array.map { $0.img }
        mainImage.sd_setImage(with: URL(string: (img.first ?? "") ?? ""))
        let text = array.compactMap { $0.text }
        mainText.text = text.first

        weekLabel.text = getDate()
    }

}
