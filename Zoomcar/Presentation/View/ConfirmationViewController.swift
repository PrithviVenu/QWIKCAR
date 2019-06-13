//
//  ConfirmationViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 06/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class FPClipView: NSClipView {
    override var isFlipped: Bool {
        return true
    }
}

class ConfirmationViewController: NSViewController {
    
   static var car:Car?
   static var startDate=""
   static var endDate:String=""
   static var noOfDays:Int?
  
    lazy var doc: NSView = {
        let view = NSView()
        view.wantsLayer = true
        return view
    }()
    
    lazy var carName: NSTextField = {
        let car = NSTextField(labelWithString: "Car Name")
        car.translatesAutoresizingMaskIntoConstraints = false
        car.font=NSFont.boldSystemFont(ofSize: 16.0)
        car.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return car
    }()
    
    lazy var bookingDetails: NSTextField = {
        let bookingDetails = NSTextField(labelWithString: "BOOKING DETAILS")
        bookingDetails.translatesAutoresizingMaskIntoConstraints = false
        bookingDetails.font=NSFont.boldSystemFont(ofSize: 16.0)
        bookingDetails.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return bookingDetails
    }()
    lazy var startDateLabel: NSTextField = {
        let startDateLabel = NSTextField(labelWithString: "Start Date")
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.font=NSFont.systemFont(ofSize: 16.0)
        startDateLabel.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return startDateLabel
    }()
    lazy var endDateLabel: NSTextField = {
        let endDate = NSTextField(labelWithString: "End Date")
        endDate.translatesAutoresizingMaskIntoConstraints = false
        endDate.font=NSFont.systemFont(ofSize: 16.0)
        endDate.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return endDate
    }()
    lazy var noOfDaysLabel: NSTextField = {
        let noOfDays = NSTextField(labelWithString: "180 days")
        noOfDays.translatesAutoresizingMaskIntoConstraints = false
        noOfDays.font=NSFont.systemFont(ofSize: 13.0)
        noOfDays.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return noOfDays
    }()
    
    lazy var seaterLabel: NSTextField = {
        let seaterLabel = NSTextField(labelWithString: "5 Seats")
        seaterLabel.translatesAutoresizingMaskIntoConstraints = false
        seaterLabel.font=NSFont.systemFont(ofSize: 13.0)
        seaterLabel.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return seaterLabel
    }()
    
    lazy var transmissionLabel: NSTextField = {
        let transmissionLabel = NSTextField(labelWithString: "Automatic")
        transmissionLabel.translatesAutoresizingMaskIntoConstraints = false
        transmissionLabel.font=NSFont.systemFont(ofSize: 13.0)
        transmissionLabel.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return transmissionLabel
    }()
    
    lazy var fuelTypeLabel: NSTextField = {
        let fuelTypeLabel = NSTextField(labelWithString: "Diesel")
        fuelTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        fuelTypeLabel.font=NSFont.systemFont(ofSize: 13.0)
        fuelTypeLabel.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return fuelTypeLabel
    }()
    
