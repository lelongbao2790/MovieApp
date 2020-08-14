//
//  MovieCollection.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class MovieCollection: UICollectionView {
    
    var listMovie: Array<Movie>? = nil

    
    func loadListMovieFromJson(movies: Array<Movie>) -> Void {
        listMovie = movies
        self.reloadData()
    }
    
    //-----------------
    // MARK - UICollectionDelegate, UICollectionDataSource
//    //-----------------
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
    
}
