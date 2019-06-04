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
    var calender1=false
    var calender2=false

    @IBAction func selectDate(_ sender: Any) {
        if(calender1==true){
        carVc.DateValue1.dateValue=calender.dateValue
        }
        if(calender2==true){
            carVc.DateValue2.dateValue=calender.dateValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
