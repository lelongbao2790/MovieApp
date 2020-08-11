//
//  MainController.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/7/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import Foundation
import UIKit

class MainController : UIViewController {

    
    override func viewDidLoad() {
        BaseClient.sharedInstance.loginWithUrl(username: "lelongbao2790@gmail.com", password: "123456") { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
 
    }
}
