//
//  Car.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class Car {
    
     var carId:Int
     var carImage:String
     var branchId:Int
     var carNumber:String
     var carName:String
    var carModel:String
     var carGroup:String
     var fuelType:String
     var transmission:String
     var rentPerDay:Int
     var freeKm:Int
     var additionalKmFee:Int
    var totalRating:Int
    var noOfVotes:Int
    var noOfbags:Int
    var noOfSeats:Int
    var carAdvance:Int
    var getRating:Float{
        return (Float(self.totalRating)/Float(self.noOfVotes)).rounded(toPlaces: 1)
    }
    var getbaseFare:Int{
        return self.rentPerDay*CarViewController.noOfDays
    }
    var getsurCharge:Int{
        return Int(Double(getbaseFare) * (Double(self.carAdvance)/100.0))
    }
    var gettotalAmt:Int{
        return getbaseFare+getsurCharge
    }


    init(carId:Int,carImage:String,branchId:Int,carNumber:String,carName:String,carModel:String,carGroup:String,fuelType:String,transmission:String,rentPerDay:Int,freeKm:Int, additionalKmFee:Int,totalRating:Int,noOfVotes:Int,noOfbags:Int,noOfSeats:Int,carAdvance:Int){
        
        self.carId = carId
        self.carImage = carImage
        self.branchId = branchId
        self.carNumber = carNumber
        self.carName = carName
        self.carModel = carModel
        self.carGroup = carGroup
        self.fuelType = fuelType
        self.transmission = transmission
        self.rentPerDay = rentPerDay
        self.freeKm = freeKm
        self.additionalKmFee = additionalKmFee
        self.totalRating=totalRating
        self.noOfVotes=noOfVotes
        self.noOfSeats=noOfSeats
        self.noOfbags=noOfbags
        self.carAdvance=carAdvance
    }
    
}
