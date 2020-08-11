//
//  BaseClient.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import Alamofire

class BaseClient: NSObject {
    
    //Singleton
    static let sharedInstance = BaseClient()
    
    //Block
    typealias ServiceResponse = (Bool?, NSError?, AnyObject?) -> Void
    
   // Create basic url
    enum Services: URLRequestConvertible
    {
        case login(username: String, password: String)
        case listMovie(genre: String, tag: String, page: String, token: String)
        case detailInformation(movieId: String, token: String)
        case playMovie(movieId: String, token: String, ep: String)

        static let baseHTTPS = API.kBaseUrlSSL
        static let baseHTTP = API.kBaseUrl
        
        var method: HTTPMethod
        {
            switch self {
            case .login: return .get
            case .listMovie: return .get
            case .detailInformation: return .get
            case .playMovie: return .get
                
            }
         }

        var path: String
        {
            switch self {
            case .login(let username, let password):
                return String(format: API.kLoginUrl, username, password.md5())
                
            case .listMovie(let genre, let tag, let page, _):
                return String(format: API.kListMovieByGenre, genre, tag, page)
                
            case .detailInformation(let movieId, _):
                return String(format: API.kDetailUrl, movieId)
                
            case .playMovie(let movieId, let token, let ep):
                return String(format: API.kPlayUrl, movieId, token, ep)
            
            }
        }

        // MARK: URLRequestConvertible

        func asURLRequest() throws -> URLRequest
        {
            
            // Create http url
            let urlHttp = try Services.baseHTTP.appending(path).asURL()
            var urlHttpRequest = URLRequest(url: urlHttp)
            urlHttpRequest.httpMethod = method.rawValue
            
            // Create https url
            let urlHttps = try Services.baseHTTPS.appending(path).asURL()
            var urlHttpsRequest = URLRequest(url: urlHttps)
            urlHttpsRequest.httpMethod = method.rawValue
            urlHttpsRequest.setValue(Header.ApplicationJson, forHTTPHeaderField: Header.ContentType)
            
            switch self {
            case .login(_, _):
                return urlHttpsRequest
                
            case .playMovie(_, _, _):
                return urlHttpsRequest
                
            case .listMovie( genre: _, tag: _, page: _, token: let accessToken):
                urlHttpRequest.setValue("\(accessToken)", forHTTPHeaderField: Header.AccessTokenKey)
                return urlHttpRequest
                
            case .detailInformation(movieId: _, token: let accessToken):
                urlHttpRequest.setValue("\(accessToken)", forHTTPHeaderField: Header.AccessTokenKey)
                return urlHttpRequest
            }
          }
    }

}
