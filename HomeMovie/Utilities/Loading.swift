//
//  Loading.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/12/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit
import JGProgressHUD

class Loading: NSObject {

    static let activity = JGProgressHUD(style: .extraLight)
    
    static func showLoading(message: String, view: UIView) {
        activity.textLabel.text = message
        activity.show(in: view)   
    }
     
    static func dismissLoading() {
        activity.dismiss(afterDelay: 1.0)
    }
}
