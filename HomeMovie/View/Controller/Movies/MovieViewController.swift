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
   var Title: String = ""
        var tagMovie: String = ""
        var listMovies = List<Movie>()
    var genre:Int = 0
    var currentPage: Int = 1
    override func viewDidLoad() {
            super.viewDidLoad()
       
         customNavigation()
            // Do any additional setup after loading the view.
        }
    override func viewWillAppear(_ animated: Bool) {
         self.loadMovies(tagMovie: tagMovie, pageNumber: currentPage)
        collectionMovie.dataSource = self
    
    }
        
        
    private func loadMovies(tagMovie: String,pageNumber: Int) {
            BaseClient.shared.listMovieByGenre(
                genre: String(format:"\(self.genre)"),
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

//            func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//            if indexPath.row + 1 >= listMovies.count {
//                currentPage += 1
//                loadMovies(tagMovie: tagMovie,pageNumber: currentPage)
//                }
//            }
   
           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.MovieCollectionViewCellId, for: indexPath) as! MovieCollectionViewCell
                cell.lbName.text = tagMovie
                cell.data = listMovies[indexPath.item]
            print("list movie \(listMovies[indexPath.item].movieName)")
            if(indexPath.row == listMovies.count-1){
                //
                loadMovies(tagMovie: tagMovie, pageNumber: (listMovies.count/10) + 1)
            }
                return cell
           }
}


