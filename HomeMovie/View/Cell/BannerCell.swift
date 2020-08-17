//
//  BannerCell.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import Alamofire

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    
    var data: Movie? {
        didSet {
            guard let data = data else { return }
            
            if(data.banner.count > 0){
                let url = URL.init(string: "\(API.kBannerUrl + data.banner)")! as URL
                self.imgBanner.downloaded(from: url)
                lbName.text = String(format: "   \(data.movieName)") 
            }
        }
    }
}

