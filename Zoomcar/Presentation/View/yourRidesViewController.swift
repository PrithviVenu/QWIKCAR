//
//  yourRidesViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 24/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class yourRidesViewController: NSViewController,NSTableViewDelegate,NSTableViewDataSource{

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var tableView1: NSTableView!
    @IBOutlet weak var completedView: NSView!
    @IBOutlet weak var upcomingView: NSView!
    @IBOutlet weak var heading: NSTextField!
    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var topBar: NSView!
    @IBOutlet weak var tableView2: NSTableView!
    @IBOutlet weak var cancelledView: NSView!
    var bookingPresenter:BookingPresenter?
    var upcomingRideDetail:[BookingDetails]?
    var completedRideDetail:[BookingDetails]?
    var cancelledRideDetail:[CancelledBookings]?

    override func viewDidLoad() {
        super.viewDidLoad()
        bookingPresenter = BookingPresenter()
        let date = DateValidator.getCurrentDateTimeString()
        upcomingRideDetail = bookingPresenter!.upcomingBookings(date:date, userId: "1001")
        completedRideDetail = bookingPresenter!.completedBookings(date:date, userId: "1001")
        cancelledRideDetail = bookingPresenter!.getCancelledBookings(userId: 1001)
        topBar.wantsLayer=true
//        topBar.layer?.backgroundColor=#colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2360582352, alpha: 1)
        
//        topBar.layer?.backgroundColor=#colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2749649645, alpha: 1)
        topBar.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.95).cgColor

        view.wantsLayer=true
        upcomingView.wantsLayer=true
        completedView.wantsLayer=true
        cancelledView.wantsLayer=true

        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.5)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.tableColumns[0].minWidth = 1150.0
        tableView.selectionHighlightStyle = .none
        tableView1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.5)
        tableView1.delegate=self
        tableView1.dataSource=self
        tableView1.tableColumns[0].minWidth = 1150.0
        tableView1.selectionHighlightStyle = .none
        tableView2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.5)
        tableView2.delegate=self
        tableView2.dataSource=self
        tableView2.tableColumns[0].minWidth = 1150.0
        tableView2.selectionHighlightStyle = .none
        view.layer?.backgroundColor=NSColor.white.cgColor
        upcomingView.layer?.backgroundColor=NSColor.white.cgColor
        completedView.layer?.backgroundColor=NSColor.white.cgColor
        cancelledView.layer?.backgroundColor=NSColor.white.cgColor

        tabView.wantsLayer=true
        tabView.layer?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.7).cgColor
        heading.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

