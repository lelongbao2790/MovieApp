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
    var Title:String = ""
    var tagMovie:String = ""
  var listMovies = List<Movie>()
    override func viewDidLoad() {
        super.viewDidLoad()
   
     customNavigation()
        // Do any additional setup after loading the view.
        collectionMovie.delegate = self
        collectionMovie.dataSource = self
    print(tagMovie)
        
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
           return self.listMovies.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardId.MovieCollectionViewCellId, for: indexPath) as! MovieCollectionViewCell
        cell.lbName.text = tagMovie

           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: Size.kWidthBannerCell, height: Size.kHeightBannerCell)
       }
    
}


