//
//  AddressViewcontroller.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 16/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa
import MapKit
class AddressViewcontroller: NSViewController, NSTableViewDelegate, NSTableViewDataSource, MKLocalSearchCompleterDelegate {
    
    static var presented = false
    var delegate:LocationViewController?
    var searchString:String?
    var annotationTitle=""
    @IBOutlet weak var tableView: NSTableView!
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAutoComplete), name: NSNotification.Name(rawValue: "AutoComplete"), object: nil)
        searchCompleter.delegate = self
        tableView.refusesFirstResponder = true
        tableView.delegate=self
        tableView.dataSource=self
    }
    override func viewDidAppear() {
        AddressViewcontroller.presented=true
    }
    
    override func viewWillAppear() {
        searchResults.removeAll()
        tableView.reloadData()
    }
    
    
    override func viewDidDisappear() {
        
        AddressViewcontroller.presented=false
    }
    
    
    @objc func notificationAutoComplete() {
        
        searchCompleter.queryFragment = searchString!
    

    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        tableView.reloadData()
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return searchResults.count
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let table = notification.object as? NSTableView else {
            return
        }
        let row = table.selectedRow
        let searchResult = searchResults[row]
        delegate?.searchBar.stringValue=searchResult.title+searchResult.subtitle
        delegate?.setConfirmationAddress(address: searchResult.title+searchResult.subtitle)
        dismiss(self)
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchString!
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, error) in
            if response == nil
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
                let annotations = self.delegate!.myMapView.annotations
                self.delegate!.myMapView.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.annotationTitle
                annotation.subtitle = self.delegate!.searchBar.stringValue
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.delegate!.myMapView.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.delegate!.myMapView.setRegion(region, animated: true)
            }
            
        }
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        let searchResult = searchResults[row]
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self)as! ASTableCellView
        cell.detail.attributedStringValue = highlightedText(searchResult.title+"\n"+searchResult.subtitle, inRanges: searchResult.titleHighlightRanges, size: 13.0)
        return cell
    }
    
    
    func highlightedText(_ text: String, inRanges ranges: [NSValue], size: CGFloat) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: text)
        let regular = NSFont.systemFont(ofSize: size)
        attributedText.addAttribute(NSAttributedString.Key.font, value:regular, range:NSMakeRange(0, text.count))
        
        let bold = NSFont.boldSystemFont(ofSize: size)
        for value in ranges {
            attributedText.addAttribute(NSAttributedString.Key.font, value:bold, range:value.rangeValue)
        }
        return attributedText
    }
}
