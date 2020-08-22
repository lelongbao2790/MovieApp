//
//  ResponseDetailMovie.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/21/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseDetailMovie: Object, Mappable {
    var error = 0
    var detailMovie: DetailMovie?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        error             <- map["e"]
        detailMovie           <- map["r"]
    }
}
