//
//  LoginViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 05/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController ,NSTextFieldDelegate{

    @IBOutlet weak var userEmail: NSTextField!
    var carVC:CarViewController?
    
    @IBOutlet weak var invalid: NSTextField!
    @IBOutlet weak var password: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        invalid.alphaValue=0
        userEmail.delegate=self
        password.delegate=self
        // Do view setup here.
    }
    
    func controlTextDidChange(_ obj: Notification) {
        guard let textField = obj.object as? NSTextField else {return}
        
        if(textField == userEmail){
            invalid.alphaValue=0
        }
        if(textField == password){
            invalid.alphaValue=0
        }
    }
    
    
    @IBAction func login(_ sender: Any) {
//        if let mainWC = view.window?.windowController as? MainWindowController {
//
//            mainWC.moveToVC()
        
//        }
        
   let presenter = BookingPresenter()
      
        let result = presenter.authenticate(userEmail: userEmail.stringValue, password: password.stringValue)
        if(result == -1){
            invalid.alphaValue=1
            Authentication.userId=result
            Authentication.Authenticated=false
        }
        else{
            Authentication.userId=result
            Authentication.Authenticated=true
            carVC?.moveToConfVC()
            dismiss(self)
        }
        
        
    }
    
}
