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
}
struct StoryboardId {
    // MAIN
    static let MainControllerId = "MainController"
    static let ParentControllerId = "ParentController"
    static let BannerCellId = "BannerCell"
    static let DetailMovieCellId = "DetailMovieCell"
    static let MovieCellId = "MovieCell"
    // FEATURE & MOVIE FILM
    static let TypeFilmControllerId = "TypeFilmController"
    static let FeatureFilmTabBarIndex = 1
    static let TelevisionFilmTabBarIndex = 2
    static let TagTableId = "TagTable"
    static let TagCellId = "TagCell"
    static let TagControllerId = "TagController"
    //static let MovieInTagCellId = "MovieInTagCell"
    // DETAIL MOVIE
    static let DetailMovieControllerId = "DetailMovieController"
    // SEARCH
    static let SearchControllerId = "SearchController"
    static let SearchMovieCellId = "SearchMovieCell"
    
    static let keyWindows =
    UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first
    
}


