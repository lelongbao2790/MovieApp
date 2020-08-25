//
//  SearchController.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/22/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class SearchController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
   

    //
    // MARK: Properties
    //
    @IBOutlet weak var TbvMovie: UITableView!
    var listSearchMovie = List<SearchMovie>()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    //
    // MARK: Life Cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true // this is covered when descendants presents a view controller
        self.TbvMovie.tableHeaderView = searchController.searchBar
//        self.TbvMovie.contentOffset = CGPoint(x: 0, y: searchController.searchBar.frame.height)
    }
    
    
    //
    // MARK: UITableViewDataSource, UITableViewDelegate
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? listSearchMovie.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchMovieCell = self.TbvMovie.dequeueReusableCell(withIdentifier: StoryboardId.SearchMovieCellId, for: indexPath) as! SearchMovieCell
        cell.data = listSearchMovie[indexPath.row]
        return cell
    }
    

    //
    // MARK: UISearchResultsUpdating
    //
    func updateSearchResults(for searchController: UISearchController) {
        if let keyword = searchController.searchBar.text {
            listSearchMovie = List<SearchMovie>()
            searchMovie(keyword: keyword)
        }
    }
     
    //
    // MARK: Private Methods
    //
    func searchMovie(keyword: String) {
        BaseClient.shared.searchMovieByKeyword(
            keyword: keyword,
            completion: {
                (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                if(isSuccess!) {
                    let resMovie = value as! ResponseSearchMovie
                    let listTemp = resMovie.data!.searchBody!.docs as List<SearchMovie>
                    for item in listTemp {
                        self.listSearchMovie.append(item)
                    }
                    self.TbvMovie.reloadData()
                }
        })
    }
    
    
    
    
}
