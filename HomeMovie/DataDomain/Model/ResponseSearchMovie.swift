//
//  ResponseSearchMovie.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/22/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper


//
// MARK: Response Search Movie
//
class ResponseSearchMovie: Object, Mappable {
    var error = 0
    var message = ""
    var data: SearchDatas?
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        error             <- map["error"]
        message           <- map["message"]
        data              <- map["data"]
       
    }
}

//
// MARK: Search Data
//
class SearchDatas: Object, Mappable {
    
    var searchHeader : SearchHeader?
    var searchBody: SearchBody?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
   func mapping(map: Map) {
       searchHeader        <- map["responseHeader"]
       searchBody          <- map["response"]
   }
}

//
// MARK: Search Header
//
class SearchHeader: Object, Mappable {

    var status: Int = 0

    required convenience init?(map: Map) {
        self.init()
    }
    
   func mapping(map: Map) {
       status        <- map["status"]
   }
}

//
// MARK: Search Body
//
class SearchBody: Object, Mappable {
    
    var numFound: Int = 0
    var start: Int = 0
    var limit: Int = 0
    var page: Int = 1
    var keyword: String = ""
    var docs = List<SearchMovie>()

    required convenience init?(map: Map) {
        self.init()
    }
    
   func mapping(map: Map) {
        numFound        <- map["numFound"]
        start           <- map["start"]
        limit           <- map["limit"]
        page            <- map["page"]
        keyword         <- map["keyword"]
        docs            <- (map["docs"], ListTransform<SearchMovie>())
      
   }
}


