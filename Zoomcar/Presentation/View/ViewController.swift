//
//  ViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 12/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pickupBranch: NSPopUpButton!
    @IBOutlet weak var startDate: NSDatePicker!
    @IBOutlet weak var endDate: NSDatePicker!
    @IBOutlet weak var branch: NSPopUpButton!
    
    var home:HomeViewController?
    
    @IBAction func findAvailableCars(_ sender: Any) {
        CarViewController.vc=self
        
              find()
        
//            if let mainWC = view.window?.windowController as? MainWindowController {
//                mainWC.moveToCarBookingVC()
//            }
        
     
    }
    
    
    func find(){
        let bookingView:BookingView=BookingView(DateValue1:startDate.dateValue,DateValue2: endDate.dateValue)
        let selectedItem = branch.titleOfSelectedItem!
        var map = CarViewController.map
        let branch = String(selectedItem[..<selectedItem.firstIndex(of: "-")!])
        map["Branch_Id"]=[branch]
        let (car,noOfDays) = bookingView.viewCar(map: map)
        if(noOfDays != nil){
            CarViewController.noOfDays=noOfDays!
        }
        if(car != nil){
            CarViewController.cars = car!.sorted(by: { $0.gettotalAmt > $1.gettotalAmt })
        }
        else{
            CarViewController.cars = []
            
        }
        LocationViewController.pickupBranch=pickupBranch.titleOfSelectedItem!
        CarViewController.branch=branch
        CarViewController.branchTitle=selectedItem
        CarViewController.map["Branch_Id"]=map["Branch_Id"]
        
        
        if(CarViewController.price != nil ){
            CarViewController.cars=(bookingView.viewCarWithMaxPrice(maxPrice: CarViewController.price!))
            
        }
        
        home?.carVC(bookingView:bookingView)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
 
        if segue.identifier=="calender3"{
            let vc = segue.destinationController as! CalenderViewController
            vc.VC = self
            vc.calender1=false
            vc.calender2=false
            vc.calender3=true
            vc.calender4=false

            
        }
        if segue.identifier=="calender4"{
            let vc = segue.destinationController as! CalenderViewController
            vc.VC = self
            vc.calender1=false
            vc.calender2=false
            vc.calender3=false
            vc.calender4=true
            
            
        }
    }
    
    @IBAction func startDateClicked(_ sender: Any) {
        startDateClick()
    }
    
    func startDateClick(){
        endDate.minDate=startDate.dateValue.addingTimeInterval(TimeInterval(1.days))
        endDate.maxDate=startDate.dateValue.addingTimeInterval(TimeInterval(180.days))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        branch.removeAllItems()
        pickupBranch.removeAllItems()
         let bookingView:BookingView=BookingView(DateValue1:startDate.dateValue,DateValue2: endDate.dateValue)
        let branches=bookingView.getBranches()
        branch.addItems(withTitles: branches)
        pickupBranch.addItems(withTitles: branches)
//        self.view.wantsLayer=true
//        self.view.layer?.backgroundColor=NSColor.white.cgColor
        let (date1,date2)=DateValidator.setDates()
        startDate.minDate=date1
        startDate.maxDate=date1.addingTimeInterval(TimeInterval(90.days))
        endDate.minDate=date2
        endDate.maxDate=startDate.dateValue.addingTimeInterval(TimeInterval(180.days))
        

    }
  

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

