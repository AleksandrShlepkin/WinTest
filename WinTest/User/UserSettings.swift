//
//  UserSettings.swift
//  TestMaket
//
//  Created by Mac on 16.07.2023.
//

import Foundation


enum Keys: String {
    case name
    case growth
    case weight
    case progress
}


final class UserSettings {
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: Keys.name.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = Keys.name.rawValue
            if let name = newValue {
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var userGrowth: String! {
        get {
            return UserDefaults.standard.string(forKey: Keys.growth.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = Keys.growth.rawValue
            if let growth = newValue {
                defaults.set(growth, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var userWeight: String! {
        get {
            return UserDefaults.standard.string(forKey: Keys.weight.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = Keys.weight.rawValue
            if let weight = newValue {
                defaults.set(weight, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var userProgress: Int! {
        get {
            return UserDefaults.standard.integer(forKey: Keys.progress.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = Keys.progress.rawValue
            if let weight = newValue {
                defaults.set(weight, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    
    
    
}
