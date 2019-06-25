//
//  CarViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 24/04/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class CarViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {

    @IBOutlet weak var DateValue2: NSDatePicker!
    @IBOutlet weak var DateValue1: NSDatePicker!
    @IBOutlet weak var end: NSTextField!
    @IBOutlet weak var start: NSTextField!
    @IBOutlet weak var availability: NSTextField!
    @IBOutlet weak var filter: NSButton!
    @IBOutlet weak var priceDesc: CustomButton!
    @IBOutlet weak var sortBar: NSView!
    @IBOutlet weak var topBar: NSView!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var priceAsc: CustomButton!
    @IBOutlet weak var rating: CustomButton!
  
    @IBOutlet weak var freeDistance: CustomButton!
    
    static var map = [String:[String]]()
    static var cars = [Car]()
    static var noOfDays = 1
    static var branch = ""
    var selectedIndex = -1
    var isCollapsed = true
    var bookingView:BookingView?
    static var maxPrice:Int?
    static var price:Int?
    static var branchTitle=""
    static var sortOrder:String?
    @IBAction func findCars(_ sender: Any) {
        bookingView?.startDateValue=DateValue1.dateValue
        bookingView?.endDateValue=DateValue2.dateValue

        CarViewController.map["Branch_Id"]=[CarViewController.branch]
        if(bookingView != nil){
        let (car,noOfDays) = bookingView!.viewCar(map: CarViewController.map)
            if(noOfDays != nil){
                CarViewController.noOfDays=noOfDays!
            }
        if(car != nil){
            CarViewController.cars = car!.sorted(by: { $0.gettotalAmt > $1.gettotalAmt })
            CarViewController.maxPrice=CarViewController.cars[0].gettotalAmt
        }
        else{
            CarViewController.cars = []
            
        }
        }
        if(CarViewController.price != nil && bookingView != nil){
            CarViewController.cars=(bookingView!.viewCarWithMaxPrice(maxPrice: CarViewController.price!))
            availability.alphaValue=0

        }
        if(CarViewController.cars.count==0){
            availability.alphaValue=1
        }
        sort()
        tableView.reloadData()
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier=="FilterSegue"{
            print(CarViewController.map)
            let vc = segue.destinationController as! FilterViewController
            vc.map = CarViewController.map
            vc.carVC = self
            
        }
        if segue.identifier=="calender1"{
            let vc = segue.destinationController as! CalenderViewController
            vc.carVc = self
            vc.calender1=true
            vc.calender2=false

        }
        if segue.identifier=="calender2"{
            let vc = segue.destinationController as! CalenderViewController
            vc.carVc = self
            vc.calender1=false
            vc.calender2=true
            
        }
    }
    
    @IBAction func filter(_ sender: Any) {
        performSegue(withIdentifier: "FilterSegue", sender: self)
    }
    
    func filterResponder()
    {
        if bookingView != nil{
            let (carlist,days)=bookingView!.viewCar(map: CarViewController.map)
            if(carlist != nil)
            {
                CarViewController.cars=carlist!
                if(days != nil)
                {
                    availability.alphaValue=0
                    CarViewController.noOfDays=days!
                }
            }
            else{
                availability.alphaValue=1
               CarViewController.cars=[]
            }
        }
        if(CarViewController.price != nil && bookingView != nil){
            CarViewController.cars=(bookingView!.viewCarWithMaxPrice(maxPrice: CarViewController.price!))
            availability.alphaValue=0
            if(CarViewController.cars.count==0){
            availability.alphaValue=1
            }

        }
        sort()
        tableView.reloadData()
    }
    
    func sort(){
        if priceDesc.isChecked{
            CarViewController.cars=CarViewController.cars.sorted(by: { $0.gettotalAmt > $1.gettotalAmt })
        }
        if priceAsc.isChecked{
             CarViewController.cars=CarViewController.cars.sorted(by: { $0.gettotalAmt < $1.gettotalAmt })
        }
        if rating.isChecked{
             CarViewController.cars=CarViewController.cars.sorted(by: { $0.getRating > $1.getRating })
        }
        if freeDistance.isChecked{
            CarViewController.cars=CarViewController.cars.sorted(by: { $0.freeKm > $1.freeKm })
        }
    }
    
    
    @IBAction func freeDist(_ sender: Any) {
        sortAppearance()
        freeDistance.isChecked = true
        freeDistance.setText(text: "Free Kms: High to Low", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        freeDistance.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
        CarViewController.cars=CarViewController.cars.sorted(by: { $0.freeKm > $1.freeKm })
        CarViewController.sortOrder="freeDistance"
        tableView.reloadData()
    }
    
    
    @IBAction func priceDesc(_ sender: Any) {
        sortAppearance()
        priceDesc.isChecked = true
        priceDesc.setText(text: "Price: High to Low", color:#colorLiteral(red: 0.1450980392, green: 0.6, blue: 0.5843137255, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        priceDesc.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
        CarViewController.cars=CarViewController.cars.sorted(by: { $0.gettotalAmt > $1.gettotalAmt })
        CarViewController.sortOrder="priceDesc"
        tableView.reloadData()
    }
  
    func moveToConfirmationPage(row:Int){
        ConfirmationViewController.car=CarViewController.cars[row]
        ConfirmationViewController.carVC=self
        ConfirmationViewController.startDate=DateValidator.dateFormattedOutputString(date: DateValue1.dateValue)
        ConfirmationViewController.endDate=DateValidator.dateFormattedOutputString(date: DateValue2.dateValue)
        ConfirmationViewController.noOfDays=CarViewController.noOfDays
        let home = self.parent as? HomeViewController
        home?.confirmationVC(bookingView: bookingView!)
        
    }
    
    
    
    
    
    func  sortAppearance(){
     priceDesc.setText(text: "Price: High to Low", color: .black, font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
     priceDesc.layer?.shadowOpacity=0
     priceAsc.setText(text: "Price: Low to High", color: .black, font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
     priceAsc.layer?.shadowOpacity=0
     rating.setText(text: "Rating", color: .black, font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        rating.layer?.shadowOpacity=0

        freeDistance.setText(text: "Free Kms: High to Low", color: .black, font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        freeDistance.layer?.shadowOpacity=0
        priceDesc.isChecked = false
        priceAsc.isChecked=false
        rating.isChecked=false
        freeDistance.isChecked=false

    }
    
    @IBAction func priceAsc(_ sender: Any) {
        sortAppearance()
        priceAsc.isChecked = true
        priceAsc.setText(text: "Price: Low to High", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        priceAsc.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
        CarViewController.cars=CarViewController.cars.sorted(by: { $0.gettotalAmt < $1.gettotalAmt })
        CarViewController.sortOrder="priceAsc"
        tableView.reloadData()
    }
    @IBAction func Rating(_ sender: Any) {
        sortAppearance()
        rating.isChecked = true
        rating.setText(text: "Rating", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        rating.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
        CarViewController.cars=CarViewController.cars.sorted(by: { $0.getRating > $1.getRating })
        CarViewController.sortOrder="rating"
        tableView.reloadData()

    }

    @IBAction func startDateClicked(_ sender: Any) {
        startdateClicked()
    }
    
    func startdateClicked(){
        DateValue2.minDate=DateValue1.dateValue.addingTimeInterval(TimeInterval(1.days))
        DateValue2.maxDate=DateValue1.dateValue.addingTimeInterval(TimeInterval(180.days))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        topBar.wantsLayer=true
        topBar.layer?.backgroundColor=#colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2360582352, alpha: 1)
        sortBar.wantsLayer = true
        sortBar.shadow = NSShadow()
        sortBar.layer?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        sortBar.layer?.shadowColor=NSColor.black.cgColor
        sortBar.layer?.shadowOffset=NSMakeSize(0, 0)
        sortBar.layer?.shadowOpacity=1
        sortBar.layer?.shadowRadius = 0.4
        priceAsc.wantsLayer=true
        priceDesc.wantsLayer=true
        rating.wantsLayer=true
        freeDistance.wantsLayer=true
        start.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.8)
        end.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.8)
        if(CarViewController.cars.count != 0){
        availability.alphaValue=0
        }
        if(CarViewController.sortOrder == nil){
        priceDesc.setText(text: "Price: High to Low", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        priceDesc.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
        priceDesc.isChecked=true
        }
        else{
            if CarViewController.sortOrder == "priceDesc"{
                sortAppearance()
                priceDesc.setText(text: "Price: High to Low", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
                priceDesc.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
                priceDesc.isChecked=true
            }
          if CarViewController.sortOrder == "priceAsc"{
            sortAppearance()
            priceAsc.setText(text: "Price: High to Low", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
            priceAsc.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
            priceAsc.isChecked=true
            }
            if CarViewController.sortOrder == "rating"{
                sortAppearance()
                rating.setText(text: "Price: High to Low", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
                rating.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
                rating.isChecked=true
            }
            if CarViewController.sortOrder == "freeDistance"{
                sortAppearance()
                freeDistance.setText(text: "Price: High to Low", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
                freeDistance.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 1.0)
                freeDistance.isChecked=true
            }
            sort()
        }
        filter.setText(text: "Filter", color: #colorLiteral(red: 0.007990235463, green: 0.4776581526, blue: 1, alpha: 1), font: NSFont.systemFont(ofSize: 13.0), alignment: nil)

//        topBar.setGradientBackground(colorOne: #colorLiteral(red: 0.3697789311, green: 0.2959914804, blue: 0.486571908, alpha: 1), colorTwo: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        if(bookingView != nil){
        DateValue1.dateValue=bookingView!.startDateValue
        DateValue2.dateValue=bookingView!.endDateValue
            let (date1,date2)=DateValidator.setDates()
            DateValue1.minDate=date1
            DateValue1.maxDate=date1.addingTimeInterval(TimeInterval(90.days))
            DateValue2.minDate=date2
            DateValue2.maxDate=DateValue1.dateValue.addingTimeInterval(TimeInterval(180.days))
        }
        
//        pickupCity.appearance=NSAppearance(named: .aqua)
//        pickupCity.removeAllItems()
//        let branches=bookingView?.getBranches()
//        if(branches != nil){
//        pickupCity.addItems(withTitles: branches!)
//        }
//        pickupCity.selectItem(withTitle:CarViewController.branchTitle)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.selectionHighlightStyle = .none
        tableView.backgroundColor = .clear
        tableView.tableColumns[0].minWidth = 1150.0
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return CarViewController.cars.count
    
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        if self.selectedIndex == row && isCollapsed == true{
            return 480
        }
        else{
            return 285
        }
    }
 

    
    func viewCarDetails(row:Int){
        if selectedIndex==row{
            if self.isCollapsed == false{
                self.isCollapsed=true
            }
            else{
                self.isCollapsed = false
            }
            
        }
        else{
            self.isCollapsed = true
        }
        self.selectedIndex=row
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        if (tableColumn?.identifier)!.rawValue == "AutomaticTableColumnIdentifier.0"{
        let result:KSTableCellView=tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! KSTableCellView
            result.carVC=self
            result.wantsLayer=true
            result.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            let car = CarViewController.cars[row]
            result.layer?.cornerRadius=12.0
            result.layer?.masksToBounds=false
            result.layer?.shadowColor=NSColor.black.withAlphaComponent(0.5).cgColor
            result.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.layer?.shadowOpacity=0.8
            result.layer?.masksToBounds=false

            result.booking.wantsLayer=true
            result.booking.layer?.cornerRadius=10.0
            result.booking.layer?.shadowColor=#colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1).withAlphaComponent(0.7).cgColor
            result.booking.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.booking.layer?.shadowOpacity=0.9
            result.booking.setText(text: "  BOOK NOW", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
            result.rating.textColor = .white
            result.rating.wantsLayer=true
            result.rating.layer?.cornerRadius=4
            result.rating.layer?.backgroundColor = #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1)
            result.rating.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.rating.layer?.shadowOpacity=0.9
            
            result.carDetailsTab.wantsLayer=true
            result.carDetailsTab.layer?.backgroundColor=NSColor.white.cgColor
            result.fareSummaryTab.wantsLayer=true
            result.fareSummaryTab.layer?.backgroundColor=NSColor.white.cgColor
           
           
            
            if self.selectedIndex == row && isCollapsed == true{
                result.carDetails.stringValue="Know Less ▲"
                result.tabView.isHidden=false
                
            }
            else{
                result.carDetails.stringValue="Know More ▼"
                result.tabView.isHidden=true
            }
            
        let decodedData = Data(base64Encoded: car.carImage, options: .ignoreUnknownCharacters)!
        let decodedimage:NSImage = NSImage(data: decodedData)!
        result.booking.tag=row
        result.carDetail.tag=row
        result.carImage.image=decodedimage
        result.carName.stringValue=car.carName
        result.carGroup.stringValue=car.carGroup
        result.transmission.stringValue=car.transmission
        result.additionalKms.stringValue=String(car.additionalKmFee)
        result.rating.stringValue=String(car.getRating)+"/5"
        result.noOfSeats.stringValue=String(car.noOfSeats)
        result.noOfBags.stringValue=String(car.noOfbags)
        result.freeKm.stringValue=String(car.freeKm)+" Kms"
        result.freeKms.stringValue="First "+String(car.freeKm)+" Kms"
        result.additionalKm.stringValue=String(car.additionalKmFee)
        result.fuelType.stringValue=String(car.fuelType)
        result.baseFare.stringValue=String(car.getbaseFare)
        result.surCharges.stringValue=String(car.getsurCharge)
        result.totalAmount.stringValue=String(car.gettotalAmt)
        result.totalAmt.stringValue=String(car.gettotalAmt)


        
        return result
        
        }
        return nil
    }
    
}


