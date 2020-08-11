//
//  CommonString.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import CryptoKit

extension String {
    func md5() -> String {
        let md5String = String(format: "\(Insecure.MD5.hash(data: self.data(using: .utf8)!))")
        return md5String.replacingOccurrences(of: "MD5 digest: ", with: "", options: [.caseInsensitive, .regularExpression])
    }
}
