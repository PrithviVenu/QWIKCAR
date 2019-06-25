//
//  Payment.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 25/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class Payment{
    var paymentID:Int
    var bookingID:Int
    var offerApplied:String
    var amountPaid:String
    var Payment_Date:String
    var Payment_Mode:String
    
    init(  paymentID:Int , bookingID:Int , offerApplied:String , amountPaid:String , Payment_Date:String , Payment_Mode:String) {
        
        self.paymentID = paymentID
        self.bookingID=bookingID
        self.offerApplied=offerApplied
        self.amountPaid=amountPaid
        self.Payment_Date=Payment_Date
        self.Payment_Mode=Payment_Mode
 
    }
    
}
