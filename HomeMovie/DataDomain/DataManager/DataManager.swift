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
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    func AddValue(key: String, value: String) -> Void {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func GetValue(key: String) -> String {
        return UserDefaults.standard.string(forKey: key)  ?? ""
    }
    
    func downloadImageUrl(imageView: UIImageView, from link: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
        if let imageFromCache = imageCache.object(forKey: link as AnyObject) as? UIImage {
            imageView.image = imageFromCache
            return
        }
        imageView.downloaded(from: link)
    }
}
