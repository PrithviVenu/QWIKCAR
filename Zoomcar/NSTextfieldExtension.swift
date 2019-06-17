//
//  NSTextfieldExtension.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 14/06/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

extension NSTextField {
    func useUnderline() {
        self.wantsLayer=true
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.5510721803, green: 0.6823329926, blue: 0.6758498549, alpha: 1)
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer?.addSublayer(border)
        self.layer?.masksToBounds = true
    }
}
