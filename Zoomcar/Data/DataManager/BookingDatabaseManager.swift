//
//  BookingDatabaseManager.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 15/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class BookingDatabaseManager:GetBookingDataContract{
    func completedBookings(date: String, userId: String) -> [BookingDetails] {
        return database.completedBookings(date: date, userId: userId)

    }
    
    func upcomingBookings(date: String, userId: String) -> [BookingDetails] {
        return database.upcomingBookings(date: date, userId: userId)
    }
    
    var database:GetBookingDatabaseContract
    init()
    {
        self.database = BookingDatabaseService()
        
    }
    func getAvailableCars(startDate: String, endDate: String, map: [String : [String]]) -> [Car] {
        let cars = database.listAvailableCars(startDate: startDate, endDate: endDate, map: map)
        return cars
    }
    func getBranches()->[String]{
        return database.getBranches()
    }
    func getSeaterTypes()->[String]{
        return database.getSeaterTypes()
    }
    
    func applyOffer(offerCode:String)->Int?{
        
        return database.applyOffer(offerCode: offerCode)
    }
}
