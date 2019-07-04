//
//  UpcomingBookingsTableCellView.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 24/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class UpcomingBookingsTableCellView: NSTableCellView {

    @IBAction func ViewBookingDetail(_ sender: NSButton) {
     
        yourRidesVC?.upcomingRides(row: sender.tag)
        
    }
    @IBOutlet weak var viewDetails: NSButton!
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
    @IBOutlet weak var bookingDate: NSTextField!
    @IBOutlet weak var carGroup: NSTextField!
    @IBOutlet weak var endDate: NSTextField!
    @IBOutlet weak var startDate: NSTextField!
    
   
   
    @IBOutlet weak var cancelBooking: NSButton!
    @IBOutlet weak var pickupCity1: NSTextField!
    @IBOutlet weak var deliveryCity1: NSTextField!
    
    
    @IBAction func cancelBooking(_ sender: NSButton) {
        
        yourRidesVC!.cancelBooking(row: sender.tag)
    }
    
    var yourRidesVC:yourRidesViewController?

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    
    
}
