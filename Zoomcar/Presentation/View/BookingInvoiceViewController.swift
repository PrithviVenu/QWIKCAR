//
//  BookingInvoiceViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 27/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa
import MapKit
class BookingInvoiceViewController: NSViewController {

    var bookingDetail:BookingDetails?
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
    
    lazy var line3: NSView = {
        let line = createLine()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    lazy var line4: NSView = {
        let line = createLine()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    lazy var line5: NSView = {
        let line = createLine()
        line.layer?.backgroundColor = #colorLiteral(red: 0.5332846642, green: 0.5333645344, blue: 0.5332672, alpha: 1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    lazy var line6: NSView = {
        let line = createLine()
        line.layer?.backgroundColor = #colorLiteral(red: 0.5332846642, green: 0.5333645344, blue: 0.5332672, alpha: 1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var line7: NSView = {
        let line = createLine()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    lazy var line8: NSView = {
        let line = createLine()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    

    
    lazy var fareDetails: NSTextField = {
        let fareDetails = NSTextField(labelWithString: "FARE DETAILS")
        fareDetails.translatesAutoresizingMaskIntoConstraints = false
        fareDetails.font=NSFont.boldSystemFont(ofSize: 16.0)
        fareDetails.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return fareDetails
    }()
    
    lazy var baseFare: NSTextField = {
        let baseFare = NSTextField(labelWithString: "Base fare")
        baseFare.translatesAutoresizingMaskIntoConstraints = false
        baseFare.font=NSFont.systemFont(ofSize: 16.0)
        baseFare.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return baseFare
    }()
    
    lazy var baseFareValue: NSTextField = {
        let baseFare = NSTextField(labelWithString: "₹ 10000")
        baseFare.translatesAutoresizingMaskIntoConstraints = false
        baseFare.font=NSFont.systemFont(ofSize: 16.0)
        baseFare.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return baseFare
    }()
    
    lazy var doorstepDelivery: NSTextField = {
        let doorstepDelivery = NSTextField(labelWithString: "Doorstep delivery & pickup")
        doorstepDelivery.translatesAutoresizingMaskIntoConstraints = false
        doorstepDelivery.font=NSFont.systemFont(ofSize: 16.0)
        doorstepDelivery.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return doorstepDelivery
    }()
    
    lazy var doorstepDeliveryValue: NSTextField = {
        let doorstepDelivery = NSTextField(labelWithString: "₹ 300")
        doorstepDelivery.translatesAutoresizingMaskIntoConstraints = false
        doorstepDelivery.font=NSFont.systemFont(ofSize: 16.0)
        doorstepDelivery.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return doorstepDelivery
    }()
    
    lazy var insurance: NSTextField = {
        let insurance = NSTextField(labelWithString: "Insurance & GST")
        insurance.translatesAutoresizingMaskIntoConstraints = false
        insurance.font=NSFont.systemFont(ofSize: 16.0)
        insurance.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return insurance
    }()
    
    lazy var insuranceValue: NSTextField = {
        let insurance = NSTextField(labelWithString: "Included")
        insurance.translatesAutoresizingMaskIntoConstraints = false
        insurance.font=NSFont.systemFont(ofSize: 16.0)
        insurance.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return insurance
    }()
    
    
    lazy var surcharges: NSTextField = {
        let surcharges = NSTextField(labelWithString: "Surcharges")
        surcharges.translatesAutoresizingMaskIntoConstraints = false
        surcharges.font=NSFont.systemFont(ofSize: 16.0)
        surcharges.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return surcharges
    }()
    
    lazy var surchargesValue: NSTextField = {
        let surcharges = NSTextField(labelWithString: "₹ 2000")
        surcharges.translatesAutoresizingMaskIntoConstraints = false
        surcharges.font=NSFont.systemFont(ofSize: 16.0)
        surcharges.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return surcharges
    }()
    
    lazy var promoCode: NSTextField = {
        let promoCode = NSTextField()
        promoCode.placeholderString="Promo code"
        promoCode.isBordered=true
        promoCode.wantsLayer=true
        promoCode.layer?.borderColor=#colorLiteral(red: 0.5510721803, green: 0.6823329926, blue: 0.6758498549, alpha: 1)
        promoCode.isEditable=false
        promoCode.translatesAutoresizingMaskIntoConstraints = false
        promoCode.font=NSFont.systemFont(ofSize: 16.0)
        promoCode.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return promoCode
    }()
    
    lazy var promoCodeValidity: NSTextField = {
        let promoCodeValidity = NSTextField(labelWithString: "No Offer Code Applied")
        promoCodeValidity.translatesAutoresizingMaskIntoConstraints = false
        promoCodeValidity.font=NSFont.systemFont(ofSize: 13.0)
        promoCodeValidity.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return promoCodeValidity
    }()
    
    lazy var deliveryLocation: NSTextField = {
        let deliveryLocation = NSTextField(labelWithString: "Delivery Location")
        deliveryLocation.translatesAutoresizingMaskIntoConstraints = false
        deliveryLocation.font=NSFont.systemFont(ofSize: 13.0)
        deliveryLocation.textColor = #colorLiteral(red: 0.6470008492, green: 0.6470960975, blue: 0.646979928, alpha: 1)
        return deliveryLocation
    }()
    
    lazy var deliveryLocationValue: NSTextField = {
        let deliveryLocation = NSTextField()
        deliveryLocation.placeholderString="Delivery Address"
        deliveryLocation.focusRingType = .none
        deliveryLocation.drawsBackground=false
        deliveryLocation.isSelectable=false
        deliveryLocation.isBordered=false
        deliveryLocation.translatesAutoresizingMaskIntoConstraints = false
        deliveryLocation.font=NSFont.systemFont(ofSize: 14.0)
        deliveryLocation.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return deliveryLocation
    }()
    
    lazy var pickupLocation: NSTextField = {
        let pickupLocation = NSTextField(labelWithString: "Pickup Location")
        pickupLocation.translatesAutoresizingMaskIntoConstraints = false
        pickupLocation.font=NSFont.systemFont(ofSize: 13.0)
        pickupLocation.textColor = #colorLiteral(red: 0.6470008492, green: 0.6470960975, blue: 0.646979928, alpha: 1)
        return pickupLocation
    }()
    
    lazy var pickupLocationValue: NSTextField = {
        let pickupLocation = NSTextField()
        pickupLocation.focusRingType = .none
        pickupLocation.placeholderString="Pickup Address"
        pickupLocation.isSelectable=false
        pickupLocation.drawsBackground=false
        pickupLocation.isBordered=false
        pickupLocation.translatesAutoresizingMaskIntoConstraints = false
        pickupLocation.font=NSFont.systemFont(ofSize: 14.0)
        pickupLocation.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return pickupLocation
    }()
    
    lazy var offerAmount: NSTextField = {
        let offerAmount = NSTextField(labelWithString: "- 250")
        offerAmount.translatesAutoresizingMaskIntoConstraints = false
        offerAmount.font=NSFont.systemFont(ofSize: 16.0)
        offerAmount.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        offerAmount.alphaValue=0
        return offerAmount
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
    
    lazy var mapView: NSView = {
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
    
    lazy var map: MKMapView = {
        let view: MKMapView = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer=true
        return view
    }()
    
    lazy var mapTopBar: NSView = {
        let view: NSView = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer=true
        view.layer?.backgroundColor = #colorLiteral(red: 0.06694766134, green: 0.7282025218, blue: 0.7311937213, alpha: 1)
        return view
    }()
    
    lazy var rideDetails: NSTextField = {
        let rideDetails = NSTextField(labelWithString: "RIDE DETAILS")
        rideDetails.translatesAutoresizingMaskIntoConstraints = false
        rideDetails.font=NSFont.boldSystemFont(ofSize: 20.0)
        rideDetails.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return rideDetails
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
        noOfDays.font=NSFont.systemFont(ofSize: 14.0)
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
    
    lazy var freeKms: NSTextField = {
        let freeKms = NSTextField(labelWithString: "Free Kms")
        freeKms.translatesAutoresizingMaskIntoConstraints = false
        freeKms.font=NSFont.systemFont(ofSize: 16.0)
        freeKms.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return freeKms
    }()
    
    lazy var freeKmsValue: NSTextField = {
        let freeKmsValue = NSTextField(labelWithString: "95 Kms")
        freeKmsValue.translatesAutoresizingMaskIntoConstraints = false
        freeKmsValue.font=NSFont.systemFont(ofSize: 16.0)
        freeKmsValue.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return freeKmsValue
    }()
    
    lazy var additionalKms: NSTextField = {
        let additionalKms = NSTextField(labelWithString: "Additional Kms")
        additionalKms.translatesAutoresizingMaskIntoConstraints = false
        additionalKms.font=NSFont.systemFont(ofSize: 16.0)
        additionalKms.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return additionalKms
    }()
    
    lazy var additionalKmsValue: NSTextField = {
        let additionalKmsValue = NSTextField(labelWithString: "₹ 12/km")
        additionalKmsValue.translatesAutoresizingMaskIntoConstraints = false
        additionalKmsValue.font=NSFont.systemFont(ofSize: 16.0)
        additionalKmsValue.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return additionalKmsValue
    }()
    
    lazy var fuel: NSTextField = {
        let fuel = NSTextField(labelWithString: "Fuel")
        fuel.translatesAutoresizingMaskIntoConstraints = false
        fuel.font=NSFont.systemFont(ofSize: 16.0)
        fuel.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return fuel
    }()
    
    lazy var fuelValue: NSTextField = {
        let fuelValue = NSTextField(labelWithString: "Included")
        fuelValue.translatesAutoresizingMaskIntoConstraints = false
        fuelValue.font=NSFont.systemFont(ofSize: 16.0)
        fuelValue.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return fuelValue
    }()
    
    lazy var paymentMode: NSTextField = {
        let fuelValue = NSTextField(labelWithString: "Payment Mode")
        fuelValue.translatesAutoresizingMaskIntoConstraints = false
        fuelValue.font=NSFont.systemFont(ofSize: 16.0)
        fuelValue.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return fuelValue
    }()
    lazy var paymentModeValue: NSTextField = {
        let fuelValue = NSTextField(labelWithString: "VISA CARD")
        fuelValue.translatesAutoresizingMaskIntoConstraints = false
        fuelValue.font=NSFont.systemFont(ofSize: 16.0)
        fuelValue.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return fuelValue
    }()
    lazy var total: NSTextField = {
        let total = NSTextField(labelWithString: "Total")
        total.translatesAutoresizingMaskIntoConstraints = false
        total.font=NSFont.systemFont(ofSize: 18.0)
        total.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return total
    }()
    
    lazy var totalValue: NSTextField = {
        let totalValue = NSTextField(labelWithString: "₹ 150000")
        totalValue.translatesAutoresizingMaskIntoConstraints = false
        totalValue.font=NSFont.systemFont(ofSize: 18.0)
        totalValue.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return totalValue
    }()
    
    lazy var topBar: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.backgroundColor = #colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2360582352, alpha: 1).cgColor
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    lazy var bookingDetailsLabel: NSTextField = {
        let bookingDetails = NSTextField(labelWithString: "Booking Details")
        bookingDetails.translatesAutoresizingMaskIntoConstraints = false
        bookingDetails.font=NSFont.systemFont(ofSize: 20.0)
        bookingDetails.textColor = .white
        return bookingDetails
    }()
    lazy var doc: NSView = {
        let view = NSView()
        view.wantsLayer = true
        return view
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
    


    override func loadView() {
        self.view = NSView()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bookingDetailsScrollView)
        doc.addSubview(invoiceView)
        doc.addSubview(topBar)
        doc.addSubview(bookingDetailsView)
        doc.addSubview(mapView)

        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: topBar, attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .trailing, relatedBy: .equal, toItem: doc, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 57).isActive = true
        setTopBar()
        
        NSLayoutConstraint(item: invoiceView,attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 110.0).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 1090).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .trailing, relatedBy: .equal, toItem: doc, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 365).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 840).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .bottom, relatedBy: .equal, toItem: doc, attribute: .bottom, multiplier: 1.0, constant: -50).isActive = true
        setInvoiceView()
        
        NSLayoutConstraint(item: bookingDetailsView, attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 110.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1050).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 260).isActive = true
        setBookingDetailsView()
        
        NSLayoutConstraint(item: mapView, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .bottom, multiplier: 1.0, constant: 60.0).isActive = true
        NSLayoutConstraint(item: mapView, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: mapView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1050).isActive = true
        NSLayoutConstraint(item: mapView, attribute: .bottom, relatedBy: .equal, toItem: invoiceView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        setMapView()
        
        
        setData()

        

        
    }
   
    
    func setMapView(){
        mapView.addSubview(mapTopBar)
        mapView.addSubview(rideDetails)
        mapView.addSubview(map)

        NSLayoutConstraint(item: mapTopBar,attribute: .top, relatedBy: .equal, toItem: mapView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: mapTopBar, attribute: .leading, relatedBy: .equal, toItem: mapView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: mapTopBar, attribute: .trailing, relatedBy: .equal, toItem: mapView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: mapTopBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        
        
        NSLayoutConstraint(item: rideDetails, attribute: .centerY, relatedBy: .equal, toItem: mapTopBar, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: rideDetails, attribute: .centerX, relatedBy: .equal, toItem: mapTopBar, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: map,attribute: .top, relatedBy: .equal, toItem: mapTopBar, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: map, attribute: .leading, relatedBy: .equal, toItem: mapTopBar, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: map, attribute: .trailing, relatedBy: .equal, toItem: mapTopBar, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
      NSLayoutConstraint(item: map,attribute: .bottom, relatedBy: .equal, toItem: mapView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        
    }
    
    
    func addAnnotation(searchString:String,title:String){
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchString
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, error) in
            if response == nil
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
//                let annotations = self.map.annotations
//                self.map.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = title
                annotation.subtitle = searchString
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.map.addAnnotation(annotation)
                
                //Zooming in on annotation
//                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
//                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
////                let region = MKCoordinateRegion(center: coordinate, span: span)
////                self.map.setRegion(region, animated: true)
                self.map.fitAll()

//                self.map.showAnnotations(self.map.annotations, animated: true)

            }
            
        }
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
        NSLayoutConstraint(item: daysImg, attribute: .top, relatedBy: .equal, toItem:toImg, attribute: .bottom, multiplier: 1.0, constant: 13.0).isActive = true
        NSLayoutConstraint(item: daysImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: daysImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30).isActive = true
        
        
        NSLayoutConstraint(item: noOfDaysLabel, attribute: .leading, relatedBy: .equal, toItem: daysImg, attribute: .trailing, multiplier: 1.0, constant: 10.0).isActive = true
        NSLayoutConstraint(item: noOfDaysLabel, attribute: .top, relatedBy: .equal, toItem: toImg, attribute: .bottom, multiplier: 1.0, constant: 18.5).isActive = true
        
        
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
    
    func setTopBar(){
        topBar.addSubview(bookingDetailsLabel)
        NSLayoutConstraint(item: bookingDetailsLabel, attribute: .centerX, relatedBy: .equal, toItem: topBar, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bookingDetailsLabel, attribute: .centerY, relatedBy: .equal, toItem: topBar, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
    }
    
    
    func setInvoiceView(){
        
        invoiceView.addSubview(line3)
        invoiceView.addSubview(fareDetails)
        invoiceView.addSubview(line4)
        invoiceView.addSubview(baseFare)
        invoiceView.addSubview(doorstepDelivery)
        invoiceView.addSubview(insurance)
        invoiceView.addSubview(surcharges)
        invoiceView.addSubview(baseFareValue)
        invoiceView.addSubview(doorstepDeliveryValue)
        invoiceView.addSubview(insuranceValue)
        invoiceView.addSubview(surchargesValue)
        invoiceView.addSubview(promoCode)
        invoiceView.addSubview(promoCodeValidity)
        invoiceView.addSubview(offerAmount)
        invoiceView.addSubview(line5)
        invoiceView.addSubview(line6)
        invoiceView.addSubview(total)
        invoiceView.addSubview(totalValue)
        invoiceView.addSubview(line7)
        invoiceView.addSubview(line8)
        invoiceView.addSubview(deliveryLocation)
        invoiceView.addSubview(pickupLocation)
        invoiceView.addSubview(deliveryLocationValue)
        invoiceView.addSubview(pickupLocationValue)
        invoiceView.addSubview(freeKmsValue)
        invoiceView.addSubview(freeKms)
        invoiceView.addSubview(additionalKmsValue)
        invoiceView.addSubview(additionalKms)
        invoiceView.addSubview(fuel)
        invoiceView.addSubview(fuelValue)
        invoiceView.addSubview(paymentMode)
        invoiceView.addSubview(paymentModeValue)
        
        
        
        
        
        NSLayoutConstraint(item: fareDetails, attribute: .centerX, relatedBy: .equal, toItem: invoiceView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: fareDetails, attribute: .top, relatedBy: .equal, toItem:invoiceView, attribute: .top, multiplier: 1.0, constant: 20.0).isActive = true
        
        NSLayoutConstraint(item: line3, attribute: .leading, relatedBy: .equal, toItem: invoiceView, attribute: .leading, multiplier: 1.0, constant: 1).isActive = true
        NSLayoutConstraint(item: line3, attribute: .top, relatedBy: .equal, toItem:fareDetails, attribute: .top, multiplier: 1.0, constant: 20.0).isActive = true
        NSLayoutConstraint(item: line3, attribute: .trailing, relatedBy: .equal, toItem: fareDetails, attribute: .leading, multiplier: 1.0, constant: 2).isActive = true
        NSLayoutConstraint(item: line3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 2.2).isActive = true
        
        
        
        NSLayoutConstraint(item: line4, attribute: .leading, relatedBy: .equal, toItem: fareDetails, attribute: .trailing, multiplier: 1.0, constant: 2).isActive = true
        NSLayoutConstraint(item: line4, attribute: .top, relatedBy: .equal, toItem:line3, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: line4, attribute: .trailing, relatedBy: .equal, toItem: invoiceView, attribute: .trailing, multiplier: 1.0, constant: -1).isActive = true
        NSLayoutConstraint(item: line4, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 2.2).isActive = true
        
        
        
        NSLayoutConstraint(item: baseFare, attribute: .top, relatedBy: .equal, toItem: line3, attribute: .bottom, multiplier: 1.0, constant: 25.0).isActive = true
        NSLayoutConstraint(item: baseFare, attribute: .leading, relatedBy: .equal, toItem: invoiceView, attribute: .leading, multiplier: 1.0, constant: 10).isActive = true
        
        
        NSLayoutConstraint(item: doorstepDelivery, attribute: .top, relatedBy: .equal, toItem: baseFare, attribute: .bottom, multiplier: 1.0, constant: 25.0).isActive = true
        NSLayoutConstraint(item: doorstepDelivery, attribute: .leading, relatedBy: .equal, toItem: baseFare, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: insurance, attribute: .top, relatedBy: .equal, toItem: doorstepDelivery, attribute: .bottom, multiplier: 1.0, constant: 25.0).isActive = true
        NSLayoutConstraint(item: insurance, attribute: .leading, relatedBy: .equal, toItem: baseFare, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: surcharges, attribute: .top, relatedBy: .equal, toItem: insurance, attribute: .bottom, multiplier: 1.0, constant: 25.0).isActive = true
        NSLayoutConstraint(item: surcharges, attribute: .leading, relatedBy: .equal, toItem: baseFare, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: baseFareValue, attribute: .top, relatedBy: .equal, toItem: baseFare, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: baseFareValue, attribute: .leading, relatedBy: .equal, toItem: line4, attribute: .leading, multiplier: 1.0, constant: 15).isActive = true
        
        
        NSLayoutConstraint(item: doorstepDeliveryValue, attribute: .top, relatedBy: .equal, toItem: doorstepDelivery, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: doorstepDeliveryValue, attribute: .leading, relatedBy: .equal, toItem: baseFareValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: insuranceValue, attribute: .top, relatedBy: .equal, toItem: insurance, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: insuranceValue, attribute: .leading, relatedBy: .equal, toItem: baseFareValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: surchargesValue, attribute: .top, relatedBy: .equal, toItem: surcharges, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: surchargesValue, attribute: .leading, relatedBy: .equal, toItem: baseFareValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: promoCode, attribute: .top, relatedBy: .equal, toItem: surcharges, attribute: .top, multiplier: 1.0, constant: 75.0).isActive = true
        NSLayoutConstraint(item: promoCode, attribute: .leading, relatedBy: .equal, toItem: baseFare, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: promoCode, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150).isActive = true
        
        
        
        NSLayoutConstraint(item: promoCodeValidity, attribute: .top, relatedBy: .equal, toItem: promoCode, attribute: .bottom, multiplier: 1.0, constant: 15.0).isActive = true
        NSLayoutConstraint(item: promoCodeValidity, attribute: .leading, relatedBy: .equal, toItem: promoCode, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: offerAmount, attribute: .top, relatedBy: .equal, toItem: promoCodeValidity, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: offerAmount, attribute: .leading, relatedBy: .equal, toItem: promoCode, attribute: .trailing, multiplier: 1.0, constant: 90).isActive = true
        
        NSLayoutConstraint(item: line5, attribute: .leading, relatedBy: .equal, toItem: invoiceView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: line5, attribute: .top, relatedBy: .equal, toItem:promoCodeValidity, attribute: .bottom, multiplier: 1.0, constant: 15.0).isActive = true
        NSLayoutConstraint(item: line5, attribute: .trailing, relatedBy: .equal, toItem: invoiceView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: line5, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1.0).isActive = true
        
        
        NSLayoutConstraint(item: total, attribute: .top, relatedBy: .equal, toItem: line5, attribute: .top, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: total, attribute: .leading, relatedBy: .equal, toItem: promoCode, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: totalValue, attribute: .top, relatedBy: .equal, toItem: total, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: totalValue, attribute: .leading, relatedBy: .equal, toItem: surchargesValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: line6, attribute: .leading, relatedBy: .equal, toItem: invoiceView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: line6, attribute: .top, relatedBy: .equal, toItem:totalValue, attribute: .bottom, multiplier: 1.0, constant: 10.0).isActive = true
        NSLayoutConstraint(item: line6, attribute: .trailing, relatedBy: .equal, toItem: invoiceView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: line6, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1.0).isActive = true
        
        NSLayoutConstraint(item: freeKms, attribute: .top, relatedBy: .equal, toItem: line6, attribute: .bottom, multiplier: 1.0, constant: 25).isActive = true
        NSLayoutConstraint(item: freeKms, attribute: .leading, relatedBy: .equal, toItem: total, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: freeKmsValue, attribute: .top, relatedBy: .equal, toItem: freeKms, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: freeKmsValue, attribute: .leading, relatedBy: .equal, toItem: totalValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: additionalKms, attribute: .top, relatedBy: .equal, toItem: freeKms, attribute: .bottom, multiplier: 1.0, constant: 25).isActive = true
        NSLayoutConstraint(item: additionalKms, attribute: .leading, relatedBy: .equal, toItem: freeKms, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: additionalKmsValue, attribute: .top, relatedBy: .equal, toItem: additionalKms, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: additionalKmsValue, attribute: .leading, relatedBy: .equal, toItem: freeKmsValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: fuel, attribute: .top, relatedBy: .equal, toItem: additionalKms, attribute: .bottom, multiplier: 1.0, constant: 25).isActive = true
        NSLayoutConstraint(item: fuel, attribute: .leading, relatedBy: .equal, toItem: additionalKms, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: fuelValue, attribute: .top, relatedBy: .equal, toItem: fuel, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: fuelValue, attribute: .leading, relatedBy: .equal, toItem: additionalKmsValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: paymentMode, attribute: .top, relatedBy: .equal, toItem: fuel, attribute: .bottom, multiplier: 1.0, constant: 25).isActive = true
        NSLayoutConstraint(item: paymentMode, attribute: .leading, relatedBy: .equal, toItem: fuel, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: paymentModeValue, attribute: .top, relatedBy: .equal, toItem: paymentMode, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: paymentModeValue, attribute: .leading, relatedBy: .equal, toItem: additionalKmsValue, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: deliveryLocation, attribute: .top, relatedBy: .equal, toItem: paymentMode, attribute: .bottom, multiplier: 1.0, constant: 35).isActive = true
        NSLayoutConstraint(item: deliveryLocation, attribute: .leading, relatedBy: .equal, toItem: total, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: deliveryLocationValue, attribute: .top, relatedBy: .equal, toItem: deliveryLocation, attribute: .bottom, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: deliveryLocationValue, attribute: .leading, relatedBy: .equal, toItem: deliveryLocation, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: deliveryLocationValue, attribute: .trailing, relatedBy: .equal, toItem: invoiceView, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        
        
        NSLayoutConstraint(item: line7, attribute: .leading, relatedBy: .equal, toItem: deliveryLocation, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: line7, attribute: .top, relatedBy: .equal, toItem:deliveryLocationValue, attribute: .bottom, multiplier: 1.0, constant: 2.0).isActive = true
        NSLayoutConstraint(item: line7, attribute: .trailing, relatedBy: .equal, toItem: invoiceView, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: line7, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 2.2).isActive = true
        
        NSLayoutConstraint(item: pickupLocation, attribute: .top, relatedBy: .equal, toItem: line7, attribute: .bottom, multiplier: 1.0, constant: 25).isActive = true
        NSLayoutConstraint(item: pickupLocation, attribute: .leading, relatedBy: .equal, toItem: deliveryLocation, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: pickupLocationValue, attribute: .top, relatedBy: .equal, toItem: pickupLocation, attribute: .bottom, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: pickupLocationValue, attribute: .leading, relatedBy: .equal, toItem: pickupLocation, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: pickupLocationValue, attribute: .trailing, relatedBy: .equal, toItem: invoiceView, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        
        NSLayoutConstraint(item: line8, attribute: .leading, relatedBy: .equal, toItem: line7, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: line8, attribute: .top, relatedBy: .equal, toItem:pickupLocationValue, attribute: .bottom, multiplier: 1.0, constant: 2.0).isActive = true
        NSLayoutConstraint(item: line8, attribute: .trailing, relatedBy: .equal, toItem: line7, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: line8, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 2.2).isActive = true
        
        
    }
    
    func setData(){
        let car = bookingDetail!.car
        let payment = bookingDetail!.payment
        let noOfDays = DateValidator.daysBetweenDates(dateInput1: bookingDetail!.startDate, dateInput2: bookingDetail!.endDate)
        let baseFare = noOfDays! * car.rentPerDay
        let surCharge = Int(Double(baseFare) * (Double(car.carAdvance)/100.0))
        baseFareValue.stringValue="₹ "+String(baseFare)
        surchargesValue.stringValue="₹ "+String(surCharge)
        totalValue.stringValue="₹ "+String(payment.amountPaid)
        freeKmsValue.stringValue=String(car.freeKm)+" Kms"
        additionalKmsValue.stringValue="₹ "+String(car.additionalKmFee)+"/Km"
        deliveryLocationValue.stringValue=bookingDetail!.deliveryAddress
        pickupLocationValue.stringValue=bookingDetail!.pickupAddress
        addAnnotation(searchString: bookingDetail!.deliveryAddress,title: "Delivery Address")
        addAnnotation(searchString: bookingDetail!.pickupAddress,title: "Pickup Address")

        if(payment.offerApplied != "None"){
            let presenter = BookingPresenter()
            let offer = presenter.applyOffer(offerCode:payment.offerApplied)
            promoCode.stringValue=payment.offerApplied
            promoCodeValidity.stringValue = "Offer Applied "+String(offer!)+"% Off"
            let discount = (car.gettotalAmt)*offer!/100
            offerAmount.stringValue = String("- ₹ "+String(discount))
            totalValue.stringValue=payment.amountPaid
            total.stringValue="Discounted Total"
            promoCodeValidity.textColor = #colorLiteral(red: 0.06694766134, green: 0.7282025218, blue: 0.7311937213, alpha: 1)
            offerAmount.alphaValue=1

        }
        paymentModeValue.stringValue=payment.Payment_Mode
        carName.stringValue=car.carName
//        let decodedData = Data(base64Encoded: car.carImage, options: .ignoreUnknownCharacters)!
//        let decodedimage:NSImage = NSImage(data: decodedData)!
        imageView.image = NSImage(named:car.carImage)
        toImg.image=NSImage(named: "to")
        daysImg.image=NSImage(named: "rides")
        seaterImg.image=NSImage(named: "groups")
        transmissionImg.image=NSImage(named: "gearshift")
        fuelTypeImg.image=NSImage(named: "gas")
        
        startDateLabel.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail!.startDate)
        endDateLabel.stringValue = DateValidator.dateFormattedOutputString1(date: bookingDetail!.endDate)
        
        
        if(noOfDays! == 1){
        noOfDaysLabel.stringValue = String(noOfDays!)+" day"
        }
        else{
        noOfDaysLabel.stringValue = String(noOfDays!)+" days"
        }
        seaterLabel.stringValue=String(car.noOfSeats)+" Seats"
        transmissionLabel.stringValue=String(car.transmission)
        fuelTypeLabel.stringValue=String(car.fuelType)
        
    }

    
    func createLine()->NSView{
        let line = NSView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.wantsLayer = true
        line.layer?.backgroundColor = #colorLiteral(red: 0.5510721803, green: 0.6823329926, blue: 0.6758498549, alpha: 1)
        return line
    }
    
}
