//
//  completedBookingsTableCellView.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 26/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class completedBookingsTableCellView: NSTableCellView {
    @IBOutlet weak var topBar1: NSView!
    @IBOutlet weak var deliveryCity: NSTextField!
    @IBOutlet weak var pickupCity: NSTextField!
    @IBOutlet weak var bookingId: NSTextField!
    @IBOutlet weak var carImage: NSImageView!
    @IBOutlet weak var carName: NSTextField!
    @IBOutlet weak var total: NSTextField!
    @IBOutlet weak var additionalKms: NSTextField!
    @IBOutlet weak var arrow: NSTextField!
    @IBOutlet weak var paymentMode: NSTextField!
    @IBOutlet weak var viewDetails: NSButton!
    @IBOutlet weak var bookingDate: NSTextField!
    @IBOutlet weak var carGroup: NSTextField!
    @IBOutlet weak var startDate: NSTextField!
    @IBOutlet weak var endDate: NSTextField!
    @IBOutlet weak var deliveryCity1: NSTextField!
    @IBOutlet weak var pickupCity1: NSTextField!
    var yourRidesVC:yourRidesViewController?
    @IBAction func ViewBookingDetail(_ sender: NSButton) {
        yourRidesVC?.completedRides(row: sender.tag)
        
    }
    
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
