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
    var tagName: String? {
        didSet {
            print(self.tagName!)
            self.tagValue = Tag.Features[tagName!]
        }
    }
    var genre: Int?
    var listMovies = List<Movie>()
    var currentPageIndex: Int = 1
    
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
    // MARK: Properties
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
        if indexPath.row + 1 >= listMovies.count {
            currentPageIndex += 1
            loadMovies(pageIndex: currentPageIndex)
        }
    }
    
    
    @IBAction func exit(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
                }
            })
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
