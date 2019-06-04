//
//  ViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 12/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var startDate: NSDatePicker!
    @IBOutlet weak var endDate: NSDatePicker!
    @IBOutlet weak var branch: NSPopUpButton!
    @IBAction func findAvailableCars(_ sender: Any) {
       
        let bookingView:BookingView=BookingView(DateValue1:startDate.dateValue,DateValue2: endDate.dateValue)
        let selectedItem = branch.titleOfSelectedItem!
        var map = [String:[String]]()
        let branch = String(selectedItem[..<selectedItem.firstIndex(of: "-")!])
        map["Branch_Id"]=[branch]
        let (car,noOfDays) = bookingView.viewCar(map: map)
        if(car != nil){
            CarViewController.cars = car!.sorted(by: { $0.gettotalAmt > $1.gettotalAmt })
           }
        else{
            CarViewController.cars = []

        }
            if(noOfDays != nil){
                CarViewController.noOfDays=noOfDays!
            }
            CarViewController.branch=branch
            CarViewController.map=map
          
            let home = self.parent as? HomeViewController
            home?.carVC(bookingView:bookingView)
            
//            if let mainWC = view.window?.windowController as? MainWindowController {
//                mainWC.moveToCarBookingVC()
//            }
  
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        branch.removeAllItems()
         let bookingView:BookingView=BookingView(DateValue1:startDate.dateValue,DateValue2: endDate.dateValue)
        let branches:[String]=bookingView.getBranches()
        branch.addItems(withTitles: branches)
        branch.selectItem(at: branch.indexOfSelectedItem)
        self.view.wantsLayer=true
        self.view.layer?.backgroundColor=CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.6)
        
    }
  

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

