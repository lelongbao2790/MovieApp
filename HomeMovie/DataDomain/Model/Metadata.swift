//
//  Metadata.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class Metadata: Object , Mappable{
    var tag = ""
    var page = 0
    var totalRecord = 0
    var genre = 0
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        tag             <- map["tag"]
        page           <- map["page"]
        totalRecord     <- map["totalRecord"]
        genre            <- map["genre"]
        
    }
}
