//
//  TypeMovieCollection.swift
//  HomeMovie
//
//  Created by thinhdang on 8/27/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class TypeMovieCollection: UICollectionViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    var data: Movie?{
        didSet{
            guard let data = data else {
                return
            }
            
            if(data.poster.count > 0){
                self.imgPoster.sd_setImage(with: URL(string: "\(API.kPosterUrl + data.poster)")!, placeholderImage: UIImage(named: "no_image_poster"))
                
                lbName.text = String(format: "\(data.movieName)")
            }
        }
    }
}
