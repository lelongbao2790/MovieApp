//
//  TagMoviesCell.swift
//  HomeMovie
//
//  Created by thinhdang on 8/19/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

protocol TagMoviesCellProtocol : AnyObject {
    func moviePage(at index:IndexPath)
}

class TagMoviesCell: UITableViewCell{
   @IBOutlet weak var lbTag:UILabel!
    @IBOutlet weak var collectionMovie: MainTagMoviesCollection!
    @IBOutlet weak var btnMore: UIButton!
    
    weak var delegate:TagMoviesCellProtocol?
    var indexPath:IndexPath!
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
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        vc.navigationItem.largeTitleDisplayMode = .never
//        present(UINavigationController(rootViewController: vc),animated: true)
        delegate?.moviePage(at: indexPath)
    }
   
}
