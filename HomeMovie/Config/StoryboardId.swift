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
    //main page id
    static let MainControllerId = "MainController" //main
    static let ParentControllerId = "ParentController"
    static let BannerCellId = "BannerCell" //banner cell
    static let DetailMovieCellId = "DetailMovieCell" //collection cell
    static let MovieCellId = "MovieCell" //table view cell
    
    //tag movies id
    static let MoviesControllerId = "MoviesController" //main movies
    static let TagMoviesCellId = "TagMoviesCell" //table view cell
    static let DetailTagMoviesCellId = "DetailTagMoviesCell" //colection view cell
    
    //detail detail movies id
    static let MovieViewControllerId = "MovieViewController"
    static let MovieCollectionViewCellId = "MovieCollectionViewCell"
    
    //page ig
    static let FeatureMoviesId = 1
    static let TelevisionId = 2
    
    
    
    static let keyWindows =
    UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first
    
}


