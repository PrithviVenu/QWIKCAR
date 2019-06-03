//
//  LoginViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 05/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func login(_ sender: Any) {
        if let mainWC = view.window?.windowController as? MainWindowController {

            mainWC.moveToVC()
            
        }
    }
    @IBAction func createAccountClicked(_ sender: Any) {
        if let mainWC = view.window?.windowController as? MainWindowController {
            mainWC.moveToCreateAccount()
            
        }
    }
    
}
