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
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var knownAsLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var plotViText: UITextView!
    //
    var data: Movie?
    var posterData: UIImage?

    //
    // MARK: Life-Cycle
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        posterImage.image = posterData
        movieNameLabel.text = data?.movieName
        knownAsLabel.text = data?.knownAs
        rateLabel.text = String(format: "\(data?.rating as! Double) / 10.00")
        plotViText.text = data?.plotVi
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
