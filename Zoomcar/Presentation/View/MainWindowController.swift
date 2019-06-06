//
//  MainWindowController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 03/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.appearance=NSAppearance(named: NSAppearance.Name.vibrantLight)

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
//    func moveToCarVC(){
//        if  let carVC = storyboard?.instantiateController(withIdentifier: "car") as? CarViewController{
//            window?.contentViewController=carVC
//
//        }
//
//    }
//    func moveToCarBookingVC(){
//        if  let carBookingVC = storyboard?.instantiateController(withIdentifier: "carBookingVC") as? CarBookingViewController{
//            window?.contentViewController=carBookingVC
//
//        }
//    }
    func moveToCreateAccount(){
        if  let createAccountVC = storyboard?.instantiateController(withIdentifier: "createAccountVC") as? CreateAccountViewController{
            window?.contentViewController=createAccountVC
            
        }
        
    }
    func proceedToLogin(){
        if  let loginVC = storyboard?.instantiateController(withIdentifier: "login") as? LoginViewController{
            window?.contentViewController=loginVC
            
        }
        
    }
    func moveToVC(){
        if  let VC = storyboard?.instantiateController(withIdentifier: "viewController") as? ViewController{
            window?.contentViewController=VC
            
        }
        
    }
    func proceedToCreateAccount(){
        if  let proceedCreateVC = storyboard?.instantiateController(withIdentifier: "proceedCreateVC") as? ProceedCreateViewController{
            window?.contentViewController=proceedCreateVC
            
        }
        
    }
}
