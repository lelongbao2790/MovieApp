//
//  BaseClient+Movie.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import Alamofire

extension BaseClient {
    
    func loginWithUrl(username:String, password: String, completion:@escaping ServiceResponse) {
        let request = Services.login(username: username, password: password) as URLRequestConvertible
        Alamofire.request(request)
            .responseJSON { ( response : DataResponse <Any>) in
            
            switch response.result {
                
            case .success (let movie):
                //completion(true, nil, movie as AnyObject);
                
                break
            case .failure(let error):
                //completion(false, error as NSError?, nil);
                break
                
            }
        }
    }
//    
//    func listMovieByGenre(genre: String, tag: String, page: String) {
//        let request = Services.listMovie(genre: genre, tag: tag, page: page, token: <#T##String#>) as URLRequestConvertible
//        Alamofire.request(request)
//            .responseJSON { ( response : DataResponse <Any>) in
//            
//            switch response.result {
//                
//            case .success (let movie):
//                //completion(true, nil, movie as AnyObject);
//                
//                break
//            case .failure(let error):
//                //completion(false, error as NSError?, nil);
//                break
//                
//            }
//        }
//    }
    
}
