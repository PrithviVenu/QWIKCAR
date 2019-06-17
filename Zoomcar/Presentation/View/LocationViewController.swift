//
//  LocationViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 16/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa
import MapKit
class LocationViewController: NSViewController,NSSearchFieldDelegate{

    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var customView: NSView!
    @IBOutlet weak var searchBar: NSSearchField!
    var addressVC:AddressViewcontroller?
    var annotationTitle = ""
    @IBOutlet weak var selectLocation: NSTextField!
    
    @IBOutlet weak var locate: NSButton!
    
    @IBAction func done(_ sender: Any) {
        dismiss(self)
    }
    
    
    @IBOutlet weak var done: NSButton!
    @IBOutlet weak var topBar: NSView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        topBar.wantsLayer=true
        topBar.layer?.backgroundColor=#colorLiteral(red: 0.06694766134, green: 0.7282025218, blue: 0.7311937213, alpha: 1)
        customView.wantsLayer=true
        customView.layer?.backgroundColor = .white
        selectLocation.textColor = .white
        locate.wantsLayer=true
        locate.wantsLayer=true
        done.setText(text: "Done", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 15.0),alignment: nil)
        locate.setText(text: "Locate Me", color: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), font: NSFont.systemFont(ofSize: 13.0),alignment: nil)
        locate.shadow(cornerRadius: 10.0, shadowColor: #colorLiteral(red: 0.1451402307, green: 0.6009233594, blue: 0.583301127, alpha: 1), shadowOpacity: 0.3)
        searchBar.delegate=self
    }
    
    
    func controlTextDidChange(_ obj: Notification){
        let searchObject:NSSearchField? = obj.object as? NSSearchField
        if searchObject==self.searchBar{
            if(addressVC == nil){
                addressVC=storyboard?.instantiateController(withIdentifier: "addressVC") as? AddressViewcontroller
            }
            if(searchBar.stringValue == "" && AddressViewcontroller.presented == true){
                dismiss(addressVC!)
            }
            let branch = CarViewController.branchTitle
            addressVC!.delegate=self
            addressVC!.annotationTitle = self.annotationTitle
            addressVC!.searchString = searchBar.stringValue+" , "+branch[branch.index(after: branch.firstIndex(of: "-")!)...]
        
            if(AddressViewcontroller.presented == false && searchBar.stringValue != ""){
                self.present(addressVC!, asPopoverRelativeTo: searchBar.bounds, of: searchBar, preferredEdge: .maxY, behavior: .semitransient)
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AutoComplete"), object: nil)
            
        }
    }
}
