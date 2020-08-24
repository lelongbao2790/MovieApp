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
        if #available(iOS 13.0, *) {
            let keywindow =
            UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
            
            keywindow!.rootViewController = self.initController(id: id);
        } else {
            guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? UIViewController
            else {
                return
            }
            UIApplication.shared.windows.first?.rootViewController = rootVC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
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


