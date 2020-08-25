//
//  SearchMovieCell.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/23/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class SearchMovieCell: UITableViewCell {
    
    //
    // MARK: Properties
    //
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var knownAsLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var plotViText: UITextView!
    
    var data: SearchMovie? {
        didSet {
            guard let data = data else { return }
            
            movieNameLabel.text = data.movieName
            knownAsLabel.text = data.knownAs
            plotViText.text = data.plotVi
            rateLabel.text = String(format: "\(data.rating as! Double) / 10.00")
            if(data.poster.count > 0){
                let url = URL.init(string: "\(API.kPosterUrl + data.poster)")! as URL
                DataManager.shared.downloadImageUrl(imageView: self.posterImage, from: url)            }
        }
                
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

}
