//
//  PaymentModeViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 20/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class PaymentModeViewController: NSViewController {

    @IBOutlet weak var gpay: NSButton!
    @IBOutlet weak var phonepe: NSButton!
    @IBOutlet weak var payzapp: NSButton!
    @IBOutlet weak var paytm: NSButton!
    @IBOutlet weak var wallet: NSButton!
    @IBOutlet weak var card: NSButton!
    @IBOutlet weak var sidebar: NSView!
    @IBOutlet weak var topBar: NSView!
    
    
    @IBAction func card(_ sender: Any) {
        setAlpha()
        card.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)

    }
    
    @IBAction func wallet(_ sender: Any) {
        setAlpha()
        wallet.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
    }
    
    
    @IBAction func paytm(_ sender: Any) {
        setAlpha()
        paytm.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
    }
    
    @IBAction func payzapp(_ sender: Any) {
        setAlpha()
        payzapp.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
    }
    
    @IBAction func phonepe(_ sender: Any) {
        setAlpha()
        phonepe.backgroundWithAlpha(color: NSColor.black, alpha:0.1)

    }
    
    
    @IBAction func gpay(_ sender: Any) {
        setAlpha()
        gpay.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.wantsLayer=true
        topBar.layer?.backgroundColor = #colorLiteral(red: 0.1500522792, green: 0.6636349559, blue: 0.8786595464, alpha: 1)
        card.wantsLayer=true
        phonepe.wantsLayer=true
        payzapp.wantsLayer=true
        paytm.wantsLayer=true
        gpay.wantsLayer=true
        wallet.wantsLayer=true
        card.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)

    }
    func setAlpha()
    {
        
        card.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        paytm.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        wallet.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        payzapp.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        phonepe.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        gpay.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
    }
}
