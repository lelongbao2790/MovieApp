//
//  CommonResources.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
        contentMode = mode
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else {
                        return
                        
                }
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                    DataManager.shared.imageCache.setObject(image, forKey: url as AnyObject)
                }
            }.resume()
        }
        
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }

}
