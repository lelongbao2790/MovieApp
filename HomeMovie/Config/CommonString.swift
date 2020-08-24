//
//  CommonString.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import CryptoKit
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import CommonCrypto

extension String {
    
    func md5() -> String {
        if #available(iOS 13.0, *) {
            let md5String = String(format: "\(Insecure.MD5.hash(data: self.data(using: .utf8)!))")
            return md5String.replacingOccurrences(of: "MD5 digest: ", with: "", options: [.caseInsensitive, .regularExpression])
        } else {
           let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
            var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5_Init(context)
            CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
            CC_MD5_Final(&digest, context)
            var hexString = ""
            for byte in digest {
                hexString += String(format:"%02x", byte)
            }

            return hexString
        }
       
        
    }
}

struct Message {
    static let LoginFailMessage = "Invalid password"
    static let LoadingMessage = "Loading..."
    
}



