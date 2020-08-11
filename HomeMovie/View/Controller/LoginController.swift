//
//  LoginController.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/11/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {

    //--------------------
    // MARK : Properties
    //--------------------
    @IBOutlet weak var tfPassword: CustomField!
    @IBOutlet weak var tfUserName: CustomField!
    
    //--------------------
    // MARK : Life Cycle
    //--------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        hideKeyboardWhenTappedAround()
    
    }
    
    //--------------------
    // MARK : UITextFieldDelegate
    //--------------------
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    //--------------------
    // MARK : Helper
    //--------------------
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

}
