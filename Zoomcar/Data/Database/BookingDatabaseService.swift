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
        .appendingPathComponent("database.db")
    private static var db: OpaquePointer?
    internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
   init()
    {
        guard sqlite3_open(BookingDatabaseService.fileURL.path, &BookingDatabaseService.db) == SQLITE_OK else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Error Opening Database")
            return
        }
        setup()
    }

    deinit {
        sqlite3_close(BookingDatabaseService.db)
    }
    
    func setup(){
        let query = Query.createTableQuery
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
       
        sqlite3_exec(BookingDatabaseService.db, query,nil, nil, nil)
        insert()
        sqlite3_finalize(statement)

    }
    
    
    func cancel(bookingId:Int){
     let query = "DELETE FROM booking where Booking_Id = ?"
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        guard sqlite3_bind_text(statement!, 1, String(bookingId), -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
                print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
                return
        }
        
        if(sqlite3_step(statement) != SQLITE_DONE){
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error: \(errmsg)")
        }
    }
    
    
    
    func payWithWalletMoney(amount:Int,userId:Int){
        
       let query = "UPDATE Wallet SET Balance = ? WHERE User_Id = ?"
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        guard sqlite3_bind_text(statement!, 1, String(amount), -1, SQLITE_TRANSIENT) == SQLITE_OK  &&
            sqlite3_bind_text(statement!, 2, String(userId), -1, SQLITE_TRANSIENT) == SQLITE_OK   else {
                print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
                return
        }
        
        if(sqlite3_step(statement) != SQLITE_DONE){
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error: \(errmsg)")
        }
        
        
    }
    
    func insert(){
        let query = Query.insertQuery
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        let query1 = "select * from Flag"
        var statement1: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query1, -1, &statement1, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        if(sqlite3_step(statement1) != SQLITE_ROW){
        sqlite3_exec(BookingDatabaseService.db, query,nil, nil, nil)
        }
        sqlite3_finalize(statement)
        sqlite3_finalize(statement1)

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
    
    func upcomingBookings(date:String,userId:String)->[BookingDetails]
    {
        
        let query = "SELECT car.*,booking.Booking_Id,booking.User_Id,booking.Delivery_Address,booking.Pickup_Address,booking.Delivery_City,booking.Pickup_City,booking.Booking_Date,booking.Start_Date,booking.End_Date FROM booking LEFT JOIN car  ON booking.Car_id = car.Car_Id where booking.User_Id = ? AND booking.Start_Date >= ?  "
    
        return myBookings(query: query, date: date, userId: userId)
        
    }
    
    func completedBookings(date:String,userId:String)->[BookingDetails]
    {
        
        let query = "SELECT car.*,booking.Booking_Id,booking.User_Id,booking.Delivery_Address,booking.Pickup_Address,booking.Delivery_City,booking.Pickup_City,booking.Booking_Date,booking.Start_Date,booking.End_Date FROM booking LEFT JOIN car  ON booking.Car_id = car.Car_Id where booking.User_Id = ? AND booking.Start_Date < ?  "
        
        return myBookings(query: query, date: date, userId: userId)
        
    }
    
    func getWalletBalance(userID:Int)->Int{
        let query = "SELECT Balance FROM Wallet where User_Id = ?"
        var statement: OpaquePointer?
        guard sqlite3_prepare_v2(BookingDatabaseService.db,query,-1,&statement,nil) == SQLITE_OK else {
            print(sqlite3_prepare_v2(BookingDatabaseService.db,query,-1,&statement, nil),String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)))
            print("Prepare Error")
            return 0
            }
        
        guard sqlite3_bind_text(statement!, 1, String(userID), -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
                print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
                return 0
        }
        while sqlite3_step(statement) == SQLITE_ROW {
            
            return Int(sqlite3_column_int64(statement, 0))
        }
        
        
        return 0
    }
    
    func myBookings(query:String,date:String,userId:String)->[BookingDetails]{
        var bookingDetails = [BookingDetails]()

        var statement: OpaquePointer?
        guard sqlite3_prepare_v2(BookingDatabaseService.db,query,-1,&statement,nil) == SQLITE_OK else {
            print(sqlite3_prepare_v2(BookingDatabaseService.db,query,-1,&statement, nil),String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)))
            print("Prepare Error")
            return []
        }
        
        guard sqlite3_bind_text(statement!, 1, userId, -1, SQLITE_TRANSIENT) == SQLITE_OK  &&
            sqlite3_bind_text(statement!, 2, date, -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
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
            
            let bookingId = Int(sqlite3_column_int64(statement, 17))
            let userId = Int(sqlite3_column_int64(statement, 18))
            let deliveryAddress = String(cString:sqlite3_column_text(statement, 19))
            let pickupAddress = String(cString:sqlite3_column_text(statement, 20))
            let deliveryCity = String(cString:sqlite3_column_text(statement, 21))
            let pickupCity = String(cString:sqlite3_column_text(statement, 22))
            let bookingDate = String(cString:sqlite3_column_text(statement, 23))
            let startDate = String(cString:sqlite3_column_text(statement, 24))
            let endDate = String(cString:sqlite3_column_text(statement, 25))
            
            
            let bookingDetail = BookingDetails(bookingId: bookingId, userId: userId, car: car, deliveryAddress: deliveryAddress, pickupAddress: pickupAddress, deliveryCity: deliveryCity, pickupCity: pickupCity, bookingDate: bookingDate, startDate: startDate, endDate: endDate, payment: payment(bookingId: String(bookingId))!)
            
            bookingDetails.append(bookingDetail)
        }
        sqlite3_finalize(statement)
        return bookingDetails
    }
    
    
