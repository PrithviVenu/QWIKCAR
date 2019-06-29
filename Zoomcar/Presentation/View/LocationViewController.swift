//
//  LocationViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 16/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa
import MapKit
import CoreLocation
class LocationViewController: NSViewController,NSSearchFieldDelegate,CLLocationManagerDelegate{

    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var customView: NSView!
    @IBOutlet weak var searchBar: NSSearchField!
    var addressVC:AddressViewcontroller?
    static var pickupBranch:String?
    static var confirmationVC:ConfirmationViewController?
    static var presented = false
    let locationManager = CLLocationManager()
    var annotationTitle = ""
    @IBOutlet weak var selectLocation: NSTextField!
    
    @IBOutlet weak var locate: NSButton!
    
    @IBAction func locateMe(_ sender: Any) {
        locationManager.delegate = self
        
        if #available(OSX 10.14, *) {
            locationManager.requestLocation()
        }
        
        else {
            print("OS Version Incompatible")
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        else{
            print("Location Disabled")
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        myMapView.showsUserLocation=true
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: locValue, span: span)
        myMapView.setRegion(region, animated: true)
        let annotations = myMapView.annotations
        myMapView.removeAnnotations(annotations)
     
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
   
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemark, error) in
            if error != nil
            {
                print ("THERE WAS AN ERROR")
            }
            else
            {
                if let place = placemark?[0]
                {
                    let address = self.parseAddress(place: place)
                    self.searchBar.stringValue=address
                    self.setConfirmationAddress(address: address)
                    annotation.title=self.annotationTitle
                    annotation.subtitle=address
                    self.myMapView.addAnnotation(annotation)

                    
                }
            }
        }
        locationManager.stopUpdatingLocation();
    }
    func parseAddress(place:CLPlacemark) -> String {
        var addressString : String = ""
        if place.name != nil {
            addressString = addressString + place.name! + ", "
        }
        if place.thoroughfare != nil {
            addressString = addressString + place.thoroughfare! + ", "
        }
        
        if place.subThoroughfare != nil {
            addressString = addressString + place.subThoroughfare! + ","
        }
        if place.locality != nil {
            addressString = addressString + place.locality! + ", "
        }
        
        if place.subAdministrativeArea != nil {
            addressString = addressString + place.subAdministrativeArea! + ", "
        }
        
        if place.administrativeArea != nil {
            addressString = addressString + place.administrativeArea! + " - "
        }
        if place.postalCode != nil {
            addressString = addressString + place.postalCode! + ","
        }
        if place.country != nil {
            addressString = addressString + place.country!
        }
        
        return addressString
    }
    
    @IBAction func done(_ sender: Any) {
        dismiss(self)
    }
    
    
    @IBOutlet weak var done: NSButton!
    @IBOutlet weak var topBar: NSView!
    
    
    override func viewDidAppear() {
        LocationViewController.presented=true
    }
    
    override func viewDidDisappear() {
        
        LocationViewController.presented=false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let branch = CarViewController.branchTitle
        let deliveryBranchLocation = branch[branch.index(after: branch.firstIndex(of: "-")!)...]
        let pickupBranchLocation = LocationViewController.pickupBranch![LocationViewController.pickupBranch!.index(after: branch.firstIndex(of: "-")!)...]
        if(annotationTitle == "Pickup Location"){
         
            zoomIn(searchString: String(pickupBranchLocation))
            
        }
        else if(annotationTitle == "Delivery Location"){
         
            zoomIn(searchString: String(deliveryBranchLocation))
       
        }
        
        
        
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
    
    
    func zoomIn(searchString:String){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchString
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, error) in
            if response == nil
            {
                print("ERROR")
            }
            else
            {
               
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
         
                
                //Zooming in
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.myMapView.setRegion(region, animated: false)
            }
            
        }
        }
    
    func setConfirmationAddress(address:String){
        if(annotationTitle == "Pickup Location"){
            LocationViewController.confirmationVC!.pickupLocationValue.stringValue = address
            LocationViewController.confirmationVC!.pickupLocationValue.isSelectable=false

        }
        else if(annotationTitle == "Delivery Location"){
            LocationViewController.confirmationVC!.deliveryLocationValue.stringValue = address
            LocationViewController.confirmationVC!.deliveryLocationValue.isSelectable=false

        }
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
            if(annotationTitle=="Delivery Location"){
            addressVC!.searchString = searchBar.stringValue+" , "+branch[branch.index(after: branch.firstIndex(of: "-")!)...]
            }
            else if(annotationTitle == "Pickup Location"){
                addressVC!.searchString = searchBar.stringValue+" , "+LocationViewController.pickupBranch![LocationViewController.pickupBranch!.index(after: branch.firstIndex(of: "-")!)...]
            }
            if(AddressViewcontroller.presented == false && searchBar.stringValue != ""){
                self.present(addressVC!, asPopoverRelativeTo: searchBar.bounds, of: searchBar, preferredEdge: .maxY, behavior: .semitransient)
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AutoComplete"), object: nil)
            
        }
    }
}
