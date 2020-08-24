//
//  MoviesController.swift
//  HomeMovie
//
//  Created by thinhdang on 8/19/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class MoviesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: -Declear
    var typeMovie: TypeMovies!
    let cellSpacingHeight: CGFloat = 10
    @IBOutlet var tbvTagMovies: UITableView!
    var typeFilm = ""
    
    //MARK: -Properties
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        let typeFilmIndex: Int = self.tabBarController!.selectedIndex
              if typeFilmIndex == StoryboardId.FeatureMoviesId {
                  typeMovie = TypeMovies.Feature
                typeFilm = "feature"
              }
              else if typeFilmIndex == StoryboardId.TelevisionId {
                  typeMovie = TypeMovies.Television
                typeFilm = "television"
              }
    }
    
   override func viewDidLoad() {
       super.viewDidLoad()
       
       // These tasks can also be done in IB if you prefer.
       tbvTagMovies.delegate = self
       tbvTagMovies.dataSource = self

   }
   
   // MARK: - Table View delegate methods
   // There is just one row in every section
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return TitleMenu.FeaturesTitleMenu.count
   }
   
   // Set the spacing between sections
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return cellSpacingHeight
   }
   
   // Make the background color show through
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView = UIView()
       headerView.backgroundColor = UIColor.clear
       return headerView
   }
   
   // create a cell for each table view row
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
    let cell: TagMoviesCell = self.tbvTagMovies.dequeueReusableCell(withIdentifier: StoryboardId.TagMoviesCellId, for: indexPath) as! TagMoviesCell
       
       // note that indexPath.section is used rather than indexPath.row

       // add border and color
       cell.backgroundColor = UIColor.white
       cell.layer.borderColor = UIColor.black.cgColor
       cell.layer.borderWidth = 1
       cell.layer.cornerRadius = 8
       cell.textLabel?.textColor = .lightGray
       cell.clipsToBounds = true
    
    if typeFilm == "feature" {
        cell.loadInformation(
        category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row],
        genre: String(format:"\(Genre.Feature.rawValue)"),
        tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row])
    }else{
        cell.loadInformation(
        category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row],
        genre: String(format:"\(Genre.Television.rawValue)"),
        tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row])
    }
       cell.delegate = self
       cell.indexPath = indexPath
       return cell
   }
   
   // method to run when table view cell is tapped
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("you tap \(indexPath.row)")

   }
}

extension MoviesController:TagMoviesCellProtocol{
    func moviePage(_ data: String,genre: String) {
        print(index)
        let vc = (storyboard?.instantiateViewController(identifier: StoryboardId.MovieViewControllerId) as? MovieViewController)!
          vc.Title = data
        if self.typeFilm == "feature" {
            vc.genre = Genre.Feature.rawValue
        }else{
            vc.genre = Genre.Television.rawValue
        }
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

