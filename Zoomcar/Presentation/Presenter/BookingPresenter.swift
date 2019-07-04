//
//  BookingPresenter.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class BookingPresenter{
    weak var view:BookingViewContract?
    var booking:Booking
    init() {
        self.booking = Booking()
    }
    
    func getAvailableCars(startDate: String, endDate: String, map: [String : [String]]) {
        let cars = booking.viewAvailableCars(startDate:startDate,endDate:endDate,map:map)
        if cars.isEmpty
        {
            view?.onFailure()
        }
        else
        {
            view?.onSuccess(cars: cars)
        }
    }
    
    func cancel(bookingId:Int){
        return booking.cancel(bookingId: bookingId)
    }
    
    func CancelBooking(bookingDetail:CancelledBookings){
        return booking.CancelBooking(bookingDetail:bookingDetail)
        
    }
    func getCancelledBookings(userId:Int)->[CancelledBookings]{
        return booking.getCancelledBookings(userId: userId)
    }
    func getCar(carID:Int)->Car?{
        return booking.getCar(carID:carID)
    }
    
    func payment(bookingId:String)->Payment?{
        return booking.payment(bookingId:bookingId)
    }
    func authenticate(userEmail: String, password: String) -> Int {
      
        
        return booking.authenticate(userEmail: userEmail, password: password)
    }
    func getJourneyDates(DateValue1:Date,DateValue2:Date)->(String,String){
        return DateValidator.getJourneyDates(DateValue1:DateValue1,DateValue2:DateValue2)
    }
    
    func getWalletBalance(userID:Int)->Int{
        
        return booking.getWalletBalance(userID: userID)
    }
    func payWithWalletMoney(amount:Int,userId:Int){
        return booking.payWithWalletMoney(amount: amount, userId: userId)
    }
    
    func upcomingBookings(date: String, userId: String) -> [BookingDetails] {
        return booking.upcomingBookings(date: date, userId: userId)
    }
    func getBranches()->[String]{
        return booking.getBranches()
    }
  
    func getSeaterTypes()->[String]{
    return booking.getSeaterTypes()
    }
   
    func applyOffer(offerCode:String)->Int?{
        return booking.applyOffer(offerCode:offerCode)
    }
    
    func completedBookings(date: String, userId: String) -> [BookingDetails] {
        return booking.completedBookings(date: date, userId: userId)
        
    }
    
    func bookAndPay(bookingDetail:BookingDetails){
        
        booking.bookAndPay(bookingDetail: bookingDetail)
    }

}
