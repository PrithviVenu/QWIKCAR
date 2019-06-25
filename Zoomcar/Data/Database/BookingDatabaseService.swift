//
//  BookingDatabaseService.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 14/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
import SQLite3

class BookingDatabaseService{
    private static let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("Zoomcar.db")
    private static var db: OpaquePointer?
    internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
   init()
    {
        guard sqlite3_open(BookingDatabaseService.fileURL.path, &BookingDatabaseService.db) == SQLITE_OK else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Error Opening Database")
            return
        }
    }

    deinit {
        sqlite3_close(BookingDatabaseService.db)
    }
    
}
 
extension BookingDatabaseService:GetBookingDatabaseContract{

    func listAvailableCars(startDate:String,endDate:String,map:[String:[String]])->[Car]
    {
    var cars = [Car]()
    var string = ""
        
    var query = "SELECT DISTINCT a.Car_Id,a.car_image,a.Branch_Id,a.car_Number ,a.Car_Name,a.Car_Model,a.Car_Group,a.Fuel_Type,a.Transmission,a.Rent_Per_Day,a.Free_Km,a.Additional_Km_Fee,a.total_rating,a.no_of_votes,a.no_of_bags,a.no_of_seats,a.carAdvance FROM (SELECT car.Car_Id,car.car_image,car.Branch_Id, car.Car_Number,car.Car_Name,car.Car_Model,car.Car_Group,car.Fuel_Type,car.Transmission,car.Rent_Per_Day,car.Free_Km,car.Additional_Km_Fee,car.total_rating,car.no_of_votes,car.no_of_bags,car.no_of_seats,car.carAdvance FROM car LEFT JOIN booking ON booking.Car_id = car.Car_Id WHERE booking.End_Date < ? OR booking.Start_Date > ?  OR booking.Booking_Date IS NULL) AS a LEFT JOIN (SELECT car.Car_Id FROM car LEFT JOIN booking ON booking.Car_id = car.Car_Id WHERE booking.End_Date > ? AND booking.Start_Date < ? ) AS b on a.Car_Id=b.Car_Id WHERE b.Car_Id IS NULL "
        
    for (key,values)in map{
        string=""
        for(value) in values{
           string += (key+" = '" + value + "'"+" OR ")
        }
        if values.count > 0{
        string = String(string[..<string.index(string.endIndex,offsetBy:-4)])
        
    query += ("AND ( " + string + " )")
        }    
    }
        var statement: OpaquePointer?
        guard sqlite3_prepare_v2(BookingDatabaseService.db,query,-1,&statement,nil) == SQLITE_OK else {
            print(sqlite3_prepare_v2(BookingDatabaseService.db,query,-1,&statement, nil),String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)))
            print("Prepare Error")
            return []
        }
        
        guard sqlite3_bind_text(statement!, 1, startDate, -1, SQLITE_TRANSIENT) == SQLITE_OK  &&
            sqlite3_bind_text(statement!, 2, endDate, -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 3, startDate, -1, SQLITE_TRANSIENT) == SQLITE_OK  && sqlite3_bind_text(statement!, 4,endDate, -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
               return []
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let carId = Int(sqlite3_column_int64(statement, 0))
            let carImage = String(cString:sqlite3_column_text(statement, 1))
            let branchId = Int(sqlite3_column_int64(statement, 2))
            let carNumber = String(cString:sqlite3_column_text(statement, 3))
            let carName = String(cString:sqlite3_column_text(statement, 4))
            let carModel = String(cString:sqlite3_column_text(statement, 5))
            let carGroup = String(cString:sqlite3_column_text(statement, 6))
            let fuelType = String(cString:sqlite3_column_text(statement, 7))
            let transmission = String(cString:sqlite3_column_text(statement, 8))
            let rentPerDay = Int(sqlite3_column_int64(statement, 9))
            let freeKm = Int(sqlite3_column_int64(statement, 10))
            let additionalKmFee = Int(sqlite3_column_int64(statement, 11))
            let totalRating = Int(sqlite3_column_int64(statement, 12))
            let noOfVotes = Int(sqlite3_column_int64(statement, 13))
            let noOfbags = Int(sqlite3_column_int64(statement, 14))
            let noOfSeats = Int(sqlite3_column_int64(statement, 15))
            let carAdvance = Int(sqlite3_column_int64(statement, 16))
            let car = Car(carId: carId, carImage:carImage,branchId:branchId, carNumber: carNumber, carName: carName, carModel: carModel, carGroup: carGroup, fuelType: fuelType, transmission: transmission, rentPerDay: rentPerDay, freeKm: freeKm, additionalKmFee: additionalKmFee,totalRating:totalRating,noOfVotes:noOfVotes,noOfbags: noOfbags,noOfSeats: noOfSeats, carAdvance: carAdvance)
            cars.append(car)
        }
        sqlite3_finalize(statement)
        return cars
    
    }

}

extension BookingDatabaseService{

    func getBranches()->[String]{
        let query = "SELECT Branch_Id , City_Name FROM branch"
        var statement: OpaquePointer?
        var branches = [String]()
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            
            let branchId = Int(sqlite3_column_int64(statement, 0))
            let cityName = String(cString:sqlite3_column_text(statement, 1))
            branches.append(String(branchId)+"-"+cityName)
            
        }
        return branches
        
    }
    
    
    func applyOffer(offerCode:String)->Int?{
        let query = "select * from Offers where Offer_Name=?";
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
            return nil
        }
        guard sqlite3_bind_text(statement!, 1,offerCode,-1, SQLITE_TRANSIENT) == SQLITE_OK else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
            return nil
        }
        if sqlite3_step(statement) == SQLITE_ROW {
            _ = String(cString:sqlite3_column_text(statement, 0))
            let discount = Int(sqlite3_column_int64(statement, 1))
            return discount
        }
        return nil
    }
    
    func getSeaterTypes() -> [String] {
        let query = "SELECT no_of_seats FROM car"
        var statement: OpaquePointer?
        var Seats = [String]()
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            let seats = String(cString:sqlite3_column_text(statement, 0))
            Seats.append(seats)
            
        }
        return Seats
        
    }
    
    
}

