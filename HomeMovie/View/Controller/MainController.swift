//
//  MainController.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit

class MainController : UIViewController {

    @IBOutlet weak var bannerView: BannerView!
    
    override func viewDidLoad() {
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(false)
        bannerView.loadMovies()
    }

}
