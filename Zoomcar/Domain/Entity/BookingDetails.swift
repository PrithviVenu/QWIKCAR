//
//  BookingDetails.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class BookingDetails{
     var car:Car
     var bookingId:Int
     var userId:Int
     var deliveryAddress:String
     var pickupAddress:String
     var deliveryCity:String
     var pickupCity:String
     var bookingDate:String
     var startDate:String
     var endDate:String
     var payment:Payment
    init(bookingId:Int,userId:Int,car:Car,deliveryAddress:String,pickupAddress:String,deliveryCity:String,pickupCity:String,bookingDate:String,startDate:String,endDate:String,payment:Payment) {
    
        self.bookingId = bookingId
        self.userId=userId
        self.car=car
        self.deliveryAddress=deliveryAddress
        self.pickupAddress=pickupAddress
        self.deliveryCity=deliveryCity
        self.pickupCity=pickupCity
        self.bookingDate=bookingDate
        self.startDate=startDate
        self.endDate=endDate
        self.payment=payment
        
        
    }
}
