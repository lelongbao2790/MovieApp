//
//  Movie.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class Movie: Object, Mappable {

    var movieId: Double = 0
    var movieName = ""
    var cast = ""
    var plotVi = ""
    var rating: Double = 0
    var trailer = ""
    var poster = ""
    var banner = ""
    var episode: Int = 0
    var sequence: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        movieId             <- map["MovieID"]
        movieName           <- map["MovieName"]
        cast                <- map["Cast"]
        plotVi              <- map["PlotVI"]
        rating              <- map["ImdbRating"]
        trailer             <- map["Trailer"]
        poster              <- map["NewPoster"]
        banner              <- map["Backdrop"]
        episode             <- map["Episode"]
        sequence            <- map["Sequence"]
    }
}
