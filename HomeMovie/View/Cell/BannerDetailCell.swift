//
//  BannerDetailCell.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/24/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class BannerDetailCell: UITableViewCell {

    @IBOutlet weak var bannerCollectionView: BannerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadInformation() -> Void {
        bannerCollectionView.loadInformation()
    }

}
