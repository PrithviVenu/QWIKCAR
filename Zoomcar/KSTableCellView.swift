//
//  KSTableCellView.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 24/04/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class KSTableCellView: NSTableCellView {
    @IBOutlet weak var carDetailsTab: NSView!
    @IBOutlet weak var fareSummaryTab: NSView!
    @IBOutlet weak var noOfBags: NSTextField!
    @IBOutlet weak var booking: NSButton!
    @IBOutlet weak var rating: NSTextField!
    @IBOutlet weak var noOfSeats: NSTextField!
    @IBOutlet weak var transmission: NSTextField!
    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var carDetails: NSTextField!
    @IBOutlet weak var carDetail: NSButton!
    @IBOutlet weak var carGroup: NSTextField!
    @IBOutlet weak var carImage: NSImageView!
    @IBOutlet weak var additionalKms: NSTextField!
    @IBOutlet weak var carModel: NSTextField!
    @IBOutlet weak var carName: NSTextField!
    @IBOutlet weak var totalAmount: NSTextFieldCell!
    @IBOutlet weak var freeKms: NSTextField!
    @IBOutlet weak var freeKm: NSTextField!
    @IBOutlet weak var additionalKm: NSTextField!
    @IBOutlet weak var fuelType: NSTextField!
    @IBOutlet weak var totalAmt: NSTextField!
    @IBOutlet weak var baseFare: NSTextField!
    @IBOutlet weak var surCharges: NSTextField!
    //    @IBOutlet weak var carDetail: NSButton!
//    @IBOutlet weak var carImage: NSImageView!
//    @IBOutlet weak var tabView: NSTabView!
//    @IBOutlet weak var carDetails: NSTextField!
//    @IBOutlet weak var supervisorId: NSTextField!
//    @IBOutlet weak var additionalKms: NSTextField!
//    @IBOutlet weak var freeKms: NSTextField!
//    @IBOutlet weak var dailyRent: NSTextField!
//    @IBOutlet weak var transmission: NSTextField!
//    @IBOutlet weak var branchId: NSTextField!
//    @IBOutlet weak var carNumber: NSTextField!
//    @IBOutlet weak var fuelType: NSTextField!
//    @IBOutlet weak var carGroup: NSTextField!
//    @IBOutlet weak var carModel: NSTextField!
//    @IBOutlet weak var carName: NSTextField!
//    @IBOutlet weak var carId: NSTextField!
//    @IBOutlet weak var booking: NSButton!
    var carVC:CarViewController?
    
    
    @IBAction func book(_ sender: Any) {
        print("Book",(sender as AnyObject).tag!,carVC!.selectedIndex)

    }
    
    
    
    @IBAction func viewCarDetails(_ sender: Any) {
//         print("CarDetails",(sender as AnyObject).tag!,carVC!.selectedIndex)
        carVC?.viewCarDetails(row:(sender as AnyObject).tag)
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
