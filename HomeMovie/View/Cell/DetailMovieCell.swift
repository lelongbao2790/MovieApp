//
//  DetailMovieCell.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class DetailMovieCell: UICollectionViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    var data: Movie? {
        didSet {
            guard let data = data else { return }
            
            if(data.poster.count > 0){
                let url = URL.init(string: "\(API.kPosterUrl + data.poster)")! as URL
                DataManager.shared.downloadImageUrl(imageView: self.imgPoster, from: url)
                lbName.text = String(format: " \(data.movieName)")
            }
        }
    }
}
