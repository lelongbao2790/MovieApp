//
//  ViewController.swift
//  HomeMovie
//
//  Created by thinhdang on 8/20/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class MovieViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{


    @IBOutlet weak var collectionMovie: UICollectionView!

     var tagMovie: String?
    var Title: String? {
        didSet {
            print(self.Title!)
            self.tagMovie = Tag.Features[Title!]
         
        }
    }
   
    var listMovies = List<Movie>()
    var genre:Int?
    var currentPage: Int = 1
    
    override func viewDidLoad() {
            super.viewDidLoad()
       
         customNavigation()
            // Do any additional setup after loading the view.
        }
    override func viewWillAppear(_ animated: Bool) {
         self.loadMovies(tagMovie: tagMovie!, pageNumber: currentPage)
        collectionMovie.dataSource = self
        collectionMovie.delegate = self
    }
        
        
    private func loadMovies(tagMovie: String,pageNumber: Int) {
      
            BaseClient.shared.listMovieByGenre(
                genre: String(format:"\(self.genre!)"),
                tag: tagMovie,
                page:  String(format:"\(pageNumber)"),
                completion: { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                    if(isSuccess!) {
                        let rsMovie = value as! ResponseMovie
                        //let movies
                        for movies in  rsMovie.data!.list as List<Movie>{
                            self.listMovies.append(movies)
                        }

                        self.collectionMovie.reloadData()
 
                    }
                })
        }
         
        func customNavigation() {
            self.navigationItem.title = Title
            let navBar = self.navigationController?.navigationBar

              // change the bar tint color to change what the color of the bar itself looks like
              navBar?.barTintColor = UIColor.black

              // tint color changes the color of the nav item colors eg. the back button
              navBar?.tintColor = UIColor.white
              
              // the following attribute changes the title color
              navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        //MARK: - Helper
        
       //MARK: -Delegate and Datasource
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return listMovies.count
           }

           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.MovieCollectionViewCellId, for: indexPath) as! MovieCollectionViewCell
                cell.lbName.text = tagMovie
                cell.data = listMovies[indexPath.item]
           // print("list movie \(listMovies[indexPath.item].movieName)")
            if(indexPath.row == listMovies.count-1){
                //
                loadMovies(tagMovie: tagMovie!, pageNumber: (listMovies.count/10) + 1)
            }
                return cell
           }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("list movie \(listMovies[indexPath.item].movieName)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.MovieCollectionViewCellId, for: indexPath) as! MovieCollectionViewCell
        
        let controller: DetailMovieController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.DetailMovieControllerId) as! DetailMovieController
       
        
        let cellCollectionView = listMovies[indexPath.item]
        controller.data = cellCollectionView
        
        cell.data = listMovies[indexPath.item]
        controller.postMovie = cell.imgPoster.image
        
        print(cell.imgPoster.image as Any)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}



