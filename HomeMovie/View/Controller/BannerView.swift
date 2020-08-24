//
//  BannerView.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/24/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class BannerView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var listBannerMovies = List<Movie>()
    
    // MARK - Helper
    func loadMovies(page: Int) {
        BaseClient.shared.listMovieByGenre(
            genre: String(format:"\(Genre.Hot.rawValue)"),
            tag: CommonData.kDefaultBannerTag,
            page:  String(format:"\(page)"),
            completion: { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    let rsMovie = value as! ResponseMovie
                    self.listBannerMovies =  rsMovie.data!.list as List<Movie>
                    DispatchQueue.main.async {
                        // Run on main thread
                        self.reloadData()
                        self.performBatchUpdates({ [weak self] in
                            let visibleItems = self!.indexPathsForVisibleItems
                            self!.reloadItems(at: visibleItems)
                        }, completion: { (_) in
                            self.reloadData()
                            
                            
                        })
                    }
                    
                }
            })
    }
    
    func loadInformation() {
        self.delegate = self
        self.dataSource = self
        self.loadMovies(page: CommonData.kDefaultNumber + 1)
    }
    
    // MARK - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listBannerMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bannerCell: BannerCell = self.dequeueReusableCell(withReuseIdentifier: StoryboardId.BannerCellId, for: indexPath) as! BannerCell
        let movie = self.listBannerMovies[indexPath.item]
        bannerCell.data = movie
        return bannerCell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Size.kWidthBannerCell, height: Size.kHeightBannerCell)
        
    }

}
