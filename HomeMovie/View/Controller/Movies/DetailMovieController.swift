//
//  DetailMovieController.swift
//  HomeMovie
//
//  Created by thinhdang on 8/24/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class DetailMovieController: UIViewController {
 var data: Movie?
    var postMovie: UIImage?
    
    @IBOutlet weak var lbMovieName: UILabel!
    @IBOutlet weak var imgPosterMovie: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = data?.movieName
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbMovieName.text = data?.movieName
        imgPosterMovie.image = postMovie
    }
}
