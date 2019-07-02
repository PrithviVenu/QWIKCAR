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
    func authenticate(userEmail: String, password: String) -> Int {
      
        
        return booking.authenticate(userEmail: userEmail, password: password)
    }
    func getJourneyDates(DateValue1:Date,DateValue2:Date)->(String,String){
        return DateValidator.getJourneyDates(DateValue1:DateValue1,DateValue2:DateValue2)
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
