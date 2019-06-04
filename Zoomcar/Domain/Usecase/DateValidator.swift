//
//  DateValidator.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
class DateValidator {
   static var formatter = DateFormatter()
    
    public static func daysBetweenDates(dateInput1:String, dateInput2:String)->Int? {
    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    let date1 = formatter.date(from: dateInput1)
    let  date2 = formatter.date(from: dateInput2)
     guard let _ = date1 , let _ = date2 else {
            return nil
        }
        let d1 = date1!.toMillis
        let d2 = date2!.toMillis
        return ((d2 - d1) / 86400000)
    }
    
    public static func validateTripDates(startDate:String,  endDate:String)->String {
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    var validity:String = "Valid"
    let date1 = formatter.date(from: startDate)
    let  date2 = formatter.date(from: endDate)
        guard let _ = date1 , let _ = date2 else {
            return "Dates Not Valid"
        }

        if date1!.isGreaterThan(date2!) || date1!.isEqualTo(date2!){
        validity = "Dates Invalid , Start Date must be less than end date"
        }

        else if date1!.isInPast{
        validity = "Dates Invalid , Start Date must be greater than current date "
            }

    
   return validity
    }
    
   
    public static func getJourneyDates(DateValue1:Date,DateValue2:Date)->(String,String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let startDate = dateFormatter.string(from: DateValue1)
        let endDate = dateFormatter.string(from: DateValue2)
        return (startDate,endDate)
        //        print("df",DateValue1,dateFormatter.string(from: DateValue1),dateFormatter.string(from: DateValue2),startDate,endDate
        //        )
        //        let dateFormatter1 = DateFormatter()
        //        dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //        dateFormatter.dateStyle = DateFormatter.Style.short
        //        dateFormatter.timeStyle = DateFormatter.Style.short
        //        let date1 = dateFormatter.date(from:dateFormatter.string(from:DateValue1))!
        //        let startDate=dateFormatter1.string(from: date1)
        //        print("startdate",startDate,dateFormatter1.string(from: date1))
        //        let date2 = dateFormatter.date(from:dateFormatter.string(from:DateValue2))!
        //        let endDate=dateFormatter1.string(from: date2)
    }
   
}


extension Date {
    
    func isEqualTo(_ date: Date) -> Bool {
        return self == date
    }
    
    func isGreaterThan(_ date: Date) -> Bool {
        return self > date
    }
    func getCurrentDateTime()->Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.string(from: Date())
        return  formatter.date(from: date)!
    }
    func isSmallerThan(_ date: Date) -> Bool {
        return self < date
    }
    public var isInPast: Bool {
        return self < getCurrentDateTime()
    }
    
    var toMillis:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}