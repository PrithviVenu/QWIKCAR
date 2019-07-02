//
//  PaymentViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 20/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa


class PaymentViewController: NSViewController {
    
    
    var bookingView:BookingView?
    static var seconds = 600
    static var startDate = ""
    static var endDate = ""
    var timer = Timer()
    static var delivery = ""
    static var pickup = ""
    static var promo = ""
    static var promoVal = ""
    static var offerAmt = ""
    static var totalVal = ""
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
    
    lazy var containerView: NSView = {
        let containerView = NSView()
        containerView.wantsLayer=true
        containerView.layer?.backgroundColor = .white
//        containerView.layer?.cornerRadius=6.0
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let controller = ConfirmationViewController.carVC!.storyboard!.instantiateController(withIdentifier: "paymentVC") as! PaymentModeViewController
        
        controller.home=self.parent as? HomeViewController
        addChild(controller )
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        containerView.layer?.backgroundColor = .white
        containerView.layer?.cornerRadius=10.0
        containerView.layer?.masksToBounds=false
        containerView.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        containerView.layer?.shadowOffset=CGSize(width: 0, height: 0)
        containerView.layer?.shadowOpacity=0.7
        return containerView
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
        view1.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.94).cgColor
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
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
    
    lazy var timeRemaining: NSTextField = {
        let timeRemaining = NSTextField(labelWithString: "Time Remaining To Complete Booking")
        timeRemaining.drawsBackground=false
        timeRemaining.isBordered=false
        timeRemaining.translatesAutoresizingMaskIntoConstraints = false
        timeRemaining.font=NSFont.systemFont(ofSize: 16.0)
        timeRemaining.textColor = .white
        return timeRemaining
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
    
    
    
    func bookAndPay(paymentMode:String){
     
        
        let branch = CarViewController.branchTitle
       let deliveryCity = branch[branch.index(after: branch.firstIndex(of: "-")!)...]
       let pickupCity = LocationViewController.pickupBranch![LocationViewController.pickupBranch!.index(after: branch.firstIndex(of: "-")!)...]
       var offerApplied = "None"
        var amountPaid = String(ConfirmationViewController.car!.gettotalAmt)
        
        if(PaymentViewController.promo != ""){
            offerApplied=PaymentViewController.promo
            amountPaid =  PaymentViewController.totalVal
        }
        
        
        let payment = Payment(paymentID: -1, bookingID: -1, offerApplied: offerApplied, amountPaid: amountPaid, Payment_Date: DateValidator.getCurrentDateTimeString(), Payment_Mode: paymentMode)
        
        let bookingDetail=BookingDetails(bookingId: -1, userId: Authentication.userId, car: ConfirmationViewController.car!, deliveryAddress: PaymentViewController.delivery, pickupAddress: PaymentViewController.pickup, deliveryCity: String(deliveryCity), pickupCity: String(pickupCity), bookingDate: DateValidator.getCurrentDateTimeString(), startDate: PaymentViewController.startDate, endDate: PaymentViewController.endDate, payment: payment)
        bookingView!.bookAndPay(bookingDetail: bookingDetail)
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
    
    override func swipe(with event: NSEvent){
        let home = self.parent as? HomeViewController
        home?.confirmationVC(bookingView: bookingView!)
    }
    
    override func loadView() {
        self.view = NSView()
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        PaymentViewController.seconds -= 1      //This will decrement(count down)the seconds.
        if(PaymentViewController.seconds<=0){
            let ans = cancelled(question: "Time Up,Your Booking Has Been Cancelled", text: "")
            if(ans){
                let home = self.parent as? HomeViewController
                home?.mainVC()
            }
            timer.invalidate()
        }
        timeString(time: TimeInterval(PaymentViewController.seconds))
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bookingDetailsScrollView)
        PaymentModeViewController.payment=self
        setData()
        runTimer()
        doc.addSubview(invoiceView)
        doc.addSubview(topBar)
        doc.addSubview(containerView)
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
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            containerView.trailingAnchor.constraint(equalTo: invoiceView.leadingAnchor, constant: -30),
            containerView.topAnchor.constraint(equalTo: invoiceView.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: invoiceView.bottomAnchor, constant: 0),
            ])
        
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
        
      
    }
    
    func setData(){
        baseFareValue.stringValue="₹ "+String(ConfirmationViewController.car!.getbaseFare)
        surchargesValue.stringValue="₹ "+String(ConfirmationViewController.car!.getsurCharge)
        totalValue.stringValue="₹ "+String(ConfirmationViewController.car!.gettotalAmt)
        freeKmsValue.stringValue=String(ConfirmationViewController.car!.freeKm)+" Kms"
        additionalKmsValue.stringValue="₹ "+String(ConfirmationViewController.car!.additionalKmFee)+"/Km"
        deliveryLocationValue.stringValue=PaymentViewController.delivery
        pickupLocationValue.stringValue=PaymentViewController.pickup
        if(PaymentViewController.promo != "" && PaymentViewController.promoVal != ""){
            promoCode.stringValue=PaymentViewController.promo
            promoCodeValidity.stringValue=PaymentViewController.promoVal
            offerAmount.stringValue = PaymentViewController.offerAmt
            totalValue.stringValue=PaymentViewController.totalVal
            total.stringValue="Discounted Total"
            promoCodeValidity.textColor = #colorLiteral(red: 0.06694766134, green: 0.7282025218, blue: 0.7311937213, alpha: 1)
            offerAmount.alphaValue=1

        }
        
    }
    
    func createLine()->NSView{
        let line = NSView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.wantsLayer = true
        line.layer?.backgroundColor = #colorLiteral(red: 0.5510721803, green: 0.6823329926, blue: 0.6758498549, alpha: 1)
        return line
    }
}
