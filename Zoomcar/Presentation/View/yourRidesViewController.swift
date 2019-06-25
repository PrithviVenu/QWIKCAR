//
//  yourRidesViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 24/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class yourRidesViewController: NSViewController,NSTableViewDelegate,NSTableViewDataSource{

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var completedView: NSView!
    @IBOutlet weak var upcomingView: NSView!
    @IBOutlet weak var heading: NSTextField!
    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var topBar: NSView!
    var bookingView:BookingView?
    override func viewDidLoad() {
        super.viewDidLoad()
        topBar.wantsLayer=true
//        topBar.layer?.backgroundColor=#colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2360582352, alpha: 1)
        
        topBar.layer?.backgroundColor=#colorLiteral(red: 0.1827290356, green: 0.1768707931, blue: 0.2360582352, alpha: 1)
        view.wantsLayer=true
        upcomingView.wantsLayer=true
        completedView.wantsLayer=true

        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.5)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.tableColumns[0].minWidth = 1150.0
        tableView.selectionHighlightStyle = .none
        view.layer?.backgroundColor=NSColor.white.cgColor
        upcomingView.layer?.backgroundColor=NSColor.white.cgColor
       
        heading.textColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.85)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 10
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        if(tableView==self.tableView){
          return  upcomingTable(tableColumn: tableColumn,row: row)
        }
        
        
        return nil
    }
    
    func upcomingTable(tableColumn: NSTableColumn?, row: Int)->NSView?{
        if (tableColumn?.identifier)!.rawValue == "defaultColumn"{
            let result:UpcomingBookingsTableCellView=tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! UpcomingBookingsTableCellView
            result.wantsLayer=true
            result.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.layer?.cornerRadius=6.0
            result.layer?.masksToBounds=false
            result.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.layer?.shadowOpacity=0.7
            result.layer?.masksToBounds=false
            
            result.topBar1.wantsLayer=true
            result.topBar1.layer?.backgroundColor=CGColor(red: 1.0 , green: 1.0, blue: 1.0, alpha: 1.0)
            result.topBar1.layer?.cornerRadius=2.0
            result.topBar1.layer?.masksToBounds=false
            result.topBar1.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
            result.topBar1.layer?.shadowOffset=CGSize(width: 0, height: 0)
            result.topBar1.layer?.shadowOpacity=0.7
            
            
            return result
            
        }
        return nil
    }
    
}
