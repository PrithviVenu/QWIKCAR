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

    var bookingPresenter:BookingPresenter?
    var upcomingRideDetail:[BookingDetails]?
    var completedRideDetail:[BookingDetails]?

    override func viewDidLoad() {
        super.viewDidLoad()
        bookingPresenter = BookingPresenter()
        let date = DateValidator.getCurrentDateTimeString()
        upcomingRideDetail = bookingPresenter!.upcomingBookings(date:date, userId: "1001")
        completedRideDetail = bookingPresenter!.completedBookings(date:date, userId: "1001")
        
        topBar.wantsLayer=true
//        topBar.layer?.backgroundColor=#colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2360582352, alpha: 1)
        
//        topBar.layer?.backgroundColor=#colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2749649645, alpha: 1)
        topBar.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.95).cgColor

        view.wantsLayer=true
        upcomingView.wantsLayer=true
        completedView.wantsLayer=true
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
        view.layer?.backgroundColor=NSColor.white.cgColor
        upcomingView.layer?.backgroundColor=NSColor.white.cgColor
        completedView.layer?.backgroundColor=NSColor.white.cgColor
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
        return 10
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        if(tableView==self.tableView){
          return  upcomingTable(tableColumn: tableColumn,row: row)
        }
        
        if(tableView==self.tableView1){
            return  completedTable(tableColumn: tableColumn,row: row)
        }
        return nil
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
