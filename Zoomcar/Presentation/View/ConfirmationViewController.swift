//
//  ConfirmationViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 06/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class FPClipView: NSClipView {
    override var isFlipped: Bool {
        return true
    }
}

class ConfirmationViewController: NSViewController {
    
   static var car:Car?
   static var startDate=""
   static var endDate:String=""
   static var noOfDays:Int?
  
    lazy var doc: NSView = {
        let view = NSView()
        view.wantsLayer = true
        return view
    }()
    lazy var bookingDetailsScrollView: NSScrollView = {
        let scrollView = NSScrollView()
        scrollView.contentView = FPClipView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.borderType = .noBorder
        scrollView.drawsBackground = true
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        
        let documentView = doc
        documentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.documentView = documentView
        NSLayoutConstraint(item: documentView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: documentView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        return scrollView
    }()
    
    lazy var bookingDetailsView: NSView = {
        let view: NSView = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer=true
        view.layer?.backgroundColor = .white
        view.layer?.cornerRadius=6.0
        view.layer?.masksToBounds=false
        view.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        view.layer?.shadowOffset=CGSize(width: 0, height: 0)
        view.layer?.shadowOpacity=0.7
        return view
    }()
    
    lazy var invoiceView: NSView = {
        let view: NSView = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsLayer=true
        view.layer?.backgroundColor = .white
        view.layer?.cornerRadius=6.0
        view.layer?.masksToBounds=false
        view.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        view.layer?.shadowOffset=CGSize(width: 0, height: 0)
        view.layer?.shadowOpacity=0.7
        return view
    }()
    lazy var tabView: NSTabView = {
        let view = getTabView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func loadView() {
        self.view = NSView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bookingDetailsScrollView)
        tabView.appearance = NSAppearance(named: NSAppearance.Name.vibrantDark)
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsScrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        doc.addSubview(bookingDetailsView)
        NSLayoutConstraint(item: bookingDetailsView, attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 80.0).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 28).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 935).isActive = true
        NSLayoutConstraint(item: bookingDetailsView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 260).isActive = true

        doc.addSubview(tabView)
        NSLayoutConstraint(item: tabView, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .bottom, multiplier: 1.0, constant: 100.0).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 935).isActive = true
        NSLayoutConstraint(item: tabView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 450).isActive = true
        
        doc.addSubview(invoiceView)
        NSLayoutConstraint(item: invoiceView, attribute: .top, relatedBy: .equal, toItem: bookingDetailsView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .bottom, relatedBy: .equal, toItem: tabView, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .leading, relatedBy: .equal, toItem: bookingDetailsView, attribute: .trailing, multiplier: 1.0, constant: 50).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .trailing, relatedBy: .equal, toItem: doc, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 350).isActive = true
        NSLayoutConstraint(item: invoiceView, attribute: .bottom, relatedBy: .equal, toItem: doc, attribute: .bottom, multiplier: 1.0, constant: -50).isActive = true
        
        
        
        
        
    }
    
    
    
    private func getTabView()->NSTabView
    {
        let tabView=NSTabView()
        tabView.translatesAutoresizingMaskIntoConstraints=false
        let  bookingDetailItem=NSTabViewItem()
        bookingDetailItem.label="Booking Details"
        let  instructions=NSTabViewItem()
        instructions.label="IMPORTANT POINTS TO REMEMBER"
        
        let view1 = NSView()
        view1.wantsLayer=true
        bookingDetailItem.view = view1
        view1.layer?.backgroundColor = .white
        view1.layer?.cornerRadius=6.0
        view1.layer?.masksToBounds=false
        view1.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        view1.layer?.shadowOffset=CGSize(width: 0, height: 0)
        view1.layer?.shadowOpacity=0.7
        let view2 = NSView()
        view2.wantsLayer=true
        view2.layer?.backgroundColor = .white
        view2.layer?.cornerRadius=6.0
        view2.layer?.masksToBounds=false
        view2.layer?.shadowColor=NSColor.black.withAlphaComponent(0.4).cgColor
        view2.layer?.shadowOffset=CGSize(width: 0, height: 0)
        view2.layer?.shadowOpacity=0.7
        instructions.view = view2
        tabView.addTabViewItem(bookingDetailItem)
        tabView.addTabViewItem(instructions)
        
        return tabView
    }
    
    
    private func createBoldLabel(for label: NSTextField){
        label.font = NSFont(name: label.font!.fontName, size: 20)
        label.drawsBackground = false
        label.isBezeled = false
        label.isEditable = false
        label.isSelectable = false
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}
