//
//  MovieCollection.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class MovieCollection: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var listMovies = List<Movie>()
    
   required init?(coder: NSCoder) {
       super.init(coder: coder)
   }
   
   // MARK - Helper
   func setDelegateDatasource() -> Void {
       self.delegate = self
       self.dataSource = self
       self.reloadData()
   }
   
    func loadMovies(tagMovie: String) {
       BaseClient.shared.listMovieByGenre(
           genre: String(format:"\(Genre.Hot.rawValue)"),
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
   
   // MARK - UICollectionViewDelegate
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.listMovies.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let detailCell: DetailMovieCell = self.dequeueReusableCell(withReuseIdentifier: StoryboardId.DetailMovieCellId, for: indexPath) as! DetailMovieCell
       let movie = self.listMovies[indexPath.item]
       detailCell.data = movie
    
       return detailCell
   }
   
   func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: Size.kWidthBannerCell, height: Size.kHeightBannerCell)
       
   }
}
