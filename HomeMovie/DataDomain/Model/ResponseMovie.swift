//
//  ResponseMovie.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

import ObjectMapper
class ResponseMovie: NSObject, Mappable {
    var error = 0
    var message = ""
    var data : Datas?
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        error             <- map["error"]
        message           <- map["message"]
        data              <- map["data"]
       
    }
}

class Datas: NSObject, Mappable {
    var metadata : Metadata?
    var list :Array<Movie>?

   required convenience init?(map: Map) {
       self.init()
   }

   func mapping(map: Map) {
       metadata        <- map["metadata"]
       list           <- map["lists"]
      
   }
}
