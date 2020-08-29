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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let typeFilmIndex: Int = self.tabBarController?.selectedIndex ?? StoryboardId.HotMovieId
             if typeFilmIndex == StoryboardId.HotMovieId {
                 typeMovie = .Hot
               typeFilm = "hot"
                self.setNavigationBarLogo(title: "Trang chủ", controlEvents: .touchUpInside,
                ForAction:{() -> Void in
                    // Search action
                    print("Search")
                })
             }
             else if typeFilmIndex == StoryboardId.FeatureMovieId {
                 typeMovie = .Feature
               typeFilm = "feature"
                self.setNavigationBarLogo(title: "Phim lẻ", controlEvents: .touchUpInside,
                ForAction:{() -> Void in
                    // Search action
                    print("Search")
                })
             }
             else if typeFilmIndex == StoryboardId.TelevisionMovieId{
                 typeMovie = .Television
                typeFilm = "television"
                self.setNavigationBarLogo(title: "Phim bộ", controlEvents: .touchUpInside,
                ForAction:{() -> Void in
                    // Search action
                    print("Search")
                })
             }

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
            if(typeMovie == TypeMovie.Hot){
                bannerDetailCell.loadBannerMovies(genreMovie: String(format:"\(Genre.Hot.rawValue)"), controller: self)
            }
            else if(typeMovie == TypeMovie.Feature){
                bannerDetailCell.loadBannerMovies(genreMovie: String(format:"\(Genre.Feature.rawValue)"), controller: self)
            }
            else if(typeMovie == TypeMovie.Television){
                bannerDetailCell.loadBannerMovies(genreMovie: String(format:"\(Genre.Television.rawValue)"), controller: self)
            }
             bannerDetailCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
            
        } else {
            guard let movieCell = cell as? MovieCell else { return }
            if (typeMovie == TypeMovie.Hot) {
                movieCell.loadInformation(
                category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row - 1],
                genre: String(format:"\(Genre.Hot.rawValue)"),
                tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row - 1],
                row: indexPath.row,
                dataSourceDelegate: self,
                controller: self)
            }
            else if(typeMovie == TypeMovie.Feature){
                movieCell.loadInformation(
               category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row - 1],
               genre: String(format:"\(Genre.Feature.rawValue)"),
               tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row - 1],
               row: indexPath.row,
               dataSourceDelegate: self,
               controller: self)
            }
            else{
                movieCell.loadInformation(
                category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row - 1],
                genre: String(format:"\(Genre.Television.rawValue)"),
                tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row - 1],
                row: indexPath.row,
                dataSourceDelegate: self,
                controller: self)
            }
            movieCell.delegate = self
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

extension MainController:TagMoviesCellProtocol{
    func moviePage(_ data: String) {
        print("ccccc")
        let controller: DetailMovieController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.DetailMovieControllerId) as! DetailMovieController
   
        controller.Title = data
        
        if (typeMovie == TypeMovie.Hot) {
            controller.genre = Genre.Hot.rawValue
        }
        else if (typeMovie == TypeMovie.Feature) {
            controller.genre = Genre.Feature.rawValue
        }
        else{
            controller.genre = Genre.Television.rawValue
        }

        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
