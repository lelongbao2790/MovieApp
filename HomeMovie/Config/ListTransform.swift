//
//  ListTransform.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/17/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ListTransform<T:Object> : TransformType where T:Mappable {
    
    typealias Object = List<T>
    typealias JSON = [[String:Any]]
    
    let mapper = Mapper<T>()
    
    func transformFromJSON(_ value: Any?) -> List<T>? {
        let result = List<T>()
        if let tempArr = value as? [Any] {
            for entry in tempArr {
                let mapper = Mapper<T>()
                let model : T = mapper.map(JSONObject: entry)!
                result.append(model)
            }
        }
        return result
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        var results = [[String:Any]]()
        if let value = value {
            for obj in value {
                let json = mapper.toJSON(obj)
                results.append(json)
            }
        }
        return results
    }
}
