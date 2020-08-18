//
//  BannerView.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class BannerView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var listMovies = List<Movie>()
    
    // MARK - Helper
    func setDelegateDatasource() -> Void {
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
    
    func loadMovies(page: Int) {
        BaseClient.shared.listMovieByGenre(
            genre: String(format:"\(Genre.Hot.rawValue)"),
            tag: CommonData.kDefaultBannerTag,
            page:  String(format:"\(page)"),
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
        let bannerCell: BannerCell = self.dequeueReusableCell(withReuseIdentifier: StoryboardId.BannerCellId, for: indexPath) as! BannerCell
        let movie = self.listMovies[indexPath.item]
        bannerCell.data = movie
        return bannerCell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Size.kWidthBannerCell, height: Size.kHeightBannerCell)
        
    }
}

