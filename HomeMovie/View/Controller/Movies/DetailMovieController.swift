//
//  DetailMovieController.swift
//  HomeMovie
//
//  Created by thinhdang on 8/26/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class DetailMovieController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //MARK: -Properties
    @IBOutlet weak var TypeMovieCollection: UICollectionView!
    var listMovies = List<Movie>()
    var tagMovie: String?
    var Title: String? {
        didSet {
            print(self.Title!)
            self.tagMovie = Tag.Features[Title!]
        }
    }
    var genre: Int?
    var currentPage: Int = 1
    
    //MARK: -Init
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadMoVies(tagMovie: tagMovie!, pageNumber: currentPage)
        self.navigationTitle(title: Title!)
        TypeMovieCollection.delegate = self
        TypeMovieCollection.dataSource = self

    }

    
    //MARK: -Load movies
    private func loadMoVies(tagMovie: String,pageNumber: Int){
        BaseClient.shared.listMovieByGenre(
            genre: String(format: "\(self.genre!)"),
            tag: tagMovie,
            page: String(format: "\(pageNumber)"),
            completion: {
                (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                if(isSuccess!){
                    let rsMovie = value as! ResponseMovie

                   for movies in rsMovie.data!.list as List<Movie>{
                    
                       self.listMovies.append(movies)
                   }
                   self.TypeMovieCollection.reloadData()
                }
        })
    }

    //MARK: -delegate and dataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : TypeMovieCollection = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.TypeMovieCellId, for: indexPath) as! TypeMovieCollection
        cell.lbName.text = tagMovie
        cell.data = listMovies[indexPath.item]
        
        if(indexPath.row == listMovies.count - 1){
            loadMoVies(tagMovie: tagMovie!, pageNumber: (listMovies.count/10) + 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(listMovies[indexPath.row].movieName)")
        
        let controller: MoviesController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.MoviesControllerId) as! MoviesController
        
        let cell: TypeMovieCollection = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.TypeMovieCellId, for: indexPath) as! TypeMovieCollection
        
        let cellCollectionView = listMovies[indexPath.item]
        controller.data = cellCollectionView
        
        cell.data = listMovies[indexPath.item]
        controller.postMovie = cell.imgPoster.image
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}
