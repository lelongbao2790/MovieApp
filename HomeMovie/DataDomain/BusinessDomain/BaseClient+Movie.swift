//
//  BaseClient+Movie.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

extension BaseClient {
    
    func loginWithUrl(username:String, password: String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            
            // Run on background thread
            let request = Services.login(username: username, password: password) as URLRequestConvertible
            Alamofire.request(request)
                .responseJSON { ( response : DataResponse <Any>) in
                
                switch response.result {
                case .success (_):
                    
                    let data = response.result.value as? NSDictionary
                    let errorKey = data?.object(forKey: ResponseKey.ErrorKey) as? Int
                    let rawValue = data?.object(forKey: ResponseKey.RawKey)
                    
                    if ( errorKey == ErrorCode.Success.rawValue) {
                            // Login success
                        self.accessToken = (rawValue as!  NSDictionary).object(forKey: ResponseKey.AccessToken) as? String
                        DispatchQueue.main.async {
                            // Run on main thread
                            completion(true, nil, data as AnyObject);
                        }
                        
                        
                    } else {
                        // Login fail
                        let message = String(format: "\(rawValue as? String ?? Message.LoginFailMessage)")
                        
                        let error = NSError(domain: Services.baseHTTPS,
                                            code: 0,
                                            userInfo: [NSLocalizedDescriptionKey :message])
                        DispatchQueue.main.async {
                            // Run on main thread
                            completion(false, error, nil);
                        }
                    }
                        break
                    case .failure(let error):
                        DispatchQueue.main.async {
                            // Run on main thread
                            completion(false, error as NSError?, nil);
                        }
                        break
                }
            }
        }
    }
    
    func listMovieByGenre(genre: String, tag: String, page: String) {
        DispatchQueue.global(qos: .background).async {
            // Run on background
            let request = Services.listMovie(genre: genre, tag: tag, page: page, token: self.accessToken!) as URLRequestConvertible
            Alamofire.request(request)
                    .responseObject { (response: DataResponse<ResponseMovie>) in
                    switch response.result {
                    case let .success(data):
                        DispatchQueue.main.async {
                            // Run on main thread

                        }
                        break

                    case let .failure(error):
                        DispatchQueue.main.async {
                            // Run on main thread

                        }
                        break
                    }
            }
        }
    }
    
}
