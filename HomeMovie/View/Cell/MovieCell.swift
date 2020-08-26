//
//  MovieCell.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class MovieCell: UITableViewCell {

    // MARK - Properties
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var collectionMovie: UICollectionView!
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionMovie.contentOffset.x
        }

        set {
            collectionMovie.contentOffset.x = newValue
        }
    }
    
    // MARK - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionMovie.frame = self.contentView.bounds
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK - Helper
    func loadInformation(category: String,
                         genre : String,
                         tag: String, row: Int,
                         dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate,
                         controller: MainController ) -> Void {
        self.lbTitle.text = category
        self.collectionMovie.delegate = dataSourceDelegate
        self.collectionMovie.dataSource = dataSourceDelegate
        self.collectionMovie.tag = row
        self.collectionMovie.reloadData()
        self.loadMovies(genreMovie: genre, tagMovie: tag, controller: controller)
    }
    
    func loadMovies(genreMovie: String, tagMovie: String, controller: MainController) {
        BaseClient.shared.listMovieByGenre(
            genre: genreMovie, //String(format:"\(Genre.Feature.rawValue)"),
            tag: tagMovie,
            page:  String(format:"\(CommonData.kDefaultNumber)"),
            completion: { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    let rsMovie = value as! ResponseMovie
                    controller.listMovies =  rsMovie.data!.list as List<Movie>
                 DispatchQueue.main.async {
                     // Run on main thread
                    self.collectionMovie.reloadData()
                    self.collectionMovie!.collectionViewLayout.invalidateLayout()
                    self.collectionMovie!.layoutSubviews()
                 }
                }
            })
    }

//    // MARK - Action
//    @IBAction func showAll(_ sender: Any) {
//    }
}
