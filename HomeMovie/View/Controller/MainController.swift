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
    
    @IBOutlet weak var bannerView: BannerView!
    @IBOutlet weak var tbvCategory: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        bannerView.loadMovies(page: CommonData.kDefaultNumber + 1)
    }

    // MARK - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tag.Features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell: MovieCell = self.tbvCategory.dequeueReusableCell(withIdentifier: StoryboardId.MovieCellId, for: indexPath) as! MovieCell
        movieCell.loadInformation(category: ([String](Tag.Features.keys))[indexPath.row],
                                  tag: ([String](Tag.Features.values))[indexPath.row])
        return movieCell
    }
}
