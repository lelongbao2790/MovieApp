//
//  SearchMovie.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/22/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class SearchMovie: Object, Mappable {

    var movieId: Double = 0
    var movieName = ""
    var knownAs = ""
    var cast = ""
    var plotVi = ""
    var rating: Double = 0
    var poster = ""
    var banner = ""
    var episode: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        movieId             <- map["id"]
        movieName           <- map["mo_name"]
        knownAs             <- map["mo_known_as"]
        cast                <- map["mo_cast"]
        plotVi              <- map["mo_plot_vi"]
        rating              <- map["mo_imdb_rating"]
        poster              <- map["mo_new_poster"]
        banner              <- map["mo_backdrop"]
        episode             <- map["mo_episode"]
    }
}
