//
//  Booking.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 14/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class Booking {
var databaseManager:GetBookingDataContract
    init()
    {
        self.databaseManager = BookingDatabaseManager()
    }
func viewAvailableCars(startDate:String, endDate: String, map: [String : [String]])->[Car]
{
    let cars = databaseManager.getAvailableCars(startDate: startDate, endDate: endDate, map: map)
    return cars
    }
    func authenticate(userEmail: String, password: String) -> Int {
        
        return databaseManager.authenticate(userEmail: userEmail, password: password)
    }
    func getBranches()->[String]{
        return databaseManager.getBranches()
    }
    func getSeaterTypes()->[String]{
        return databaseManager.getSeaterTypes()
    }
    
    func applyOffer(offerCode:String)->Int?{
        return databaseManager.applyOffer(offerCode: offerCode)
    }
    func upcomingBookings(date: String, userId: String) -> [BookingDetails] {
        return databaseManager.upcomingBookings(date: date, userId: userId)
    }
    
    func completedBookings(date: String, userId: String) -> [BookingDetails] {
        return databaseManager.completedBookings(date: date, userId: userId)
        
    }
    func bookAndPay(bookingDetail:BookingDetails){
        
        databaseManager.bookAndPay(bookingDetail: bookingDetail)
    }

    func getWalletBalance(userID:Int)->Int{
        
        return databaseManager.getWalletBalance(userID: userID)
    }
    func payWithWalletMoney(amount:Int,userId:Int){
        return databaseManager.payWithWalletMoney(amount: amount, userId: userId)
    }
    
//    func bookCar(bookingDetails:BookingDetails, travelKms:Int) ->Int {
//    Payment payment = new Payment()
//    if (!payment.payCash(bookingDetails.getCarId(), bookingDetails.getStartDate(), bookingDetails.getEndDate(),
//    travelKms, bookingDetails.getUserId(), bookingId)) {
//    return -1;
//    }
//        bookingDetails.bookingId=bookingId
//        int supervisorId = databaseManager.getSupervisorId(bookingDetails.getCarId());
//        if (supervisorId == 0) {
//            return 0;
//        }
//        bookingDetails.setSupervisorId(supervisorId);
//        
//        return DbController.bookCar(bookingDetails);
//    }
}