    lazy var bookingDetailsScrollView: NSScrollView = {
        let scrollView = NSScrollView()
        scrollView.contentView = FPClipView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.borderType = .noBorder
        scrollView.drawsBackground = true
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        
        let documentView = doc
        documentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.documentView = documentView
        NSLayoutConstraint(item: documentView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: documentView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        return scrollView
    }()

    lazy var imageView: NSImageView = {
        let image = NSImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var toImg: NSImageView = {
        let image = NSImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var daysImg: NSImageView = {
        let image = NSImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var seaterImg: NSImageView = {
        let image = NSImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var transmissionImg: NSImageView = {
        let image = NSImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var fuelTypeImg: NSImageView = {
        let image = NSImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy var line1: NSView = {
        let line = createLine()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    lazy var line2: NSView = {
        let line = createLine()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    lazy var bookingDetailsView: NSView = {
        let view: NSView = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer=true
        view.layer?.backgroundColor = .white
        view.layer?.cornerRadius=6.0
        view.layer?.masksToBounds=false
        view.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        view.layer?.shadowOffset=CGSize(width: 0, height: 0)
        view.layer?.shadowOpacity=0.7
        return view
    }()
    
    lazy var invoiceView: NSView = {
        let view: NSView = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer=true
        view.layer?.backgroundColor = .white
        view.layer?.cornerRadius=6.0
        view.layer?.masksToBounds=false
        view.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        view.layer?.shadowOffset=CGSize(width: 0, height: 0)
        view.layer?.shadowOpacity=0.7
        return view
    }()
    lazy var tabView: NSTabView = {
        let view = getTabView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func loadView() {
        self.view = NSView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        self.view.addSubview(bookingDetailsScrollView)
        doc.addSubview(bookingDetailsView)
        doc.addSubview(tabView)
        doc.addSubview(invoiceView)



        tabView.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: bookingDetailsView, attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 80.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 28).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1050).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 260).isActive = true
        setBookingDetailsView()

        
        NSLayoutConstraint(item: tabView, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .bottom, multiplier: 1.0, constant: 100.0).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1050).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 450).isActive = true
        
        
        
        
        NSLayoutConstraint(item: invoiceView, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .bottom, relatedBy: .equal, toItem: tabView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .trailing, multiplier: 1.0, constant: 50).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .trailing, relatedBy: .equal, toItem: doc, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 350).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .bottom, relatedBy: .equal, toItem: doc, attribute: .bottom, multiplier: 1.0, constant: -50).isActive = true
        setInvoiceView()
       
        
        
        
        
    }
    
    
    
    
    func setInvoiceView(){
        
//      invoiceView.addSubview(<#T##view: NSView##NSView#>)
        
        
        
    }
    
    
    
    
    func setBookingDetailsView(){
        bookingDetailsView.addSubview(carName)
        bookingDetailsView.addSubview(line1)
        bookingDetailsView.addSubview(imageView)
        bookingDetailsView.addSubview(bookingDetails)
        bookingDetailsView.addSubview(line2)
        bookingDetailsView.addSubview(startDateLabel)
        bookingDetailsView.addSubview(toImg)
        bookingDetailsView.addSubview(endDateLabel)
        bookingDetailsView.addSubview(daysImg)
        bookingDetailsView.addSubview(noOfDaysLabel)
        bookingDetailsView.addSubview(seaterImg)
        bookingDetailsView.addSubview(seaterLabel)
        bookingDetailsView.addSubview(transmissionImg)
        bookingDetailsView.addSubview(transmissionLabel)
        bookingDetailsView.addSubview(fuelTypeImg)
        bookingDetailsView.addSubview(fuelTypeLabel)

        

        NSLayoutConstraint(item: carName, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .top, multiplier: 1.0, constant: 20.0).isActive = true
        NSLayoutConstraint(item: carName, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .leading, multiplier: 1.0, constant: 40).isActive = true
        
        
        
        NSLayoutConstraint(item: line1, attribute: .leading, relatedBy: .equal, toItem: carName, attribute: .trailing, multiplier: 1.0, constant: 150).isActive = true
        NSLayoutConstraint(item: line1, attribute: .top, relatedBy: .equal, toItem:carName, attribute: .top, multiplier: 1.0, constant: 20.0).isActive = true
        NSLayoutConstraint(item: line1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200).isActive = true
        NSLayoutConstraint(item: line1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 2.2).isActive = true
        
        
        NSLayoutConstraint(item: bookingDetails, attribute: .leading, relatedBy: .equal, toItem: line1, attribute: .trailing, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: bookingDetails, attribute: .top, relatedBy: .equal, toItem:carName, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        
        NSLayoutConstraint(item: line2, attribute: .leading, relatedBy: .equal, toItem: bookingDetails, attribute: .trailing, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: line2, attribute: .top, relatedBy: .equal, toItem:line1, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: line2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200).isActive = true
        NSLayoutConstraint(item: line2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 2.2).isActive = true
        
        
        NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: carName, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem:line1, attribute: .bottom, multiplier: 1.0, constant: 14.0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150).isActive = true
        
        
        NSLayoutConstraint(item: startDateLabel, attribute: .centerY, relatedBy: .equal, toItem: imageView, attribute: .centerY, multiplier: 1.0, constant: -10.0).isActive = true
        NSLayoutConstraint(item: startDateLabel, attribute: .centerX, relatedBy: .equal, toItem: line1, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        NSLayoutConstraint(item: toImg, attribute: .centerX, relatedBy: .equal, toItem: bookingDetails, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: toImg, attribute: .top, relatedBy: .equal, toItem:startDateLabel, attribute: .top, multiplier: 1.0, constant: -18.0).isActive = true
        NSLayoutConstraint(item: toImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        NSLayoutConstraint(item: toImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        
        
        NSLayoutConstraint(item: endDateLabel, attribute: .centerY, relatedBy: .equal, toItem: imageView, attribute: .centerY, multiplier: 1.0, constant: -10.0).isActive = true
        NSLayoutConstraint(item: endDateLabel, attribute: .centerX, relatedBy: .equal, toItem: line2, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: endDateLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: bookingDetailsView, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        NSLayoutConstraint(item: daysImg, attribute: .leading, relatedBy: .equal, toItem: toImg, attribute: .leading, multiplier: 1.0, constant: -30).isActive = true
        NSLayoutConstraint(item: daysImg, attribute: .top, relatedBy: .equal, toItem:toImg, attribute: .bottom, multiplier: 1.0, constant: 5.0).isActive = true
        NSLayoutConstraint(item: daysImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: daysImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20).isActive = true
        
        
        NSLayoutConstraint(item: noOfDaysLabel, attribute: .leading, relatedBy: .equal, toItem: daysImg, attribute: .trailing, multiplier: 1.0, constant: 10.0).isActive = true
        NSLayoutConstraint(item: noOfDaysLabel, attribute: .top, relatedBy: .equal, toItem: toImg, attribute: .bottom, multiplier: 1.0, constant: 7.0).isActive = true
        
        
        NSLayoutConstraint(item: seaterImg, attribute: .leading, relatedBy: .equal, toItem: carName, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: seaterImg, attribute: .top, relatedBy: .equal, toItem:imageView, attribute: .bottom, multiplier: 1.0, constant: 5.0).isActive = true
        NSLayoutConstraint(item: seaterImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 22).isActive = true
        NSLayoutConstraint(item: seaterImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 22).isActive = true
        
        
        NSLayoutConstraint(item: seaterLabel, attribute: .top, relatedBy: .equal, toItem: seaterImg, attribute: .bottom, multiplier: 1.0, constant: 5.0).isActive = true
        NSLayoutConstraint(item: seaterLabel, attribute: .centerX, relatedBy: .equal, toItem: seaterImg, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        NSLayoutConstraint(item: transmissionImg, attribute: .leading, relatedBy: .equal, toItem: seaterLabel, attribute: .trailing, multiplier: 1.0, constant: 50).isActive = true
        NSLayoutConstraint(item: transmissionImg, attribute: .top, relatedBy: .equal, toItem:seaterImg, attribute: .top, multiplier: 1.0, constant: 1).isActive = true
        NSLayoutConstraint(item: transmissionImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 16).isActive = true
        NSLayoutConstraint(item: transmissionImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 16).isActive = true
        
        
        NSLayoutConstraint(item: transmissionLabel, attribute: .top, relatedBy: .equal, toItem: seaterLabel, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: transmissionLabel, attribute: .centerX, relatedBy: .equal, toItem: transmissionImg, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        NSLayoutConstraint(item: fuelTypeImg, attribute: .leading, relatedBy: .equal, toItem: transmissionLabel, attribute: .trailing, multiplier: 1.0, constant: 50).isActive = true
        NSLayoutConstraint(item: fuelTypeImg, attribute: .top, relatedBy: .equal, toItem:seaterImg, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: fuelTypeImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 25).isActive = true
        NSLayoutConstraint(item: fuelTypeImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 22).isActive = true
        
        
        NSLayoutConstraint(item: fuelTypeLabel, attribute: .top, relatedBy: .equal, toItem: seaterLabel, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: fuelTypeLabel, attribute: .centerX, relatedBy: .equal, toItem: fuelTypeImg, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
    }
    
    
    
    func setData(){
        carName.stringValue=ConfirmationViewController.car!.carName
        let decodedData = Data(base64Encoded: ConfirmationViewController.car!.carImage, options: .ignoreUnknownCharacters)!
        let decodedimage:NSImage = NSImage(data: decodedData)!
        imageView.image = decodedimage
        toImg.image=NSImage(named: "to")
        daysImg.image=NSImage(named: "rides")
        seaterImg.image=NSImage(named: "groups")
        transmissionImg.image=NSImage(named: "gearshift")
        fuelTypeImg.image=NSImage(named: "gas")
        startDateLabel.stringValue = ConfirmationViewController.startDate
        endDateLabel.stringValue = ConfirmationViewController.endDate
        noOfDaysLabel.stringValue = String(ConfirmationViewController.noOfDays!)+" days"
        seaterLabel.stringValue=String(ConfirmationViewController.car!.noOfSeats)+" Seats"
        transmissionLabel.stringValue=String(ConfirmationViewController.car!.transmission)
        fuelTypeLabel.stringValue=String(ConfirmationViewController.car!.fuelType)

    }
    
    
    func createLine()->NSView{
        let line = NSView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.wantsLayer = true
        line.layer?.backgroundColor = #colorLiteral(red: 0.5510721803, green: 0.6823329926, blue: 0.6758498549, alpha: 1)
        return line
    }
    
    
    
    
    private func getTabView()->NSTabView
    {
        let tabView=NSTabView()
        tabView.translatesAutoresizingMaskIntoConstraints=false
   
        let  instructions=NSTabViewItem()
        instructions.label="IMPORTANT POINTS TO REMEMBER"
        
        let contentView = NSView()
        contentView.wantsLayer=true
        contentView.layer?.backgroundColor = .white
        contentView.layer?.cornerRadius=6.0
        contentView.layer?.masksToBounds=false
        contentView.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        contentView.layer?.shadowOffset=CGSize(width: 0, height: 0)
        contentView.layer?.shadowOpacity=0.7
        
        let pricingPlanTitle = NSTextField(labelWithString: "CHANGE IN PRICING PLAN:")
        pricingPlanTitle.translatesAutoresizingMaskIntoConstraints = false
        pricingPlanTitle.font=NSFont.systemFont(ofSize: 16.0,weight: NSFont.Weight.medium)
        pricingPlanTitle.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(pricingPlanTitle)
        NSLayoutConstraint(item: pricingPlanTitle, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 50.0).isActive = true
        NSLayoutConstraint(item: pricingPlanTitle, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 40.0).isActive = true
        
        
        let pricingPlan = NSTextField(labelWithString: "The pricing plan cannot be changed after the payment is made")
        pricingPlan.translatesAutoresizingMaskIntoConstraints = false
        pricingPlan.font=NSFont.systemFont(ofSize: 16.0)
        pricingPlan.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        contentView.addSubview(pricingPlan)
        NSLayoutConstraint(item: pricingPlan, attribute: .top, relatedBy: .equal, toItem: pricingPlanTitle, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: pricingPlan, attribute: .leading, relatedBy: .equal, toItem: pricingPlanTitle, attribute: .trailing, multiplier: 1.0, constant: 20.0).isActive = true
        
        let fuelTitle = NSTextField(labelWithString: "FUEL:")
        fuelTitle.translatesAutoresizingMaskIntoConstraints = false
        fuelTitle.font=NSFont.systemFont(ofSize: 16.0,weight: NSFont.Weight.medium)
        fuelTitle.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        contentView.addSubview(fuelTitle)
        NSLayoutConstraint(item: fuelTitle, attribute: .top, relatedBy: .equal, toItem: pricingPlan, attribute: .bottom, multiplier: 1.0, constant: 35.0).isActive = true
        NSLayoutConstraint(item: fuelTitle, attribute: .leading, relatedBy: .equal, toItem: pricingPlanTitle, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true

        let fuel = NSTextField(wrappingLabelWithString: "In case you are returning the car at a lower fuel level than what was received, we will charge a flat Rs 500 refuelling service charge + actual fuel cost to get the tank to the same level as what was received")
        fuel.translatesAutoresizingMaskIntoConstraints = false
        fuel.font=NSFont.systemFont(ofSize: 16.0)
        fuel.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(fuel)
        NSLayoutConstraint(item: fuel, attribute: .top, relatedBy: .equal, toItem: fuelTitle, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: fuel, attribute: .leading, relatedBy: .equal, toItem: pricingPlan, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: fuel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 780).isActive = true

        let taxTitle = NSTextField(labelWithString: "TOLLS, PARKING FEES:")
        taxTitle.translatesAutoresizingMaskIntoConstraints = false
        taxTitle.font=NSFont.systemFont(ofSize: 16.0,weight: NSFont.Weight.medium)
        taxTitle.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(taxTitle)
        NSLayoutConstraint(item: taxTitle, attribute: .top, relatedBy: .equal, toItem: fuel, attribute: .bottom, multiplier: 1.0, constant: 35.0).isActive = true
        NSLayoutConstraint(item: taxTitle, attribute: .leading, relatedBy: .equal, toItem: pricingPlanTitle, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        
        let tax = NSTextField(labelWithString: "To be paid by you.")
        tax.translatesAutoresizingMaskIntoConstraints = false
        tax.font=NSFont.systemFont(ofSize: 16.0)
        tax.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(tax)
        NSLayoutConstraint(item: tax, attribute: .top, relatedBy: .equal, toItem: taxTitle, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tax, attribute: .leading, relatedBy: .equal, toItem: pricingPlan, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        
        let verificationTitle = NSTextField(labelWithString: "ID VERIFICATION:")
        verificationTitle.translatesAutoresizingMaskIntoConstraints = false
        verificationTitle.font=NSFont.systemFont(ofSize: 16.0,weight: NSFont.Weight.medium)
        verificationTitle.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(verificationTitle)
        NSLayoutConstraint(item: verificationTitle, attribute: .top, relatedBy: .equal, toItem: tax, attribute: .bottom, multiplier: 1.0, constant: 35.0).isActive = true
        NSLayoutConstraint(item: verificationTitle, attribute: .leading, relatedBy: .equal, toItem: pricingPlanTitle, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        
        let verification = NSTextField(wrappingLabelWithString: "Please keep your original Driving License handy. While delivering the car to you, our executive will verify your original Driving License and ID proof (same as the ones whose details were provided while making the booking). This verification is mandatory. In the unfortunate case where you cannot show these documents, we will not be able to handover the car to you, and it will be treated as a late cancellation (100% of the fare would be payable). Driving license printed on A4 sheet of paper (original or otherwise) will not be considered as a valid document.")
        verification.translatesAutoresizingMaskIntoConstraints = false
        verification.font=NSFont.systemFont(ofSize: 16.0)
        verification.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(verification)
        NSLayoutConstraint(item: verification, attribute: .top, relatedBy: .equal, toItem: verificationTitle, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: verification, attribute: .leading, relatedBy: .equal, toItem: pricingPlan, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: verification, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 780).isActive = true
        
        
        let inspectionTitle = NSTextField(labelWithString: "HANDOVER INSPECTION:")
        inspectionTitle.translatesAutoresizingMaskIntoConstraints = false
        inspectionTitle.font=NSFont.systemFont(ofSize: 16.0,weight: NSFont.Weight.medium)
        inspectionTitle.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(inspectionTitle)
        NSLayoutConstraint(item: inspectionTitle, attribute: .top, relatedBy: .equal, toItem: verification, attribute: .bottom, multiplier: 1.0, constant: 35.0).isActive = true
        NSLayoutConstraint(item: inspectionTitle, attribute: .leading, relatedBy: .equal, toItem: pricingPlanTitle, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        
        let inspection = NSTextField(labelWithString: "Please inspect the car (including the fuel gauge and odometer) thoroughly before approving the checklist.")
        inspection.translatesAutoresizingMaskIntoConstraints = false
        inspection.font=NSFont.systemFont(ofSize: 16.0)
        inspection.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        
        contentView.addSubview(inspection)
        NSLayoutConstraint(item: inspection, attribute: .top, relatedBy: .equal, toItem: inspectionTitle, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: inspection, attribute: .leading, relatedBy: .equal, toItem: pricingPlan, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        
        instructions.view = contentView
        tabView.addTabViewItem(instructions)
        
        return tabView
    }
    
    
   
    
    
    
}
