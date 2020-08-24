//
//  MainController.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MainController : UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate {
     
    @IBOutlet weak var tbvCategory: UITableView!
    
    // MARK - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tbvCategory.allowsSelection = false
    }
    
    // MARK - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleMenu.FeaturesTitleMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if(indexPath.row == 0) {
            let bannerDetailCell: BannerDetailCell = self.tbvCategory.dequeueReusableCell(withIdentifier: StoryboardId.BannerDetailCellId, for: indexPath) as! BannerDetailCell
            bannerDetailCell.loadInformation()
            return bannerDetailCell
            
        } else {
            let movieCell: MovieCell = self.tbvCategory.dequeueReusableCell(withIdentifier: StoryboardId.MovieCellId, for: indexPath) as! MovieCell
            movieCell.loadInformation(
                category: ([String](TitleMenu.FeaturesTitleMenu))[indexPath.row],
                tag: ([String](TitleMenu.FeaturesTagMenu))[indexPath.row])
            return movieCell
        }
        
        
    }

}
