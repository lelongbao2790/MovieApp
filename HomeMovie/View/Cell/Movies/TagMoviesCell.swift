//
//  TagMoviesCell.swift
//  HomeMovie
//
//  Created by thinhdang on 8/19/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

protocol TagMoviesCellProtocol : AnyObject {
    func moviePage(_ data: String)
}

class TagMoviesCell: UITableViewCell{
   @IBOutlet weak var lbTag:UILabel!
    @IBOutlet weak var collectionMovie: MainTagMoviesCollection!
    @IBOutlet weak var btnMore: UIButton!
    let TagMovie: String = ""

    var indexPath: IndexPath!
    weak var delegate:TagMoviesCellProtocol?
    

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Helper
    func loadInformation(category: String, tag: String) -> Void {
        DispatchQueue.main.async(execute: {
            self.lbTag.text = category
            self.collectionMovie.setDelegateDatasource()
            self.collectionMovie.loadMovies(tagMovie: tag)
            
        })
    }
    
    //MARK: -Action
    @IBAction func showAllMovies(_ sender: Any) {
        let titleLabel = lbTag.text!
        delegate?.moviePage(titleLabel)
        
    }
   
}
