//
//  BookingView.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class BookingView:BookingViewContract{
var startDate = "", endDate = ""
var startDateValue:Date=Date(), endDateValue:Date=Date()
var cars = [Car]()
var map = [String:[String]]()
var success = false
var presenter:BookingPresenter

    init(DateValue1:Date,DateValue2:Date) {
        self.presenter = BookingPresenter()
        self.startDateValue=DateValue1
        self.endDateValue=DateValue2

    }
    init(){
        self.presenter = BookingPresenter()

    }
    func getBranches()->[String]{
        presenter.view = self
        return presenter.getBranches()
    }
    
    func getSeaterTypes()->[String]{
        presenter.view = self
        return presenter.getSeaterTypes()
    }
    
    
func viewCar(map:[String:[String]])->([Car]?,Int?)
{
    presenter.view = self
    self.map=map
    (startDate,endDate)=presenter.getJourneyDates(DateValue1: startDateValue, DateValue2: endDateValue)
    let noOfDays = DateValidator.daysBetweenDates(dateInput1: startDate, dateInput2: endDate)
    if !(DateValidator.validateTripDates(startDate:startDate, endDate:endDate)==("Valid")) {
        print(DateValidator.validateTripDates(startDate:startDate,endDate:endDate))
        return (nil,noOfDays)
    }
    
    presenter.getAvailableCars(startDate: startDate,endDate: endDate,map: map)
    if success {
        return (cars,noOfDays)
    }
    else
    {
        return (nil,noOfDays)
    }

    }

    func onSuccess(cars:[Car])
  {
    self.cars=cars
    success=true
    }
   
    func onFailure()
    {
        success = false
        print("No Cars Available")
    }
    
    
    
    
    
}
