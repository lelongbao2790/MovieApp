//
//  TestController.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/24/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift

class TestController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //
    // MARK: Properties
    //
    @IBOutlet weak var tbvMovie: UITableView!
    @IBOutlet weak var searchBarMovie: UISearchBar!
    var listSearchMovie = List<SearchMovie>()
    var searchActive = false
    
    
    //
    // MARK: Life Cycle
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //
    // MARK: UITableViewDataSource, UITableViewDelegate
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchActive ? 0 : listSearchMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchMovieCell = self.tbvMovie.dequeueReusableCell(withIdentifier: StoryboardId.SearchMovieCellId, for: indexPath) as! SearchMovieCell
        cell.data = listSearchMovie[indexPath.row]
        return cell
    }
    
    
    //
    // MARK: UISearchBarDelegate
    //
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Begin Edit")
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("End Edit")
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel Btn")
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search Btn")
        self.searchBarMovie.endEditing(true)
        searchActive = false
        searchMovie(keyword: searchBar.text!)
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
                    self.tbvMovie.reloadData()
                }
        })
    }
    
}
