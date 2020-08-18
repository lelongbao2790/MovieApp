//
//  BaseUrl.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation

struct API {
    
    static let kBaseUrlSSL = "https://api-v2.hdviet.com/"
    static let kBaseUrl = "http://rest.hdviet.com/"
    static let kPosterUrl = "http://t.hdviet.com/thumbs/origins/"
    static let kBannerUrl = "http://t.hdviet.com/backdrops/origins/"
    
    static let kLoginUrl = "user/login?email=%@&password=%@"
    static let kDetailUrl = "movie?movieid=%@"
    static let kListMovieByGenre = "api/v3/movie/filter?genre=%d&tag=%@&page=%d&limit=0"
    static let kPlayUrl = "movie/play?movieid=%@&accesstokenkey=%@&ep=%d"
    static let kSearchUrl = "api/v3/search?keyword=%@&page=1&limit=100"
}
