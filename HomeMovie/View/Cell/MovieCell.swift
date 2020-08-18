//
//  MovieCell.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    // MARK - Properties
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var collectionMovie: MovieCollection!
    
    // MARK - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK - Helper
    func loadInformation(category: String, tag: String) -> Void {
        DispatchQueue.main.async(execute: {
            self.lbTitle.text = category
            self.collectionMovie.setDelegateDatasource()
            self.collectionMovie.loadMovies(tagMovie: tag)
        })
        
    }

    // MARK - Action
    @IBAction func showAll(_ sender: Any) {
    }
}
