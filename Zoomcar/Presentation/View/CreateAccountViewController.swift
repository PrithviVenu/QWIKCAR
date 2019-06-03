//
//  CreateAccountViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 05/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class CreateAccountViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func moveToLogin(_ sender: Any) {
    }
    @IBAction func Proceed(_ sender: Any) {
        if let mainWC = view.window?.windowController as? MainWindowController {
            mainWC.proceedToCreateAccount()
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if let mainWC = view.window?.windowController as? MainWindowController {
            mainWC.proceedToLogin()
        }
    }
}
