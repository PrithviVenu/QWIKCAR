//
//  SplitView.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 14/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class SplitView: NSSplitView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    override var dividerThickness: CGFloat {
        get {return 0.0}
    }
    
}
