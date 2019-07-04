//
//  CancelledBookings.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 04/07/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
import Foundation
class CancelledBookings{
    var carId:Int
    var bookingId:Int
    var userId:Int
    var deliveryAddress:String
    var pickupAddress:String
    var deliveryCity:String
    var pickupCity:String
    var bookingDate:String
    var startDate:String
    var endDate:String
    var cancellationDate:String
    var refundAmount:Int
    var refundDate:String
    init(bookingId:Int,userId:Int,carId:Int,deliveryAddress:String,pickupAddress:String,deliveryCity:String,pickupCity:String,bookingDate:String,startDate:String,endDate:String,cancellationDate:String,refundAmount:Int,refundDate:String) {
        
        self.bookingId = bookingId
        self.userId=userId
        self.carId=carId
        self.deliveryAddress=deliveryAddress
        self.pickupAddress=pickupAddress
        self.deliveryCity=deliveryCity
        self.pickupCity=pickupCity
        self.bookingDate=bookingDate
        self.startDate=startDate
        self.endDate=endDate
        self.cancellationDate=cancellationDate
        self.refundAmount=refundAmount
        self.refundDate=refundDate
        
    }
}
