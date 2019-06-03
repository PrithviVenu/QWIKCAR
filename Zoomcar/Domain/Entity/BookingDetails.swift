//
//  BookingDetails.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class BookingDetails{
     var bookingId:Int
     var userId:Int
     var supervisorId:Int
     var carId:Int
     var pickupPointLine1:String
     var pickupPointLine2:String?
     var city:String
     var state:String
     var pincode:String
     var bookingDate:String
     var startDate:String
     var endDate:String
     var withFuel:String
    init(bookingId:Int,userId:Int,supervisorId:Int,carId:Int,pickupPointLine1:String,pickupPointLine2:String?,city:String,state:String,pincode:String,bookingDate:String,startDate:String,endDate:String,withFuel:String) {
    
        self.bookingId = bookingId
        self.userId=userId
        self.supervisorId=supervisorId
        self.carId=carId
        self.pickupPointLine1=pickupPointLine1
        self.pickupPointLine2=pickupPointLine2
        self.city=city
        self.state=state
        self.pincode=pincode
        self.bookingDate=bookingDate
        self.startDate=startDate
        self.endDate=endDate
        self.withFuel=withFuel
        
        
        
    }
}
