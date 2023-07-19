//
//  Model.swift
//  TestMaket
//
//  Created by Mac on 17.07.2023.
//

import Foundation

struct WeekdayModel: Codable {
    
    let img: String?
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case img = "img"
        case text = "text"
    }
    
}

struct Question: Codable {
    let response: String
}
