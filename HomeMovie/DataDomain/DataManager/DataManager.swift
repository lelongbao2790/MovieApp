//
//  DataManager.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/17/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    static let shared = DataManager()
    
    func AddValue(key: String, value: String) -> Void {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func GetValue(key: String) -> String {
        return UserDefaults.standard.string(forKey: key)  ?? ""
    }
}