//        heading.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.85)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if tableView == self.tableView{
        return upcomingRideDetail!.count
        }
        else if tableView == self.tableView1{
            return completedRideDetail!.count
        }
        else if tableView == self.tableView2{
            return cancelledRideDetail!.count
        }
        return 10
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        if(tableView==self.tableView){
          return  upcomingTable(tableColumn: tableColumn,row: row)
        }
        
        if(tableView==self.tableView1){
            return  completedTable(tableColumn: tableColumn,row: row)
        }
        else if tableView == self.tableView2{
            return cancelledTable(tableColumn: tableColumn,row: row)
        }
        return nil
    }
    
    func cancelBooking(row:Int){
        let answer = dialogOKCancel(question: "Cancel Booking", text: "Are you sure you want to cancel this booking ?")
        if(answer){
            
            let bookingDetail = upcomingRideDetail![row]
            bookingPresenter?.cancel(bookingId:bookingDetail.bookingId)
           let days = DateValidator.daysBetweenDates(dateInput1: DateValidator.getCurrentDateTimeString(), dateInput2: bookingDetail.startDate)
            var refundAmount = 0
            if(days! > 1){
                refundAmount=max(200,(Int(bookingDetail.payment.amountPaid) ?? 0)/2)
            }
            
            let cancelledBookingDetail = CancelledBookings(bookingId: bookingDetail.bookingId, userId: bookingDetail.userId, carId: bookingDetail.car.carId, deliveryAddress: bookingDetail.deliveryAddress, pickupAddress: bookingDetail.pickupAddress, deliveryCity: bookingDetail.deliveryCity, pickupCity: bookingDetail.pickupCity, bookingDate: bookingDetail.bookingDate, startDate: bookingDetail.startDate, endDate: bookingDetail.endDate, cancellationDate: DateValidator.getCurrentDateTimeString(), refundAmount: refundAmount, refundDate: DateValidator.getCurrentDateTimeString())
        
            bookingPresenter?.CancelBooking(bookingDetail: cancelledBookingDetail)

            let ans = cancelled(question: "Your Booking Has Been Cancelled", text: "")
            upcomingRideDetail = bookingPresenter!.upcomingBookings(date:DateValidator.getCurrentDateTimeString(), userId: "1001")
            if(ans){
               tableView.reloadData()
            }
        }
        
    }
    
    func dialogOKCancel(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "Yes")
        alert.addButton(withTitle: "No")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func cancelled(question: String, text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.alertStyle = .informational
        alert.addButton(withTitle: "Ok")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    func upcomingTable(tableColumn: NSTableColumn?, row: Int)->NSView?{
        if (tableColumn?.identifier)!.rawValue == "defaultColumn"{
            let result:UpcomingBookingsTableCellView=tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! UpcomingBookingsTableCellView
            result.wantsLayer=true
            result.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.layer?.cornerRadius=5.0
            result.layer?.masksToBounds=false
            result.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.layer?.shadowOpacity=0.4
            result.layer?.masksToBounds=false
            
            result.topBar1.wantsLayer=true
            result.topBar1.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.topBar1.layer?.cornerRadius=2.0
            result.topBar1.layer?.masksToBounds=false
            result.topBar1.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.topBar1.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.topBar1.layer?.shadowOpacity=0.4
            
                
            
            let bookingDetail = upcomingRideDetail![row]
            let car = bookingDetail.car
            let payment=bookingDetail.payment
//            let decodedData = Data(base64Encoded:car.carImage, options: .ignoreUnknownCharacters)!
//            let decodedimage:NSImage = NSImage(data: decodedData)!
            
            result.deliveryCity.stringValue=bookingDetail.deliveryCity
            if(bookingDetail.deliveryCity != bookingDetail.pickupCity ){
            result.pickupCity.stringValue=bookingDetail.pickupCity
            }
            else{
            result.pickupCity.stringValue=""
            result.arrow.stringValue=""
            }
            result.deliveryCity1.stringValue = bookingDetail.deliveryCity
            result.pickupCity1.stringValue = bookingDetail.pickupCity

            result.startDate.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail.startDate)
            result.endDate.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail.endDate)
            result.bookingId.stringValue=String(bookingDetail.bookingId)
            result.bookingDate.stringValue=bookingDetail.bookingDate
            result.carImage.image=NSImage(named:car.carImage)
            result.carName.stringValue=car.carName
            result.carGroup.stringValue=car.carGroup
            result.total.stringValue=String(payment.amountPaid)
            result.additionalKms.stringValue=String(car.additionalKmFee)
            result.paymentMode.stringValue=payment.Payment_Mode
            result.viewDetails.tag=row
            result.cancelBooking.tag=row
            result.cancelBooking.setText(text: "Cancel Booking", color: #colorLiteral(red: 0.04312064499, green: 0.5154479742, blue: 1, alpha: 1), font: NSFont.systemFont(ofSize: 13), alignment: .center)
            
            result.cancelBooking.wantsLayer=true
            result.cancelBooking.shadow(cornerRadius: 1, shadowColor: #colorLiteral(red: 0.04312064499, green: 0.5154479742, blue: 1, alpha: 1), shadowOpacity: 0.4)
            result.yourRidesVC=self

            return result
            
        }
        return nil
    }
    
    func completedRides(row:Int){
        let rideDetail = completedRideDetail![row]
        let home = self.parent as? HomeViewController
        home?.CompletedInvoiceVC(rideDetail:rideDetail)
        
    }
    
    func upcomingRides(row:Int){
        let rideDetail = upcomingRideDetail![row]
        let home = self.parent as? HomeViewController
        home?.BookingInvoiceVC(rideDetail:rideDetail)
    }
    
    func cancelledRides(row:Int){
        let rideDetail = cancelledRideDetail![row]
        let car = bookingPresenter!.getCar(carID: rideDetail.carId)!
        let payment = bookingPresenter!.payment(bookingId: String(rideDetail.bookingId))!
        let home = self.parent as? HomeViewController
        home?.CancelledInvoiceVC(rideDetail:rideDetail,car:car,payment:payment)
    }
    
    func completedTable(tableColumn: NSTableColumn?, row: Int)->NSView?{
        if (tableColumn?.identifier)!.rawValue == "defaultColumn"{
            let result=tableView1.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! completedBookingsTableCellView
            result.wantsLayer=true
            result.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.layer?.cornerRadius=5.0
            result.layer?.masksToBounds=false
            result.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.layer?.shadowOpacity=0.4
            result.layer?.masksToBounds=false
            
            result.topBar1.wantsLayer=true
            result.topBar1.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.topBar1.layer?.cornerRadius=2.0
            result.topBar1.layer?.masksToBounds=false
            result.topBar1.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.topBar1.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.topBar1.layer?.shadowOpacity=0.4
            
            let bookingDetail = completedRideDetail![row]
            let car = bookingDetail.car
            let payment=bookingDetail.payment
//            let decodedData = Data(base64Encoded:car.carImage, options: .ignoreUnknownCharacters)!
//            let decodedimage:NSImage = NSImage(data: decodedData)!
            
            result.deliveryCity.stringValue=bookingDetail.deliveryCity
            if(bookingDetail.deliveryCity != bookingDetail.pickupCity ){
                result.pickupCity.stringValue=bookingDetail.pickupCity
            }
            else{
                result.pickupCity.stringValue=""
                result.arrow.stringValue=""
            }
            result.deliveryCity1.stringValue = bookingDetail.deliveryCity
            result.pickupCity1.stringValue = bookingDetail.pickupCity
            
            result.startDate.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail.startDate)
            result.endDate.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail.endDate)
            result.bookingId.stringValue=String(bookingDetail.bookingId)
            result.bookingDate.stringValue=bookingDetail.bookingDate
            result.carImage.image=NSImage(named:car.carImage)
            result.carName.stringValue=car.carName
            result.carGroup.stringValue=car.carGroup
            result.total.stringValue=String(payment.amountPaid)
            result.additionalKms.stringValue=String(car.additionalKmFee)
            result.paymentMode.stringValue=payment.Payment_Mode
            result.viewDetails.tag=row
            result.yourRidesVC=self
            return result
            
        }
        return nil
    }
    
    
    func cancelledTable(tableColumn: NSTableColumn?, row: Int)->NSView?{
        if (tableColumn?.identifier)!.rawValue == "defaultColumn"{
            let result=tableView2.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! CancelledTableCellView
            result.wantsLayer=true
            result.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.layer?.cornerRadius=5.0
            result.layer?.masksToBounds=false
            result.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.layer?.shadowOpacity=0.4
            result.layer?.masksToBounds=false
            
            result.topBar1.wantsLayer=true
            result.topBar1.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.topBar1.layer?.cornerRadius=2.0
            result.topBar1.layer?.masksToBounds=false
            result.topBar1.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.topBar1.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.topBar1.layer?.shadowOpacity=0.4
            
            let bookingDetail = cancelledRideDetail![row]
            let car = bookingPresenter!.getCar(carID: bookingDetail.carId)!
            let payment = bookingPresenter!.payment(bookingId: String(bookingDetail.bookingId))!
          
            //            let decodedData = Data(base64Encoded:car.carImage, options: .ignoreUnknownCharacters)!
            //            let decodedimage:NSImage = NSImage(data: decodedData)!
            
            result.deliveryCity.stringValue=bookingDetail.deliveryCity
            if(bookingDetail.deliveryCity != bookingDetail.pickupCity ){
                result.pickupCity.stringValue=bookingDetail.pickupCity
            }
            else{
                result.pickupCity.stringValue=""
                result.arrow.stringValue=""
            }
            result.deliveryCity1.stringValue = bookingDetail.deliveryCity
            result.pickupCity1.stringValue = bookingDetail.pickupCity
            
            result.startDate.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail.startDate)
            result.endDate.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail.endDate)
            result.bookingId.stringValue=String(bookingDetail.bookingId)
            result.bookingDate.stringValue=bookingDetail.bookingDate
            result.carImage.image=NSImage(named:car.carImage)
            result.carName.stringValue=car.carName
            result.carGroup.stringValue=car.carGroup
            result.total.stringValue=String(payment.amountPaid)
            result.additionalKms.stringValue=String(car.additionalKmFee)
            result.paymentMode.stringValue=payment.Payment_Mode
            result.viewDetails.tag=row
            result.yourRidesVC=self
            return result
            
        }
        return nil
    }
}
