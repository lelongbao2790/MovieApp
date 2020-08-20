//
//  CategoryCellTableViewCell.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/19/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class TagCell: UITableViewCell {

    //
    // MARK: Properties
    //
    @IBOutlet weak var BtnTag: UIButton!
    var title: String? {
        didSet {
            self.BtnTag.setTitle(self.title!, for: .normal)
        }
    }
    
    
    //
    // MARK: Private Methods
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
