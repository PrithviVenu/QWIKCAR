//
//  CalenderViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 04/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class CalenderViewController: NSViewController {

    @IBOutlet weak var calender: NSDatePicker!
    var carVc = CarViewController()
    var VC = ViewController()

    var calender1=false
    var calender2=false
    var calender3=false
    var calender4=false

    var date1=Date()
    var date2=Date()

    @IBAction func selectDate(_ sender: Any) {
        if(calender1==true){

        carVc.DateValue1.dateValue=calender.dateValue
        carVc.startdateClicked()
        }
        if(calender2==true){

            carVc.DateValue2.dateValue=calender.dateValue
        }
        
        if(calender3==true){
            
            VC.startDate.dateValue=calender.dateValue
            VC.startDateClick()
        }
        if(calender4==true){
            
            VC.endDate.dateValue=calender.dateValue

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if(calender1==true){
            calender.dateValue=carVc.DateValue1.dateValue
            calender.minDate=carVc.DateValue1.minDate
            calender.maxDate=carVc.DateValue1.maxDate
        }
        if(calender2==true){

            calender.dateValue=carVc.DateValue2.dateValue
            calender.minDate=carVc.DateValue2.minDate
            calender.maxDate=carVc.DateValue2.maxDate
        }
        
        if(calender3==true){
            calender.dateValue=VC.startDate.dateValue
            calender.minDate=VC.startDate.minDate
            calender.maxDate=VC.startDate.maxDate
            
        }
        if(calender4==true){
            calender.dateValue=VC.endDate.dateValue
            calender.minDate=VC.endDate.minDate
            calender.maxDate=VC.endDate.maxDate
            
        }
      
    }
    
}
