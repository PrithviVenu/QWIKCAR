//
//  SplitViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 14/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    @IBOutlet weak var item1: NSSplitViewItem!
    
    @IBOutlet weak var item2: NSSplitViewItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        item1.canCollapse = false
       
//  NSLayoutConstraint(item: item1.viewController.view, attribute: NSLayoutConstraint.Attribute.notAnAttribute, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1.0, constant: 217.0).isActive=true
        // Do view setup here.
    }
    
}
