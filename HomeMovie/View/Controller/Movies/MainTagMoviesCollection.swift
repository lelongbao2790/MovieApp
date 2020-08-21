//
//  MainTagMoviesCollection.swift
//  HomeMovie
//
//  Created by thinhdang on 8/20/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class MainTagMoviesCollection: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    //MARK: -Properties
    var listMovies = List<Movie>()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    //MARK: -Helper
    func setDelegateDatasource() -> Void {
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
    
    func loadMovies(tagMovie: String) {
        BaseClient.shared.listMovieByGenre(
            genre: String(format:"\(Genre.Feature.rawValue)"),
            tag: tagMovie,
            page:  String(format:"\(CommonData.kDefaultNumber)"),
            completion: { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    let rsMovie = value as! ResponseMovie
                    self.listMovies =  rsMovie.data!.list as List<Movie>
                    self.setDelegateDatasource()
                }
            })
    }
    //MARK: -Delegate and Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let detailCell: DetailTagMoviesCell = self.dequeueReusableCell(withReuseIdentifier: StoryboardId.DetailTagMoviesCellId, for: indexPath) as! DetailTagMoviesCell
        let movie = self.listMovies[indexPath.item]
        detailCell.data = movie
         //print(detailCell.data!)
        return detailCell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Size.kWidthBannerCell, height: Size.kHeightBannerCell)
        
    }
    

}
