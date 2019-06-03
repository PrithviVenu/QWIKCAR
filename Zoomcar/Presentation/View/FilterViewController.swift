//
//  FilterViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 28/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa


class FilterViewController: NSViewController {
    var map = [String:[String]]()
    var carGroup=[String]()
    var fuelType=[String]()
    var transmission=[String]()
    var carVC = CarViewController()
    
    @IBOutlet weak var seats: NSPopUpButton!
    @IBAction func Cancel(_ sender: Any) {
        dismiss(self)
      
        //    case 3:
        //    print("Enter a Car Model")
        //    let carModel:String = readLine()!
        //    map["Car_Model"]=carModel
        //    print("Enter a option to add a new filter or press 7 to continue Search")
        //
        //    case 4:
        //    print("Enter Fuel Type")
        //    let fuelType:String=readLine()!
        //    map["Fuel_Type"]=fuelType
        //    print("Enter a option to add a new filter or press 7 to continue Search")
        //
        //    case 5:
        //    print("Enter a Transmission")
        //    let transmission = readLine()!
        //    map["Transmission"] = transmission
        //    print("Enter a option to add a new filter or press 7 to continue Search")
        
    }
    @IBAction func Apply(_ sender: Any) {
        map.removeAll()
        map["Branch_Id"]=[CarViewController.branch]
        filterSelection()
     
        if(transmission.count>0){
        map["Transmission"] = transmission
        }
        
        if(carGroup.count>0){
            map["Car_Group"] = carGroup
        }
        
        if(fuelType.count>0){
            map["Fuel_Type"] = fuelType
        }
        let seat = seats.titleOfSelectedItem
        if(seat != nil && NoOfSeats.state == .on){
            
            map["no_of_seats"] = [seat!]

        }
        CarViewController.map=map
        carVC.filterResponder()
        dismiss(self)
    }
    
    
    func filterSelection(){
        if Automatic.isChecked{
            transmission.append("Automatic")
        }
        if Manual.isChecked{
            transmission.append("Manual")
        }
        if Hatchback.isChecked{
            carGroup.append("Hatchback")
        }
        if Sedan.isChecked{
            carGroup.append("Sedan")
        }
        if SUV.isChecked{
            carGroup.append("SUV")
        }
        if luxury.isChecked{
            carGroup.append("Luxury")
        }
        if Petrol.state == .on{
           fuelType.append("Petrol")
        }
        if Diesel.state == .on{
            fuelType.append("Diesel")
        }
    }

    @IBOutlet weak var luxury: CustomButton!
    @IBOutlet weak var SUV: CustomButton!
    @IBOutlet weak var Sedan: CustomButton!
    @IBOutlet weak var Hatchback: CustomButton!
    @IBOutlet weak var Manual: CustomButton!
    @IBOutlet weak var Automatic: CustomButton!
    @IBOutlet weak var Diesel: NSButton!
    @IBOutlet weak var Petrol: NSButton!
    @IBOutlet weak var NoOfSeats: NSButton!
    @IBAction func Automatic(_ sender: Any) {
        Automatic.check(text: "Automatic", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)

    }
    
    @IBAction func Manual(_ sender: Any) {
        Manual.check(text: "Manual", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
    }
    
    @IBAction func Hatchback(_ sender: Any) {
        
        Hatchback.check(text: "Hatchback", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
    }
    
    @IBAction func Sedan(_ sender: Any) {
        Sedan.check(text: "Sedan", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)

    }
    
    
    @IBAction func SUV(_ sender: Any) {
        SUV.check(text: "SUV", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)

    }
    
    
    @IBAction func Luxury(_ sender: Any) {
        luxury.check(text: "Luxury", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setState()
        self.view.wantsLayer=true
        self.view.layer?.backgroundColor = .white
        seats.removeAllItems()
        let bookingView = BookingView()
        var seat:[String]=bookingView.getSeaterTypes()
        seat.sort(by:{ $0 < $1 })
        seats.addItems(withTitles: seat)
        if(map.keys.contains("no_of_seats")){
            NoOfSeats.state = .on
            seats.selectItem(withTitle: map["no_of_seats"]![0])
        }
    }
    
    
    
    func setState()
    {
        var filters = [String]()
        for (values)in map.values{
            for(value) in values{
                filters.append(value)
            }
        }
        if(filters.contains("Automatic"))
        {
            Automatic.check(text: "Automatic", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
        }
        if(filters.contains("Manual"))
        {
            Manual.check(text: "Manual", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
        }
        if(filters.contains("Hatchback"))
        {
            Hatchback.check(text: "Hatchback", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
        }
        if(filters.contains("Sedan"))
        {
              Sedan.check(text: "Sedan", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
        }
        if(filters.contains("SUV"))
        {
           SUV.check(text: "SUV", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
        }
        if(filters.contains("Luxury"))
        {
             luxury.check(text: "Luxury", color1: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.6604555557, alpha: 1), color2:.black,font: NSFont.systemFont(ofSize: 13.0),alignment: .center)
        }
        if(filters.contains("Petrol"))
        {
           Petrol.state = .on
        }
        if(filters.contains("Diesel"))
        {
            Diesel.state = .on

        }
      
        
    }
}
