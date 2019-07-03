//
//  PaymentModeViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 20/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class PaymentModeViewController: NSViewController,NSTextFieldDelegate {

    var home:HomeViewController?

    
    @IBOutlet weak var invalid: NSTextField!
    @IBOutlet weak var visa: NSImageView!
    @IBOutlet weak var cardNumber: NSTextField!
    @IBOutlet weak var walletView: NSView!
    @IBOutlet weak var cardView: NSView!
    @IBOutlet weak var payzappView: NSView!
    @IBOutlet weak var phonepeView: NSView!
    @IBOutlet weak var gpayView: NSView!
    @IBOutlet weak var bookingLoadingScreenView: NSView!
    @IBOutlet weak var paytmView: NSView!
    @IBOutlet weak var encryptionDetail: NSTextField!
    @IBOutlet weak var gpay: NSButton!
    @IBOutlet weak var phonepe: NSButton!
    @IBOutlet weak var payzapp: NSButton!
    @IBOutlet weak var paytm: NSButton!
    @IBOutlet weak var wallet: NSButton!
    @IBOutlet weak var card: NSButton!
    @IBOutlet weak var sidebar: NSView!
    @IBOutlet weak var topBar: NSView!
    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var americanExpress: NSImageView!
    @IBOutlet weak var maestro: NSImageView!
    @IBOutlet weak var bookingSuccessfulView: NSView!
    @IBOutlet weak var masterCard: NSImageView!
    
    @IBOutlet weak var cvv: NSTextField!
    @IBOutlet weak var yyyy: NSTextField!
    @IBOutlet weak var mm: NSTextField!
    @IBOutlet weak var cardExpired: NSTextField!
    
    //completebooking
    
    @IBOutlet weak var bookingId: NSTextField!
    
    @IBOutlet weak var paymentMode: NSTextField!
    
    @IBOutlet weak var paymentdate: NSTextField!
    
    @IBOutlet weak var startDate: NSTextField!
    
    @IBOutlet weak var endDate: NSTextField!
    
    
    let shapeLayer = CAShapeLayer()

    static var payment:PaymentViewController?
    
    
    var pattern = ["^4[0-9]{12}(?:[0-9]{3})?$","^(5[1-5][0-9]{14}|2(22[1-9][0-9]{12}|2[3-9][0-9]{13}|[3-6][0-9]{14}|7[0-1][0-9]{13}|720[0-9]{12}))$","^(5018|5020|5038|6304|6759|6761|6763)[0-9]{8,15}$","^3[47][0-9]{13}$"]
    var master="^(2|5|5[1-5]|2[2-7]|222|272|22[3-9]|5[1-5][0-9]{0,14}|22[3-9][0,9]{0,13}|222[1-9]|222[1-9][0-9]{0,12}|2[3-6][0-9]{0,14}|27[0-1]|27[0-1][0-9]{0,13}|2720|2720[0-9]{0,12})$"
    
    var bookingComplete=false
    lazy var Pay: NSButton = {
        let Pay = NSButton()
        Pay.title="Pay"
        Pay.bezelStyle = NSButton.BezelStyle.roundRect
        Pay.setText(text: "Pay", color: .white, font: NSFont.systemFont(ofSize: 16.0), alignment:.center)
        Pay.translatesAutoresizingMaskIntoConstraints = false
        Pay.font=NSFont.systemFont(ofSize: 14.0)
        Pay.wantsLayer=true
        Pay.layer?.cornerRadius=4
        Pay.layer?.backgroundColor = #colorLiteral(red: 0.3176470588, green: 0.6392156863, blue: 0.8352941176, alpha: 1)
        Pay.layer?.shadowOffset=CGSize(width: 0, height: 0)
        Pay.layer?.shadowOpacity=0.9
        Pay.layer?.shadowColor=#colorLiteral(red: 0.3176470588, green: 0.6392156863, blue: 0.8352941176, alpha: 1)
        Pay.target = self
        Pay.action = #selector(payBill)
        return Pay
    }()
    
    @IBAction func done(_ sender: Any) {
        
     home!.mainVC()
        
    }
    @objc func payBill(){
        let card = cardNumber.stringValue
        if((test(number: card, pattern: pattern[0])||test(number: card, pattern: pattern[1])||test(number: card, pattern: pattern[2])||test(number: card, pattern: pattern[3]))){
            
            
            if(test(number: mm.stringValue, pattern:"^[0-9][1-9]$")){
                
            }
            else{
                cardExpired.stringValue = "Enter Valid Expiry"
                cardExpired.alphaValue=1
              return
            }
            
            if(yyyy.stringValue=="2019" ||  test(number: yyyy.stringValue, pattern:"^20[2-9][0-9]$")){
                
            }
            else{
                cardExpired.stringValue = "Enter Valid Expiry"
                cardExpired.alphaValue=1
                return
            }
            
             let  date = yyyy.stringValue+"-"+mm.stringValue
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM"
            let date1 = formatter.date(from: date)
            if(date1 == nil){
                cardExpired.stringValue = "Enter Valid Expiry"
                cardExpired.alphaValue=1
                return
            }
            if(date1!.isInPastMonthYear){
                cardExpired.stringValue = "Card Has Expired"
                cardExpired.alphaValue=1
                return
            }
            loadingScreen()
            
        }
        else{
           invalid.alphaValue=1
        }
    }
    
    func loadingScreen(){
        
        tabView.selectTabViewItem(at: 6)
        bookingLoadingScreenView.wantsLayer=true
//        let size = tabView.frame.size
//        let center = CGPoint(x: size.width / 2.0, y: (size.height) / 2.0 + 40.0)
//        print(size,center)
//        let circularPath = NSBezierPath()
//        circularPath.appendArc(withCenter: center, radius: 50.0, startAngle: 0, endAngle: -360, clockwise: true)
//        let trackLayer = CAShapeLayer()
//        trackLayer.path=circularPath.cgPath
//        trackLayer.strokeColor = #colorLiteral(red: 0.7019607843, green: 0.8980392157, blue: 0.9882352941, alpha: 1)
//        trackLayer.lineWidth = 10
//        trackLayer.fillColor = NSColor.clear.cgColor
//        trackLayer.lineCap = CAShapeLayerLineCap.round
//        bookingLoadingScreenView.layer?.addSublayer(trackLayer)
//
//        shapeLayer.path = circularPath.cgPath
//        shapeLayer.strokeColor = #colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)
//
//        shapeLayer.lineWidth = 10
//        shapeLayer.fillColor = NSColor.clear.cgColor
//        shapeLayer.lineCap = CAShapeLayerLineCap.round
//        shapeLayer.strokeEnd = 0
//        bookingLoadingScreenView.layer?.addSublayer(shapeLayer)
//
//        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        basicAnimation.toValue = 1
//        basicAnimation.duration = 1
//        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
//        basicAnimation.isRemovedOnCompletion = false
//        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
////        tabView.selectTabViewItem(at: 8)
       
        
             PaymentModeViewController.payment!.bookAndPay(paymentMode: "Visa")
             tabView.selectTabViewItem(at: 7)
             bookingComplete=true
             setAlpha()
        
//            let ans = success(question: "Your Booking Has Been Confirmed", text: "")
//            if(ans){
//
//                home!.mainVC()
//            }
        
        
    }
    
    func CompleteBooking(bookingDetail:BookingDetails){
       
        bookingId.stringValue=String(bookingDetail.bookingId)
        paymentMode.stringValue=bookingDetail.payment.Payment_Mode
        paymentdate.stringValue=bookingDetail.payment.Payment_Date
        startDate.stringValue=bookingDetail.startDate
        endDate.stringValue=bookingDetail.endDate
        
    }
    
    
