//
//  StoryboardId.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func initController(id: String) -> UIViewController {
        return (storyboard?.instantiateViewController(withIdentifier: id))!
    }
    
    func resetRoot(id: String) {
        guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? UIViewController
        else {
            return
        }
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
struct StoryboardId {
    static let MainControllerId = "MainController"
    static let ParentControllerId = "ParentController"
    static let BannerCellId = "BannerCellIdentifier"
    static let DetailMovieCellId = "DetailMovieCell"
    static let MovieCellId = "MovieCell"
    static let BannerDetailCellId = "BannerDetailCellId"
    
    
    
}


