//
//  DetailMovie.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/21/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class DetailMovie: Movie {

    var knownAs = ""
    var category = List<Category>()
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        knownAs             <- map["KnownAs"]
        category             <- map["Category"]
    }
}


//
class Category: Object, Mappable {

    var categoryId: Double = 0
    var categoryName = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        categoryId             <- map["CategoryID"]
        categoryName           <- map["CategoryName"]
    }
}

