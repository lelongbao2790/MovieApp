//
//  MoviesController.swift
//  HomeMovie
//
//  Created by thinhdang on 8/29/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class MoviesController: UIViewController {

    var data:Movie?
    var postMovie: UIImage?
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbKnownAs: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var tfDescrip: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgPoster.image = postMovie
        lbKnownAs.text = data?.knownAs
        lbName.text = data?.movieName
        tfDescrip.text = data?.plotVi
        
        self.tfDescrip.isEditable = false
    }
}
