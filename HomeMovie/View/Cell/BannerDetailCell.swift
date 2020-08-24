//
//  BannerDetailCell.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/24/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class BannerDetailCell: UITableViewCell {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    var collectionViewOffset: CGFloat {
        get {
            return bannerCollectionView.contentOffset.x
        }

        set {
            bannerCollectionView.contentOffset.x = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadBannerMovies(controller: MainController) {
        BaseClient.shared.listMovieByGenre(
            genre: String(format:"\(Genre.Hot.rawValue)"),
            tag: CommonData.kDefaultBannerTag,
            page:  String(format:"\(CommonData.kDefaultNumber + 1)"),
            completion: { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    let rsMovie = value as! ResponseMovie
                    controller.listBannerMovies =  rsMovie.data!.list as List<Movie>
                    DispatchQueue.main.async {
                        // Run on main thread
                        self.bannerCollectionView.reloadData()
                        self.bannerCollectionView.performBatchUpdates({ [weak self] in
                            let visibleItems = self!.bannerCollectionView.indexPathsForVisibleItems
                            self!.bannerCollectionView.reloadItems(at: visibleItems)
                        }, completion: { (_) in
                            self.bannerCollectionView.reloadData()   
                        })
                    }
                    
                }
            })
    }
    
    func loadInformation(row: Int, dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate) {
        bannerCollectionView.delegate = dataSourceDelegate
        bannerCollectionView.dataSource = dataSourceDelegate
        bannerCollectionView.tag = row
        bannerCollectionView.reloadData()
    }
}
