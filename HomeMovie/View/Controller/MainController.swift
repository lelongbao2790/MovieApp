//
//  MainController.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit

class MainController : UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    // temp solution
//    // TODO: save list movie to local
//    var listMovieData = [ false ,false, false, false, false, false, false, false, false,
//        false, false, false, false,false, false, false, false, false, false,false, false,
//        false, false, false,false,false, false, false, false, false
//    ]
//
    @IBOutlet weak var bannerView: BannerView!
    @IBOutlet weak var tbvCategory: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        bannerView.loadMovies(page: CommonData.kDefaultNumber + 1)
        tbvCategory.allowsSelection = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bannerView.navigationOfController = self.navigationController!
        self.bannerView.storyboardOfController = self.storyboard!
    }
    
    // MARK - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleMenu.FeaturesTitleMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell: MovieCell = self.tbvCategory.dequeueReusableCell(withIdentifier: StoryboardId.MovieCellId, for: indexPath) as! MovieCell
        
        movieCell.navigationOfController = self.navigationController!
        movieCell.storyboardOfController = self.storyboard!
        movieCell.loadInformation(
            category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row],
            tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row])
        
        return movieCell
    }
    
//    // TEST
//    func searchMovieByKeyword(keyword: String) {
//        BaseClient.shared.searchMovieByKeyword(keyword: keyword, page: "1", limit: "5", completion: {
//            (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
//            if(isSuccess!) {
//                let resDetailMovie = value as! ResponseSearchMovie
//                var a = 0
//                a = 9
//            }
//        })
//    }
}
