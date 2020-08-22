//
//  DetailMovieController.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/20/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class DetailMovieController: UIViewController {
    
    //
    // MARK: Properties
    //
    var data: Movie? {
        didSet {
            print(self.data?.movieName)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