//    func success(question: String, text: String) -> Bool {
//        let alert = NSAlert()
//        alert.messageText = question
//        alert.alertStyle = .informational
//        alert.addButton(withTitle: "Ok")
//        return alert.runModal() == .alertFirstButtonReturn
//    }
    
    func test(number:String,pattern:String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern:pattern,
                                                options: .caseInsensitive)
            return regex.matches(in: number,
                                 options: [],
                                 range: NSMakeRange(0, number.count)).count > 0
        } catch {
            return false
        }
        
    }
  
    
    
    
   
    
    
    @IBAction func card(_ sender: Any) {
        if(bookingComplete == true){return}
        setAlpha()
        tabView.selectTabViewItem(at: 0)
        card.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
    }
    
    @IBAction func wallet(_ sender: Any) {
        if(bookingComplete == true){return}
//        setAlpha()
//        tabView.selectTabViewItem(at: 1)
//        wallet.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
    }
    
    
    @IBAction func paytm(_ sender: Any) {
        if(bookingComplete == true){return}
//        setAlpha()
//        tabView.selectTabViewItem(at: 2)
//        paytm.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
        
    }
    
    @IBAction func payzapp(_ sender: Any) {
        if(bookingComplete == true){return}
//        setAlpha()
//        tabView.selectTabViewItem(at: 3)
//        payzapp.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
        
    }
    
    @IBAction func phonepe(_ sender: Any) {
        if(bookingComplete == true){return}
//        setAlpha()
//        tabView.selectTabViewItem(at: 4)
//        phonepe.backgroundWithAlpha(color: NSColor.black, alpha:0.1)

    }
    
    
    @IBAction func gpay(_ sender: Any) {
        if(bookingComplete == true){return}
//        setAlpha()
//        tabView.selectTabViewItem(at: 5)
//        gpay.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.wantsLayer=true
        topBar.layer?.backgroundColor = #colorLiteral(red: 0.1500522792, green: 0.6636349559, blue: 0.8786595464, alpha: 1)
        card.wantsLayer=true
        phonepe.wantsLayer=true
        payzapp.wantsLayer=true
        paytm.wantsLayer=true
        gpay.wantsLayer=true
        wallet.wantsLayer=true
        cardView.addSubview(Pay)
        invalid.alphaValue=0
        cardExpired.alphaValue=0
        NSLayoutConstraint(item: Pay, attribute: .top, relatedBy: .equal, toItem: encryptionDetail, attribute: .bottom, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: Pay, attribute: .centerX, relatedBy: .equal, toItem: cardView, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        card.backgroundWithAlpha(color: NSColor.black, alpha: 0.1)
        cardNumber.delegate=self
        mm.delegate=self
        yyyy.delegate=self
        

    }
    func setAlpha()
    {
        
        card.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        paytm.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        wallet.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        payzapp.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        phonepe.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
        gpay.backgroundWithAlpha(color: NSColor.white, alpha: 0.0)
    }
    
//    func controlTextDidBeginEditing(_ obj: Notification) {
//        guard let textField = obj.object as? NSTextField else {return}
//        if textField == cardNumber {
//            invalid.alphaValue=0
//        }
//    }

    func controlTextDidChange(_ obj: Notification){
        guard let textField = obj.object as? NSTextField else {return}
        
        
        if textField == mm{
            cardExpired.alphaValue=0
        }
        if textField == yyyy{
            cardExpired.alphaValue=0

        }
        
        if textField == cardNumber{
            visa.isEnabled=false
            masterCard.isEnabled=false
            maestro.isEnabled=false
            americanExpress.isEnabled=false
            invalid.alphaValue=0
            let number = textField.stringValue
            
            
            if number == "5" {
                visa.isEnabled=false
                masterCard.isEnabled=true
                maestro.isEnabled=true
                americanExpress.isEnabled=false
                return
            }
            if(test(number: number, pattern: "^(4|4[0-9]{0,12}|4[0-9]{12}(?:[0-9]{0,3})?)$")){
                visa.isEnabled=true
                masterCard.isEnabled=false
                maestro.isEnabled=false
                americanExpress.isEnabled=false
            }
            else  if(test(number: number, pattern: master)){
                visa.isEnabled=false
                masterCard.isEnabled=true
                maestro.isEnabled=false
                americanExpress.isEnabled=false
            }
            else  if(test(number: number, pattern: "^((5018|5020|5038|6304|6759|6761|6763)|(5018|5020|5038|6304|6759|6761|6763)[0-9]{0,15} |[56]|50|6[37]|50[1-3]|630|67[56])$")){
                visa.isEnabled=false
                masterCard.isEnabled=false
                maestro.isEnabled=true
                americanExpress.isEnabled=false
                
            }
            else  if(test(number: number, pattern: "^(3|3[47]|3[47][0-9]{0,13})$")){
                visa.isEnabled=false
                masterCard.isEnabled=false
                maestro.isEnabled=false
                americanExpress.isEnabled=true
            }
            else{
                invalid.alphaValue=1
            }
            
        }
        
    }
    
    
    func controlTextDidEndEditing(_ obj: Notification) {
        guard let textField = obj.object as? NSTextField else {return}
        if textField == cardNumber {
            let number = textField.stringValue
            if(test(number: number, pattern: pattern[0])){
                visa.isEnabled=true
                masterCard.isEnabled=false
                maestro.isEnabled=false
                americanExpress.isEnabled=false            }
        
        else if (test(number: number, pattern: pattern[1])){
            visa.isEnabled=false
            masterCard.isEnabled=true
            maestro.isEnabled=false
            americanExpress.isEnabled=false
        }
        else if (test(number: number, pattern: pattern[2])){
            visa.isEnabled=false
            masterCard.isEnabled=false
            maestro.isEnabled=true
            americanExpress.isEnabled=false
        }
        
        else if (test(number: number, pattern: pattern[3])){
            visa.isEnabled=false
            masterCard.isEnabled=false
            maestro.isEnabled=false
            americanExpress.isEnabled=true
        }
        else{
            invalid.alphaValue=1
            visa.isEnabled=false
            masterCard.isEnabled=false
            maestro.isEnabled=false
            americanExpress.isEnabled=false
        }
        }
    }
}
extension NSBezierPath {
    
    public var cgPath: CGPath {
        let path = CGMutablePath()
        var points = [CGPoint](repeating: .zero, count: 3)
        
        for i in 0 ..< self.elementCount {
            let type = self.element(at: i, associatedPoints: &points)
            switch type {
            case .moveTo:
                path.move(to: points[0])
            case .lineTo:
                path.addLine(to: points[0])
            case .curveTo:
                path.addCurve(to: points[2], control1: points[0], control2: points[1])
            case .closePath:
                path.closeSubpath()
            @unknown default:
                fatalError()
            }
        }
        
        return path
    }
}