//    func bookAndPay(bookingDetail:BookingDetails){
////        print(generateBookingId(),bookingDetail.userId,bookingDetail.car.carId,bookingDetail.deliveryAddress,bookingDetail.pickupAddress,bookingDetail.deliveryCity,bookingDetail.pickupCity,bookingDetail.bookingDate,bookingDetail.startDate,bookingDetail.endDate)
//        let query = """
//        INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (?, ?, ?,?, ?, ?, ?,?,?,?);
//        """
//        var statement: OpaquePointer?
//        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
//            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
//            print("error preparing select: \(errmsg)")
//        }
//
//        guard sqlite3_bind_int(statement!, 1, Int32(generateBookingId()+1)) == SQLITE_OK && sqlite3_bind_int(statement!, 2, Int32(bookingDetail.userId)) == SQLITE_OK && sqlite3_bind_int(statement!, 3, Int32(bookingDetail.car.carId)) == SQLITE_OK && sqlite3_bind_text(statement!, 4, bookingDetail.deliveryAddress, -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 5, String(bookingDetail.pickupAddress), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 6, String(bookingDetail.deliveryCity), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 7, String(bookingDetail.pickupCity), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 8, String(bookingDetail.bookingDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 9, String(bookingDetail.startDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 10, String(bookingDetail.endDate), -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
//            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
//            return
//        }
//        
//        if(pay(payment: bookingDetail.payment)==1){
//
//        if (sqlite3_step(statement) != SQLITE_DONE){
//            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
//            print("error1 : \(errmsg)")
//            
//        }
//        
//        }
//        sqlite3_finalize(statement)
//
//    }
//    
//    func pay (payment:Payment)->Int{
//        let query = "INSERT INTO payment (Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (?, ?, ?, ?, ?);"
//        var statement: OpaquePointer?
////        print(payment.offerApplied,payment.amountPaid,payment.Payment_Date,payment.Payment_Mode)
//        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
//            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
//            print("error2 preparing select: \(errmsg)")
//        }
//        guard sqlite3_bind_int(statement!, 1, Int32(generateBookingId()+1)) == SQLITE_OK && sqlite3_bind_text(statement!, 2, String(payment.offerApplied), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_int(statement!, 3, Int32(payment.amountPaid)!) == SQLITE_OK && sqlite3_bind_text(statement!, 4, String(payment.Payment_Date), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 5, String(payment.Payment_Mode), -1, SQLITE_TRANSIENT) == SQLITE_OK else {
//            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
//            return 0
//        }
//        
//        
//        if (sqlite3_step(statement) != SQLITE_DONE){
//            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
//            print("error2 : \(errmsg)")
//            sqlite3_finalize(statement)
//            return 0
//        }
//        else{
//            sqlite3_finalize(statement)
//            return 1
//        }
//
//    }
    
    
    func bookAndPay(bookingDetail:BookingDetails){
        //        print(generateBookingId(),bookingDetail.userId,bookingDetail.car.carId,bookingDetail.deliveryAddress,bookingDetail.pickupAddress,bookingDetail.deliveryCity,bookingDetail.pickupCity,bookingDetail.bookingDate,bookingDetail.startDate,bookingDetail.endDate)
        let query = """
        INSERT INTO booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date) VALUES (?, ?, ?,?, ?, ?, ?,?,?,?);
        """
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        
        let bookingid=generateBookingId()+1
        bookingDetail.bookingId=bookingid
        bookingDetail.payment.bookingID=bookingid
        
        guard sqlite3_bind_text(statement!, 1, String(bookingDetail.bookingId), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 2, String(bookingDetail.userId), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 3, String(bookingDetail.car.carId), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 4, bookingDetail.deliveryAddress, -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 5, String(bookingDetail.pickupAddress), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 6, String(bookingDetail.deliveryCity), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 7, String(bookingDetail.pickupCity), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 8, String(bookingDetail.bookingDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 9, String(bookingDetail.startDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 10, String(bookingDetail.endDate), -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
            return
        }
     
        
        if(pay(payment: bookingDetail.payment)==1){
            
            if (sqlite3_step(statement) != SQLITE_DONE){
                let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
                print("error1 : \(errmsg)")
                
            }
            
        }
        sqlite3_finalize(statement)
        
    }
    
    func getCancelledBookings(userId:Int)->[CancelledBookings]{
      
        let query = "select * from cancelled_booking where User_Id = ?"
        var cancelledBookings=[CancelledBookings]()
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        
        guard sqlite3_bind_text(statement!, 1, String(userId), -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
            return []
        }
        
        while sqlite3_step(statement) == SQLITE_ROW {
            let _ = Int(sqlite3_column_int64(statement, 0))
            let bookingId = Int(sqlite3_column_int64(statement, 1))
            let userId = Int(sqlite3_column_int64(statement, 2))
            let carId = Int(sqlite3_column_int64(statement, 3))
            let deliveryAddress = String(cString:sqlite3_column_text(statement, 4))
            let pickupAddress = String(cString:sqlite3_column_text(statement, 5))
            let deliveryCity = String(cString:sqlite3_column_text(statement, 6))
            let pickupCity = String(cString:sqlite3_column_text(statement, 7))
            let bookingDate = String(cString:sqlite3_column_text(statement, 8))
            let startDate = String(cString:sqlite3_column_text(statement, 9))
            let endDate = String(cString:sqlite3_column_text(statement, 10))
            let cancellationDate=String(cString:sqlite3_column_text(statement, 11))
            let refundAmt = Int(sqlite3_column_int64(statement, 12))
            let refundDate=String(cString:sqlite3_column_text(statement, 13))
            let cancelledBooking = CancelledBookings(bookingId: bookingId, userId: userId, carId: carId, deliveryAddress: deliveryAddress, pickupAddress: pickupAddress, deliveryCity: deliveryCity, pickupCity: pickupCity, bookingDate: bookingDate, startDate: startDate, endDate: endDate, cancellationDate: cancellationDate, refundAmount: refundAmt, refundDate: refundDate)
            cancelledBookings.append(cancelledBooking)

        }
        
        sqlite3_finalize(statement)
        
        
        return cancelledBookings
    }
    
    func CancelBooking(bookingDetail:CancelledBookings){
        
        let query = """
        INSERT INTO cancelled_booking (Booking_Id, User_Id, Car_Id, Delivery_Address, Pickup_Address, Delivery_City, Pickup_City, Booking_Date, Start_Date, End_Date,Cancellation_Date,Refund_Amount,Refund_Date) VALUES (?, ?, ?,?, ?, ?, ?,?,?,?,?,?,?);
        """
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        
        guard sqlite3_bind_text(statement!, 1, String(bookingDetail.bookingId), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 2, String(bookingDetail.userId), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 3, String(bookingDetail.carId), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 4, bookingDetail.deliveryAddress, -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 5, String(bookingDetail.pickupAddress), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 6, String(bookingDetail.deliveryCity), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 7, String(bookingDetail.pickupCity), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 8, String(bookingDetail.bookingDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 9, String(bookingDetail.startDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 10, String(bookingDetail.endDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 11, String(bookingDetail.cancellationDate), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 12, String(bookingDetail.refundAmount), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 13, String(bookingDetail.refundDate), -1, SQLITE_TRANSIENT) == SQLITE_OK else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
            return
        }
        if (sqlite3_step(statement) != SQLITE_DONE){
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error1 : \(errmsg)")
            
        }
        sqlite3_finalize(statement)
    }
    
    func pay (payment:Payment)->Int{
        let query = "INSERT INTO payment (Booking_Id, Offer_Applied, Amount_Paid, Payment_Date, Payment_Mode) VALUES (?, ?, ?, ?, ?);"
        var statement: OpaquePointer?
        //        print(payment.offerApplied,payment.amountPaid,payment.Payment_Date,payment.Payment_Mode)
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error2 preparing select: \(errmsg)")
        }
        
        //        print(Int32(payment.amountPaid) as Any,Int32(generateBookingId()+1))
        guard sqlite3_bind_text(statement!, 1, String(payment.bookingID), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 2, String(payment.offerApplied), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 3, payment.amountPaid, -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 4, String(payment.Payment_Date), -1, SQLITE_TRANSIENT) == SQLITE_OK && sqlite3_bind_text(statement!, 5, String(payment.Payment_Mode), -1, SQLITE_TRANSIENT) == SQLITE_OK else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
            return 0
        }
        
        
        if (sqlite3_step(statement) != SQLITE_DONE){
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error2 : \(errmsg)")
            sqlite3_finalize(statement)
            return 0
        }
        else{
            sqlite3_finalize(statement)
            return 1
        }
        
    }
    
   func generateBookingId()->Int{
    let query = "select Booking_Id from booking";
    var statement: OpaquePointer?
    var bookingID = -1
    if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
        print("error preparing select: \(errmsg)")
    }
    while sqlite3_step(statement) == SQLITE_ROW {
        
        if(bookingID<Int(sqlite3_column_int64(statement, 0))){
         bookingID=Int(sqlite3_column_int64(statement, 0))
        }

        
        
    }
    sqlite3_finalize(statement)
    return bookingID
    }
    
    func getCar(carID:Int)->Car?{
    let query = "select * from car where Car_Id=?";
        var car:Car
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        guard sqlite3_bind_text(statement!, 1, String(carID), -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
            return nil
        }
        if sqlite3_step(statement) == SQLITE_ROW {
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
             car = Car(carId: carId, carImage:carImage,branchId:branchId, carNumber: carNumber, carName: carName, carModel: carModel, carGroup: carGroup, fuelType: fuelType, transmission: transmission, rentPerDay: rentPerDay, freeKm: freeKm, additionalKmFee: additionalKmFee,totalRating:totalRating,noOfVotes:noOfVotes,noOfbags: noOfbags,noOfSeats: noOfSeats, carAdvance: carAdvance)
            return car

         }
        
        return nil

    }
    
    
    func payment(bookingId:String)->Payment?{
        let query = "select * from payment where Booking_Id=?";
        var statement: OpaquePointer?
        var payment:Payment
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        guard sqlite3_bind_text(statement!, 1, bookingId, -1, SQLITE_TRANSIENT) == SQLITE_OK  else {
                print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
                return nil
        }
        if sqlite3_step(statement) == SQLITE_ROW {
            
            let paymentID=Int(sqlite3_column_int64(statement, 0))
            let bookingId = Int(sqlite3_column_int64(statement, 1))
            let offerApplied = String(cString:sqlite3_column_text(statement, 2))
            let amountPaid = String(cString:sqlite3_column_text(statement, 3))
            let Payment_Date = String(cString:sqlite3_column_text(statement, 4))
            let Payment_Mode = String(cString:sqlite3_column_text(statement, 5))
            payment = Payment(paymentID: paymentID, bookingID: bookingId, offerApplied: offerApplied, amountPaid: amountPaid, Payment_Date: Payment_Date, Payment_Mode: Payment_Mode)
            sqlite3_finalize(statement)
            return payment

            
        }
        sqlite3_finalize(statement)
        return nil
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
        sqlite3_finalize(statement)
        return branches
        
    }
    
    func authenticate(userEmail:String,password:String)->Int{
        let query = "SELECT User_Id FROM user_authentication where User_Email=? AND Password=?"
        var statement: OpaquePointer?
        
         var userId = -1
        if sqlite3_prepare_v2(BookingDatabaseService.db,query, -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(BookingDatabaseService.db)!)
            print("error preparing select: \(errmsg)")
        }
        
        guard sqlite3_bind_text(statement!, 1, userEmail, -1, SQLITE_TRANSIENT) == SQLITE_OK &&
            sqlite3_bind_text(statement!, 2, password, -1, SQLITE_TRANSIENT) == SQLITE_OK else {
            print(String.init(cString:sqlite3_errmsg(BookingDatabaseService.db)),"Bind Error")
                return userId
        }
        
        if sqlite3_step(statement) == SQLITE_ROW {
             userId = Int(sqlite3_column_int64(statement, 0))
        }
        
        return userId

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
        sqlite3_finalize(statement)
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
        sqlite3_finalize(statement)
        return Seats
        
    }
    
    
}

