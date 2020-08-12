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
        configView()
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
    
    func configView() {
        
        // Config field
        tfUserName.addBottomBorder()
        tfPassword.addBottomBorder()
        
        // Init tap gesture
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    //--------------------
    // MARK : Action
    //--------------------
    @IBAction func loginAction(_ sender: Any) {
        if(!tfUserName.text!.isEmpty && !tfPassword.text!.isEmpty) {
            Loading.showLoading(message: Message.LoadingMessage, view: self.view)
            BaseClient.sharedInstance.loginWithUrl(username: tfUserName.text!,
                                                   password: tfPassword.text!)
            { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                Loading.dismissLoading()
                if(isSuccess!) {
                    self.navigationController?.pushViewController(self.initController(id: StoryboardId.MainControllerId), animated: true)
                } else {
                    // Show message login fail
                }
            }
        }
        
    }
}
