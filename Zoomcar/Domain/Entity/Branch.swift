//
//  Branch.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class Branch
{
     var branchId:Int
     var cityName:String
     var stateName:String
     var address:String
     var totalExecutivesAvailable:Int
     var totalCarsAvailable:Int
     var contactNumber:Int
    
    init(branchId:Int,cityName:String,stateName:String,address:String,totalExecutivesAvailable:Int,totalCarsAvailable:Int,contactNumber:Int){
    self.branchId=branchId
    self.cityName=cityName
    self.stateName=stateName
    self.address=address
    self.totalExecutivesAvailable=totalExecutivesAvailable
    self.totalCarsAvailable=totalCarsAvailable
    self.contactNumber=contactNumber
    }
    
}
