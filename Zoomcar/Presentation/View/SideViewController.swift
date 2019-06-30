//
//  SideViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 14/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class SideViewController: NSViewController {


    
    @IBOutlet weak var yourRides: NSButton!
    @IBOutlet weak var bookRide: NSButton!
    @IBOutlet weak var wallet: NSButton!
    
    static var home:HomeViewController?

    
    @IBAction func bookRide(_ sender: Any) {
        setAlpha()
        SideViewController.home?.mainVC()
        bookRide.backgroundWithAlpha(color: NSColor.white, alpha: 0.5)
    }
    
    
    @IBAction func yourRides(_ sender: Any) {
        setAlpha()
        SideViewController.home?.yourRidesVC()
        yourRides.backgroundWithAlpha(color: NSColor.white, alpha: 0.5)
    }
    

   
    
    @IBAction func wallet(_ sender: Any) {
        setAlpha()
        wallet.backgroundWithAlpha(color: NSColor.white, alpha: 0.5)
    }
    
    
    func setAlpha()
    {
      
        yourRides.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        bookRide.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        wallet.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
    }
    
    
    
    
    override func viewDidLoad() {
        


        
        super.viewDidLoad()
        view.wantsLayer=true
        view.layer?.contents=NSImage(named: "side")
       
        yourRides.wantsLayer=true
        yourRides.setText(text: "   Your Rides", color: #colorLiteral(red: 0.380135715, green: 0.3798798919, blue: 0.3847197294, alpha: 1), font: .systemFont(ofSize: 16.0), alignment: nil)

        bookRide.wantsLayer=true
        bookRide.setText(text: "   Book Your Ride", color: #colorLiteral(red: 0.380135715, green: 0.3798798919, blue: 0.3847197294, alpha: 1), font: .systemFont(ofSize: 16.0), alignment: nil)
        bookRide.backgroundWithAlpha(color: NSColor.white, alpha: 0.5)
        wallet.wantsLayer=true
        wallet.setText(text: "   Wallet", color: #colorLiteral(red: 0.380135715, green: 0.3798798919, blue: 0.3847197294, alpha: 1), font: .systemFont(ofSize: 16.0), alignment: nil)
    }
    
}

