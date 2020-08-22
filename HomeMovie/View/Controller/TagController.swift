//
//  DetailCategoryView.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/19/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class TagController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    //
    // MARK: Properties
    //
    @IBOutlet weak var colTag: UICollectionView!
    var tagValue: String?
    var tagKey: String? {
        didSet {
            print(self.tagKey!)
            self.tagValue = Tag.Features[tagKey!]
        }
    }
    var genre: Int?
    var listMovies = List<Movie>()
    var currentPageIndex: Int = 1
    var lastPageIndex: Int = 2
    
    //
    // MARK: Life Cycle Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMovies(pageIndex: currentPageIndex)
    }
    
    //
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DetailMovieCell = self.colTag.dequeueReusableCell(withReuseIdentifier: StoryboardId.DetailMovieCellId, for: indexPath) as! DetailMovieCell
        cell.data = listMovies[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 >= listMovies.count && currentPageIndex < lastPageIndex {
            loadMovies(pageIndex: currentPageIndex + 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: DetailMovieCell = self.colTag.cellForItem(at: indexPath) as! DetailMovieCell
        let controller: DetailMovieController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.DetailMovieControllerId) as! DetailMovieController
        controller.data = cell.data!
        if let image = cell.imgPoster.image {
            controller.posterData = image
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    //
    // MARK: Private Methods
    //
    func loadMovies(pageIndex: Int) {
        BaseClient.shared.listMovieByGenre(
            genre: String(format:"\(self.genre!)"),
            tag: self.tagValue!,
            page:  String(format:"\(pageIndex)"),
            completion: { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                if(isSuccess!) {
                    let rsMovie = value as! ResponseMovie
                    let listTemp = rsMovie.data!.list as List<Movie>
                    for item in listTemp {
                        self.listMovies.append(item)
                    }
                    self.colTag.reloadData()
                    self.currentPageIndex += 1
//                    self.lastPageIndex = Int(rsMovie.data!.metadata!.totalRecord / rsMovie.data!.metadata!.field) * PaginationInfo.rateField // field = 1000 -> real field = 10 --> rate = 100
                    // field = 0.0
                    self.lastPageIndex = self.currentPageIndex + 1
                }
            })
    }
    

}
