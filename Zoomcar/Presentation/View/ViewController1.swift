//
//  ViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 30/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class ViewController1: NSViewController {
    
    
    var homevc:HomeViewController?
    
    lazy var doc: NSView = {
        let view = NSView()
        view.wantsLayer = true
        return view
    } ()
    
    
    lazy var scrollView: NSScrollView = {
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
    
    lazy var headingLabel: NSTextField = {
        let startDateLabel = NSTextField(labelWithString: "SELF DRIVE CAR RENTALS")
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.font=NSFont.systemFont(ofSize: 45.0)
        startDateLabel.textColor = #colorLiteral(red: 0.08690329641, green: 0.7201908231, blue: 0.7232715487, alpha: 1)
        return startDateLabel
    }()
    
    lazy var howItWorks: NSTextField = {
        let startDateLabel = NSTextField(labelWithString: "SELF DRIVE CAR RENTALS")
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        startDateLabel.font=NSFont.systemFont(ofSize: 45.0)
        startDateLabel.textColor = #colorLiteral(red: 0.08690329641, green: 0.7201908231, blue: 0.7232715487, alpha: 1)
        return startDateLabel
    }()
    
    
    lazy var cardHeadingLabel: NSTextField = {
        let deliveryLocationLabel = NSTextField(labelWithString: "BOOK YOUR CAR")
        deliveryLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        deliveryLocationLabel.font=NSFont.systemFont(ofSize: 16.0)
        deliveryLocationLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return deliveryLocationLabel
    }()
    
    lazy var cardView: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.layer?.cornerRadius=6.0
        view1.layer?.masksToBounds=false
        view1.layer?.shadowColor = #colorLiteral(red: 0.08690329641, green: 0.7201908231, blue: 0.7232715487, alpha: 1)
        view1.layer?.shadowOffset=CGSize(width: 0, height: 0)
        view1.layer?.shadowOpacity=0.4
        return view1
    }()

    
    lazy var topBar: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.backgroundColor = #colorLiteral(red: 0.2020240128, green: 0.2553693652, blue: 0.311000526, alpha: 1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    
    lazy var cardTopBar: NSView = {
        let view1 = NSView()
        view1.wantsLayer=true
        view1.layer?.backgroundColor = #colorLiteral(red: 0.08690329641, green: 0.7201908231, blue: 0.7232715487, alpha: 1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        return view1
    }()
    

    
 
    lazy var containerView: NSView = {
        let containerView = NSView()
        containerView.wantsLayer=true
        containerView.layer?.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let controller = homevc!.storyboard!.instantiateController(withIdentifier: "card") as! ViewController
        
        controller.home=homevc!
        addChild(controller )
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(controller.view)
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])

        return containerView
    }()
    
    override func loadView() {
        self.view = NSView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(scrollView)
        
        setUp()
      
        self.view.wantsLayer=true
        self.view.layer?.backgroundColor=NSColor.white.cgColor
     
        
        
    }
    
    func setUp(){
        NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        
        

        doc.addSubview(topBar)
        doc.addSubview(headingLabel)
        doc.addSubview(cardView)
        doc.addSubview(cardTopBar)
        doc.addSubview(cardHeadingLabel)
        doc.addSubview(containerView)


        
        NSLayoutConstraint(item: topBar, attribute: .top, relatedBy: .equal, toItem: doc, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .leading, relatedBy: .equal, toItem: doc, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 57).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .trailing, relatedBy: .equal, toItem: doc, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: topBar, attribute: .bottom, relatedBy: .equal, toItem: doc, attribute: .bottom, multiplier: 1.0, constant: -2000).isActive = true
        
        
        
        
        NSLayoutConstraint(item: headingLabel, attribute: .top, relatedBy: .equal, toItem: topBar, attribute: .bottom, multiplier: 1.0, constant: 30.0).isActive = true
        NSLayoutConstraint(item: headingLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: cardView, attribute: .top, relatedBy: .equal, toItem: headingLabel, attribute: .bottom, multiplier: 1.0, constant: 50.0).isActive = true
        NSLayoutConstraint(item: cardView, attribute: .centerX, relatedBy: .equal, toItem: headingLabel, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
         NSLayoutConstraint(item: cardView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 450).isActive = true
        NSLayoutConstraint(item: cardView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 450).isActive = true
        
        NSLayoutConstraint(item: cardTopBar, attribute: .top, relatedBy: .equal, toItem: cardView, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: cardTopBar, attribute: .leading, relatedBy: .equal, toItem: cardView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: cardTopBar, attribute: .trailing, relatedBy: .equal, toItem: cardView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: cardTopBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50).isActive = true
        
         NSLayoutConstraint(item: cardHeadingLabel, attribute: .centerX, relatedBy: .equal, toItem: cardTopBar, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: cardHeadingLabel, attribute: .centerY, relatedBy: .equal, toItem: cardTopBar, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true

        NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: cardTopBar, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: containerView, attribute: .leading, relatedBy: .equal, toItem: cardView, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: containerView, attribute: .trailing, relatedBy: .equal, toItem: cardView, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        
          NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: cardView, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
}
