//
//  ConfirmationViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 06/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class ConfirmationViewController: NSViewController{
    
   static var car:Car?

   static var startDate=""
   static var endDate:String=""
   static var noOfDays:Int?
   var bookingView:BookingView?
    var locationVC1:LocationViewController?
    var locationVC2:LocationViewController?
    var seconds = 600
    var timer = Timer()

    static var carVC:CarViewController?

    lazy var doc: NSView = {
        let view = NSView()
        view.wantsLayer = true
        return view
    }()
    
    lazy var city: NSTextField = {
        let city = NSTextField(labelWithString: "Chennai")
        city.translatesAutoresizingMaskIntoConstraints = false
        city.font=NSFont.systemFont(ofSize: 16.0)
        city.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return city
    }()
    
    lazy var changeCity: NSTextField = {
        let changeCity = NSTextField(labelWithString: "Change City")
        changeCity.translatesAutoresizingMaskIntoConstraints = false
        changeCity.font=NSFont.systemFont(ofSize: 16.0)
        changeCity.textColor = #colorLiteral(red: 0.06694766134, green: 0.7282025218, blue: 0.7311937213, alpha: 1)
        return changeCity
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
    
    lazy var topBar: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.94).cgColor
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    lazy var m: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.cornerRadius=5
         NSLayoutConstraint(item: view1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        view1.layer?.backgroundColor = #colorLiteral(red: 0.1999788582, green: 0.2000134587, blue: 0.1999712586, alpha: 1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    lazy var m1: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.cornerRadius=5

        NSLayoutConstraint(item: view1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        view1.layer?.backgroundColor = #colorLiteral(red: 0.1999788582, green: 0.2000134587, blue: 0.1999712586, alpha: 1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    lazy var s: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.cornerRadius=5
        NSLayoutConstraint(item: view1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        view1.layer?.backgroundColor = #colorLiteral(red: 0.1999788582, green: 0.2000134587, blue: 0.1999712586, alpha: 1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    lazy var s1: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.cornerRadius=5
        NSLayoutConstraint(item: view1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        view1.layer?.backgroundColor = #colorLiteral(red: 0.1999788582, green: 0.2000134587, blue: 0.1999712586, alpha: 1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    lazy var l1: NSTextField = {
        let l = NSTextField(labelWithString: "1")
        l.translatesAutoresizingMaskIntoConstraints = false
        l.drawsBackground = false
        l.wantsLayer=true
        l.font=NSFont.systemFont(ofSize: 28.0)
        l.textColor = .white
        return l
    }()
    
    lazy var l2: NSTextField = {
        let l = NSTextField(labelWithString: "0")
        l.translatesAutoresizingMaskIntoConstraints = false
        l.drawsBackground = false
        l.wantsLayer=true
        l.font=NSFont.systemFont(ofSize: 28.0)
        l.textColor = .white
        return l
    }()
    
    lazy var l3: NSTextField = {
        let l = NSTextField(labelWithString: "0")
        l.translatesAutoresizingMaskIntoConstraints = false
        l.drawsBackground = false
        l.wantsLayer=true
        l.font=NSFont.systemFont(ofSize: 28.0)
        l.textColor = .white
        return l
    }()
    
    lazy var l4: NSTextField = {
        let l = NSTextField(labelWithString: "0")
        l.translatesAutoresizingMaskIntoConstraints = false
        l.drawsBackground = false
        l.wantsLayer=true
        l.font=NSFont.systemFont(ofSize: 28.0)
        l.textColor = .white
        return l
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
    
    lazy var cancelBooking: NSTextField = {
        let cancelBooking = NSTextField(labelWithString: "Cancel Booking")
        cancelBooking.translatesAutoresizingMaskIntoConstraints = false
        cancelBooking.font=NSFont.systemFont(ofSize: 16.0)
        cancelBooking.textColor = #colorLiteral(red: 0.5999458432, green: 0.600034833, blue: 0.5999264717, alpha: 1)
        let gestureRecognizer = NSClickGestureRecognizer(target: self,action: #selector(cancel(sender:)))
        cancelBooking.addGestureRecognizer(gestureRecognizer)
        return cancelBooking
    }()
    
    @objc func cancel(sender: NSTextField){
        let answer = dialogOKCancel(question: "Cancel Booking", text: "Are you sure you want to cancel this booking ?")
        if(answer){
            let ans = cancelled(question: "Your Booking Has Been Cancelled", text: "")
            if(ans){
                let home = self.parent as? HomeViewController
                home?.mainVC()
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
//        promoCode.isEditable = true
//        promoCode.cell?.sendsActionOnEndEditing = true
        promoCode.wantsLayer=true
        promoCode.layer?.borderColor=#colorLiteral(red: 0.5510721803, green: 0.6823329926, blue: 0.6758498549, alpha: 1)
        promoCode.translatesAutoresizingMaskIntoConstraints = false
        promoCode.font=NSFont.systemFont(ofSize: 16.0)
        promoCode.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        return promoCode
    }()
    
    lazy var promoCodeValidity: NSTextField = {
        let promoCodeValidity = NSTextField(labelWithString: "Offer Code Invalid")
        promoCodeValidity.translatesAutoresizingMaskIntoConstraints = false
        promoCodeValidity.font=NSFont.systemFont(ofSize: 13.0)
        promoCodeValidity.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        promoCodeValidity.alphaValue=0
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
        deliveryLocation.isSelectable=false
        deliveryLocation.drawsBackground=false
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
    
    
    lazy var timeRemaining: NSTextField = {
        let timeRemaining = NSTextField(labelWithString: "Time Remaining To Complete Booking")
        timeRemaining.drawsBackground=false
        timeRemaining.isBordered=false
        timeRemaining.translatesAutoresizingMaskIntoConstraints = false
        timeRemaining.font=NSFont.systemFont(ofSize: 16.0)
        timeRemaining.textColor = .white
        return timeRemaining
    }()
    
    
    lazy var offerAmount: NSTextField = {
        let offerAmount = NSTextField(labelWithString: "- 250")
        offerAmount.translatesAutoresizingMaskIntoConstraints = false
        offerAmount.font=NSFont.systemFont(ofSize: 16.0)
        offerAmount.textColor = #colorLiteral(red: 0.1215540245, green: 0.1215779856, blue: 0.1215487644, alpha: 1)
        offerAmount.alphaValue=0
        return offerAmount
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
    
    
    
    override func swipe(with event: NSEvent){
        let home = self.parent as? HomeViewController
        home?.carVC(bookingView: bookingView!)
    }
    
    lazy var Apply: NSButton = {
        let Apply = NSButton()
        Apply.title="Apply"
        Apply.bezelStyle = NSButton.BezelStyle.roundRect
        Apply.setText(text: "Apply", color: .white, font: NSFont.systemFont(ofSize: 16.0), alignment:.center)
        Apply.translatesAutoresizingMaskIntoConstraints = false
        Apply.font=NSFont.systemFont(ofSize: 14.0)
        Apply.wantsLayer=true
        Apply.layer?.cornerRadius=4
        Apply.layer?.backgroundColor = #colorLiteral(red: 0.03799234703, green: 0.7283424735, blue: 0.7875644565, alpha: 1)
        Apply.layer?.shadowOffset=CGSize(width: 0, height: 0)
        Apply.layer?.shadowOpacity=0.9
        Apply.layer?.shadowColor=#colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1)
        Apply.target = self
        Apply.action = #selector(applyCoupon)
        return Apply
    }()
    
    lazy var Pay: NSButton = {
        let Pay = NSButton()
        Pay.title="Pay"
        Pay.bezelStyle = NSButton.BezelStyle.roundRect
        Pay.setText(text: "Pay", color: .white, font: NSFont.systemFont(ofSize: 16.0), alignment:.center)
        Pay.translatesAutoresizingMaskIntoConstraints = false
        Pay.font=NSFont.systemFont(ofSize: 14.0)
        Pay.wantsLayer=true
        Pay.layer?.cornerRadius=4
        Pay.layer?.backgroundColor = #colorLiteral(red: 0.03799234703, green: 0.7283424735, blue: 0.7875644565, alpha: 1)
        Pay.layer?.shadowOffset=CGSize(width: 0, height: 0)
        Pay.layer?.shadowOpacity=0.9
        Pay.layer?.shadowColor=#colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1)
        Pay.target = self
        Pay.action = #selector(payBill)
        return Pay
    }()
    
    lazy var remove: NSButton = {
        let remove = NSButton()
        remove.alphaValue=0
        remove.isEnabled=false
        remove.translatesAutoresizingMaskIntoConstraints = false
        remove.image=NSImage(named: "remove")
        remove.imagePosition = NSControl.ImagePosition.imageOnly
        remove.isBordered=false
        remove.target = self
        remove.action = #selector(removeCoupon)
        return remove
    }()

    @objc func removeCoupon(){
        offerAmount.alphaValue=0
        promoCodeValidity.alphaValue=0
        promoCode.stringValue=""
        total.stringValue="Total"
        totalValue.stringValue="₹ "+String(ConfirmationViewController.car!.gettotalAmt)
        promoCode.isEditable=true
        PaymentViewController.promo=""
        PaymentViewController.promoVal=""
        remove.alphaValue=0
        remove.isEnabled=false
    }
    @objc func payBill(){
        if(deliveryLocationValue.stringValue=="" || pickupLocationValue.stringValue==""){
            return
        }
        moveToPaymentPage()
    }
    
    @objc func applyCoupon(){
        let couponCode = promoCode.stringValue
        if let offer = bookingView!.applyOffer(offerCode:couponCode){
            promoCodeValidity.stringValue = "Offer Applied "+String(offer)+"% Off"
            promoCodeValidity.textColor = #colorLiteral(red: 0.06694766134, green: 0.7282025218, blue: 0.7311937213, alpha: 1)
            promoCode.isEnabled=false
            promoCode.isEditable=false
            promoCode.isEnabled=true
            remove.alphaValue=1
            remove.isEnabled=true
            PaymentViewController.promo=promoCode.stringValue
            PaymentViewController.promoVal=promoCodeValidity.stringValue

//            promoCode.cell?.sendsActionOnEndEditing = true
            let discount = (ConfirmationViewController.car!.gettotalAmt)*offer/100
            offerAmount.stringValue = String("- ₹ "+String(discount))
            PaymentViewController.offerAmt=offerAmount.stringValue
            totalValue.stringValue="₹ "+String(ConfirmationViewController.car!.gettotalAmt+300 - discount)
            PaymentViewController.totalVal=totalValue.stringValue
            total.stringValue="Discounted Total"
            offerAmount.alphaValue=1

        }
        else{
            promoCodeValidity.stringValue="Promo code not found"
            promoCodeValidity.textColor = #colorLiteral(red: 0.9575068355, green: 0.2652139664, blue: 0.2105387449, alpha: 1)
            PaymentViewController.promo=""
            PaymentViewController.promoVal=""
            offerAmount.alphaValue=0

        }
        
        promoCodeValidity.alphaValue=1
    }
    
    lazy var tabView: NSTabView = {
        let view = getTabView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func loadView() {
        self.view = NSView()
    }
    func setup() { // Your setup method
        let gestureRecognizer1 = NSClickGestureRecognizer(target: self,action: #selector(didTapTextField1(sender:)))
        let gestureRecognizer2 = NSClickGestureRecognizer(target: self,action: #selector(didTapTextField2(sender:)))
        let gestureRecognizer3 = NSClickGestureRecognizer(target: self,action: #selector(didTapTextField1(sender:)))
        let gestureRecognizer4 = NSClickGestureRecognizer(target: self,action: #selector(didTapTextField2(sender:)))
        let gestureRecognizer5 = NSClickGestureRecognizer(target: self,action: #selector(didTapTextField1(sender:)))
        let gestureRecognizer6 = NSClickGestureRecognizer(target: self,action: #selector(didTapTextField2(sender:)))
        let gestureRecognizer7 = NSClickGestureRecognizer(target: self,action: #selector(didTapTextField(sender:)))

        deliveryLocation.addGestureRecognizer(gestureRecognizer1)
        pickupLocation.addGestureRecognizer(gestureRecognizer2)
        line7.addGestureRecognizer(gestureRecognizer3)
        line8.addGestureRecognizer(gestureRecognizer4)
        deliveryLocationValue.addGestureRecognizer(gestureRecognizer5)
        pickupLocationValue.addGestureRecognizer(gestureRecognizer6)
        changeCity.addGestureRecognizer(gestureRecognizer7)
        LocationViewController.confirmationVC = self
    }
    
    
    @objc
    func didTapTextField(sender: NSTextField) {
        let home = self.parent as? HomeViewController
        home?.mainVC()
    }
    
    @objc
    func didTapTextField2(sender: NSTextField) {
        
        if(locationVC2==nil){
            locationVC2=ConfirmationViewController.carVC!.storyboard!.instantiateController(withIdentifier: "LocationVc") as? LocationViewController
        
        }
      locationVC2!.annotationTitle = "Pickup Location"
        if(LocationViewController.presented==false){
    self.present(locationVC2!, asPopoverRelativeTo: pickupLocation.bounds, of: pickupLocation, preferredEdge: .maxY, behavior: .semitransient)
    }
        
   
    }
    @objc
    func didTapTextField1(sender: NSTextField) {
        
        if(locationVC1==nil){
            locationVC1=ConfirmationViewController.carVC!.storyboard!.instantiateController(withIdentifier: "LocationVc") as? LocationViewController
            
        }
        
        locationVC1!.annotationTitle = "Delivery Location"
        if(LocationViewController.presented==false){
        self.present(locationVC1!, asPopoverRelativeTo: deliveryLocation.bounds, of: deliveryLocation, preferredEdge: .maxY, behavior: .semitransient)
   
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setup()
        self.view.addSubview(bookingDetailsScrollView)
        doc.addSubview(bookingDetailsView)
        doc.addSubview(tabView)
        doc.addSubview(invoiceView)
        doc.addSubview(topBar)
        runTimer()

        

        tabView.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        NSLayoutConstraint(item: topBar, attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
          NSLayoutConstraint(item: topBar, attribute: .trailing, relatedBy: .equal, toItem: doc, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 57).isActive = true
        setTopBar()
        
        
        NSLayoutConstraint(item: bookingDetailsView, attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 110.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1050).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 260).isActive = true
        setBookingDetailsView()

        
        NSLayoutConstraint(item: tabView, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .bottom, multiplier: 1.0, constant: 130.0).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .trailing, relatedBy: .equal, toItem: bookingDetailsView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 450).isActive = true
        
        
        
        
        NSLayoutConstraint(item: invoiceView, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .bottom, relatedBy: .equal, toItem: tabView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .trailing, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .trailing, relatedBy: .equal, toItem: doc, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 365).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .bottom, relatedBy: .equal, toItem: doc, attribute: .bottom, multiplier: 1.0, constant: -50).isActive = true
        setInvoiceView()
       
        
        
        
        
    }
    
    func setTopBar(){
        topBar.addSubview(m)
        topBar.addSubview(m1)
        topBar.addSubview(s)
        topBar.addSubview(s1)
        topBar.addSubview(cancelBooking)
        topBar.addSubview(timeRemaining)

        m.addSubview(l1)
        m1.addSubview(l2)
        s.addSubview(l3)
        s1.addSubview(l4)
        
        NSLayoutConstraint(item: m, attribute: .centerX, relatedBy: .equal, toItem: topBar, attribute: .centerX, multiplier: 1.0, constant: -130).isActive = true
        NSLayoutConstraint(item: m, attribute: .centerY, relatedBy: .equal, toItem: topBar, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: m1, attribute: .leading, relatedBy: .equal, toItem: m, attribute: .trailing, multiplier: 1.0, constant: 2).isActive = true
        NSLayoutConstraint(item: m1, attribute: .top, relatedBy: .equal, toItem:m, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: s, attribute: .leading, relatedBy: .equal, toItem: m1, attribute: .trailing, multiplier: 1.0, constant: 17).isActive = true
        NSLayoutConstraint(item: s, attribute: .top, relatedBy: .equal, toItem:m1, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: s1, attribute: .leading, relatedBy: .equal, toItem: s, attribute: .trailing, multiplier: 1.0, constant: 2).isActive = true
        NSLayoutConstraint(item: s1, attribute: .top, relatedBy: .equal, toItem:s, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: l1, attribute: .centerX, relatedBy: .equal, toItem: m, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: l1, attribute: .centerY, relatedBy: .equal, toItem: m, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: l2, attribute: .centerX, relatedBy: .equal, toItem: m1, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: l2, attribute: .centerY, relatedBy: .equal, toItem: m1, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: l3, attribute: .centerX, relatedBy: .equal, toItem: s, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: l3, attribute: .centerY, relatedBy: .equal, toItem: s, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: l4, attribute: .centerX, relatedBy: .equal, toItem: s1, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: l4, attribute: .centerY, relatedBy: .equal, toItem: s1, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: cancelBooking, attribute: .trailing, relatedBy: .equal, toItem: topBar, attribute: .trailing, multiplier: 1.0, constant: -60).isActive = true
        NSLayoutConstraint(item: cancelBooking, attribute: .top, relatedBy: .equal, toItem:topBar, attribute: .top, multiplier: 1.0, constant: 20.0).isActive = true
       
        NSLayoutConstraint(item: timeRemaining, attribute: .leading, relatedBy: .equal, toItem: s1, attribute: .trailing, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: timeRemaining, attribute: .top, relatedBy: .equal, toItem:cancelBooking, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
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
        invoiceView.addSubview(Apply)
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
        invoiceView.addSubview(remove)
        invoiceView.addSubview(Pay)




        
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
        
        NSLayoutConstraint(item: remove, attribute: .top, relatedBy: .equal, toItem: promoCode, attribute: .top, multiplier: 1.0, constant: 6.0).isActive = true
        NSLayoutConstraint(item: remove, attribute: .leading, relatedBy: .equal, toItem: promoCode, attribute: .trailing, multiplier: 1.0, constant: 12).isActive = true
        NSLayoutConstraint(item: remove, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: remove, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 10).isActive = true

        NSLayoutConstraint(item: Apply, attribute: .top, relatedBy: .equal, toItem: promoCode, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: Apply, attribute: .leading, relatedBy: .equal, toItem: promoCode, attribute: .trailing, multiplier: 1.0, constant: 90).isActive = true
        
        NSLayoutConstraint(item: promoCodeValidity, attribute: .top, relatedBy: .equal, toItem: promoCode, attribute: .bottom, multiplier: 1.0, constant: 15.0).isActive = true
        NSLayoutConstraint(item: promoCodeValidity, attribute: .leading, relatedBy: .equal, toItem: promoCode, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    
        NSLayoutConstraint(item: offerAmount, attribute: .top, relatedBy: .equal, toItem: promoCodeValidity, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: offerAmount, attribute: .leading, relatedBy: .equal, toItem: Apply, attribute: .leading, multiplier: 1.0, constant: -8).isActive = true
        
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
        
        NSLayoutConstraint(item: deliveryLocation, attribute: .top, relatedBy: .equal, toItem: fuelValue, attribute: .bottom, multiplier: 1.0, constant: 35).isActive = true
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
        
        NSLayoutConstraint(item: Pay, attribute: .bottom, relatedBy: .equal, toItem: invoiceView, attribute: .bottom, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: Pay, attribute: .centerX, relatedBy: .equal, toItem: invoiceView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1      //This will decrement(count down)the seconds.
        if(seconds<=0){
            print(22222222)
            timer.invalidate()
        }
        timeString(time: TimeInterval(seconds))
    }
    func timeString(time:TimeInterval) {
        
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        l1.stringValue=String(minutes/10)
        l2.stringValue=String(minutes%10)
        l3.stringValue=String(seconds/10)
        l4.stringValue=String(seconds%10)
//         return String(format:"%02i:%02i", minutes, seconds)
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
        bookingDetailsView.addSubview(city)
        bookingDetailsView.addSubview(changeCity)

        

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
        
        NSLayoutConstraint(item: city, attribute: .centerX, relatedBy: .equal, toItem: daysImg, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: city, attribute: .top, relatedBy: .equal, toItem:daysImg, attribute: .bottom, multiplier: 1.0, constant: 23.0).isActive = true
        
        NSLayoutConstraint(item: changeCity, attribute: .leading, relatedBy: .equal, toItem: city, attribute: .trailing, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: changeCity, attribute: .top, relatedBy: .equal, toItem:city, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        
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
        let branch = CarViewController.branchTitle
        city.stringValue=String(branch[branch.index(after: branch.firstIndex(of: "-")!)...])
        
//        let decodedData = Data(base64Encoded: ConfirmationViewController.car!.carImage, options: .ignoreUnknownCharacters)!
//        let decodedimage:NSImage = NSImage(data: decodedData)!
        imageView.image = NSImage(named:ConfirmationViewController.car!.carImage)
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
        baseFareValue.stringValue="₹ "+String(ConfirmationViewController.car!.getbaseFare)
        surchargesValue.stringValue="₹ "+String(ConfirmationViewController.car!.getsurCharge)
        totalValue.stringValue="₹ "+String(ConfirmationViewController.car!.gettotalAmt+300)
        freeKmsValue.stringValue=String(ConfirmationViewController.car!.freeKm)+" Kms"
        additionalKmsValue.stringValue="₹ "+String(ConfirmationViewController.car!.additionalKmFee)+"/Km"

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
        //MARK:-FUEL CONSTRAINTS
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
    
    func moveToPaymentPage(){
        PaymentViewController.delivery=deliveryLocationValue.stringValue
        PaymentViewController.pickup=pickupLocationValue.stringValue
        PaymentViewController.seconds = seconds
        let home = self.parent as? HomeViewController
        home?.paymentVC(bookingView: bookingView!)
        
    }
   
    
    
    
}
