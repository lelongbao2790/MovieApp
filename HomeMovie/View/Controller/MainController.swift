//
//  MainController.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MainController : UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    var storedOffsets = [Int: CGFloat]()
    var listBannerMovies = List<Movie>()
    var listMovies = List<Movie>()
    var typeFilm = ""
    var typeMovie: TypeMovie!
    
    @IBOutlet weak var tbvCategory: UITableView!
    

    
    // MARK - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tbvCategory.allowsSelection = false
        
       let typeFilmIndex: Int = self.tabBarController!.selectedIndex
        if typeFilmIndex == StoryboardId.HotMovieId {
            typeMovie = TypeMovie.Hot
          typeFilm = "hot"
        }
        else if typeFilmIndex == StoryboardId.FeatureMovieId {
            typeMovie = TypeMovie.Feature
          typeFilm = "feature"
        }
        else if typeFilmIndex == StoryboardId.TelevisionMovieId{
            typeMovie = TypeMovie.Television
           typeFilm = "television"
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        self.setNavigationBarLogo(title: "Trang chủ", controlEvents: .touchUpInside,
           ForAction:{() -> Void in
               // Search action
               print("Search")
           })

    }
    

    
    // MARK - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleMenu.FeaturesTitleMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if(indexPath.row == 0) {
            let bannerDetailCell: BannerDetailCell = self.tbvCategory.dequeueReusableCell(withIdentifier: StoryboardId.BannerDetailCellId, for: indexPath) as! BannerDetailCell
            return bannerDetailCell
            
        } else {
            let movieCell: MovieCell = self.tbvCategory.dequeueReusableCell(withIdentifier: StoryboardId.MovieCellId, for: indexPath) as! MovieCell
            return movieCell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == 0) {
            guard let bannerDetailCell = cell as? BannerDetailCell else { return }
             bannerDetailCell.loadInformation(row: indexPath.row, dataSourceDelegate: self)
             bannerDetailCell.loadBannerMovies(controller: self)
             bannerDetailCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
            
        } else {
            guard let movieCell = cell as? MovieCell else { return }
            if (typeFilm == "hot") {
                movieCell.loadInformation(
                category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row],
                genre: String(format:"\(Genre.Hot.rawValue)"),
                tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row],
                row: indexPath.row,
                dataSourceDelegate: self,
                controller: self)
            }
            if(typeFilm == "feature"){
                movieCell.loadInformation(
               category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row],
               genre: String(format:"\(Genre.Feature.rawValue)"),
               tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row],
               row: indexPath.row,
               dataSourceDelegate: self,
               controller: self)
            }
            if(typeFilm == "television"){
                movieCell.loadInformation(
                category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row],
                genre: String(format:"\(Genre.Television.rawValue)"),
                tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row],
                row: indexPath.row,
                dataSourceDelegate: self,
                controller: self)
            }
            
            movieCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.row == 0) {
            guard let bannerDetailCell = cell as? BannerDetailCell else { return }
            storedOffsets[indexPath.row] = bannerDetailCell.collectionViewOffset
        } else {
            guard let movieCell = cell as? MovieCell else { return }
            storedOffsets[indexPath.row] = movieCell.collectionViewOffset

        }
    }
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView.tag == 0) {
            return listBannerMovies.count
            
        } else {
            return listMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView.tag == 0) {
            let bannerCell: BannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.BannerCellId, for: indexPath) as! BannerCell
            let movie = self.listBannerMovies[indexPath.item]
            bannerCell.data = movie
            return bannerCell
            
        } else {
            let detailCell: DetailMovieCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.DetailMovieCellId, for: indexPath) as! DetailMovieCell
               let movie = self.listMovies[indexPath.item]
               detailCell.data = movie
               return detailCell
        }
    }
 
}


