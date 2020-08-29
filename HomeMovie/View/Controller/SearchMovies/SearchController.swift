//
//  SearchController.swift
//  HomeMovie
//
//  Created by thinhdang on 8/27/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper


class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    var listSearchMovie = List<Search>()
    var listMovies = List<Movie>()
    // These strings will be the data for the table view cells
       
       let cellSpacingHeight: CGFloat = 5
       
       @IBOutlet var tableView: UITableView!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // These tasks can also be done in IB if you prefer.
           tableView.delegate = self
           tableView.dataSource = self
           searchBar.delegate = self
       }
       
       // MARK: - Table View delegate methods
       
       // There is just one row in every section
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.listSearchMovie.count
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
           let cell: SearchCell = self.tableView.dequeueReusableCell(withIdentifier: StoryboardId.SearchCellId, for: indexPath) as! SearchCell
           // note that indexPath.section is used rather than indexPath.row
         
           cell.data = listSearchMovie[indexPath.row]

           return cell
       }
       
       // method to run when table view cell is tapped
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // note that indexPath.section is used rather than indexPath.row
           print("You tapped cell number \(indexPath.section).")
       }
}

extension SearchController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let movie = searchBar.text else { return }
        searchMovie(keyword: movie)
        print("you type \(movie)")
            
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil

        
    }
}

extension SearchController{

    func searchMovie(keyword: String) {
    BaseClient.shared.searchMovieByKeyword(
        keyword: keyword,
        completion: {
            (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
            if(isSuccess!) {
                let resMovie = value as! ResponseSearchMovie
                let listTemp = resMovie.data!.searchBody!.docs as List<Search>
                for item in listTemp {
                    self.listSearchMovie.append(item)
                }
                self.tableView.reloadData()
            }
        })
    }
}


