//
//  ProceedCreateViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 05/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class ProceedCreateViewController: NSViewController {

    @IBAction func createAccount(_ sender: Any) {
        if let mainWC = view.window?.windowController as? MainWindowController {
            
            mainWC.moveToVC()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
