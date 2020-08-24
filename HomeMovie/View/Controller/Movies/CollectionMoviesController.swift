//
//  CollectionMoviesController.swift
//  HomeMovie
//
//  Created by thinhdang on 8/24/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = StoryboardId.DetailTagMoviesCellId

class CollectionMoviesController: UICollectionViewController {
@IBOutlet weak var collectionMovie: UICollectionView!
    
    
    var typeMovie: TypeMovies!
    //MARK: -Properties
    var listMovies = List<Movie>()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
                
                }
            })
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.listMovies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DetailTagMoviesCell
    
        // Configure the cell
        let movie = self.listMovies[indexPath.item]
        cell.data = movie
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Size.kWidthBannerCell, height: Size.kHeightBannerCell)
    }
    
}
