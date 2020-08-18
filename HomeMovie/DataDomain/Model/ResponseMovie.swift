//
//  ResponseMovie.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseMovie: Object, Mappable {
    var error = 0
    var message = ""
    var data: Datas?
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        error             <- map["error"]
        message           <- map["message"]
        data              <- map["data"]
       
    }
}

class Datas: Object, Mappable {
    
    
    var metadata : Metadata?
    var list = List<Movie>()

    required convenience init?(map: Map) {
        self.init()
    }
    
   func mapping(map: Map) {
       metadata        <- map["metadata"]
       list           <- (map["lists"], ListTransform<Movie>())
      
   }
}
