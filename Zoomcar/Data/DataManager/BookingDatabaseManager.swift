//
//  BookingDatabaseManager.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 15/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class BookingDatabaseManager:GetBookingDataContract{
    
    
    static var database:GetBookingDatabaseContract?
    init()
    {
        if(BookingDatabaseManager.database == nil){
            BookingDatabaseManager.database = BookingDatabaseService()
        }
        
        
    }
    func getCar(carID:Int)->Car?{
    return BookingDatabaseManager.database!.getCar(carID:carID)
    }
    
    func payment(bookingId:String)->Payment?{
       return BookingDatabaseManager.database!.payment(bookingId:bookingId)
    }
    
    
    func authenticate(userEmail: String, password: String) -> Int {
        return BookingDatabaseManager.database!.authenticate(userEmail: userEmail, password: password)
    }
    
    func bookAndPay(bookingDetail:BookingDetails){
        
        BookingDatabaseManager.database!.bookAndPay(bookingDetail: bookingDetail)
    }
    
    func completedBookings(date: String, userId: String) -> [BookingDetails] {
        return BookingDatabaseManager.database!.completedBookings(date: date, userId: userId)
        
    }
    func cancel(bookingId:Int){
        return BookingDatabaseManager.database!.cancel(bookingId: bookingId)
    }
    
    func upcomingBookings(date: String, userId: String) -> [BookingDetails] {
        return BookingDatabaseManager.database!.upcomingBookings(date: date, userId: userId)
    }
    func getWalletBalance(userID:Int)->Int{
        
        return BookingDatabaseManager.database!.getWalletBalance(userID: userID)
    }
    func payWithWalletMoney(amount:Int,userId:Int){
        return BookingDatabaseManager.database!.payWithWalletMoney(amount: amount, userId: userId)
    }
 
    func getAvailableCars(startDate: String, endDate: String, map: [String : [String]]) -> [Car] {
        let cars = BookingDatabaseManager.database!.listAvailableCars(startDate: startDate, endDate: endDate, map: map)
        return cars
    }
    func getBranches()->[String]{
        return BookingDatabaseManager.database!.getBranches()
    }
    func getSeaterTypes()->[String]{
        return BookingDatabaseManager.database!.getSeaterTypes()
    }
    func getCancelledBookings(userId:Int)->[CancelledBookings]{
        return BookingDatabaseManager.database!.getCancelledBookings(userId: userId)
    }
    func applyOffer(offerCode:String)->Int?{
        
        return BookingDatabaseManager.database!.applyOffer(offerCode: offerCode)
    }
    func CancelBooking(bookingDetail:CancelledBookings){
        return BookingDatabaseManager.database!.CancelBooking(bookingDetail:bookingDetail)

    }
}
