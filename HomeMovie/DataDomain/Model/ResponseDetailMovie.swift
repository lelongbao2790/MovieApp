////
////  ResponseDetailMovie.swift
////  HomeMovie
////
////  Created by Diep (Rocky) X.MAI on 8/21/20.
////  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//import ObjectMapper
//
//class ResponseDetailMovie: Object, Mappable {
//    var e = 0
//    var message = ""
//    var r: R?
//
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//    func mapping(map: Map) {
//        error             <- map["error"]
//        message           <- map["message"]
//        data              <- map["data"]
//
//    }
//}
//
//class R: Object, Mappable {
//
//
//    var metadata : Metadata?
//    var list = List<Movie>()
//
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//   func mapping(map: Map) {
//       metadata        <- map["metadata"]
//       list           <- (map["lists"], ListTransform<Movie>())
//
//   }
//}
//
