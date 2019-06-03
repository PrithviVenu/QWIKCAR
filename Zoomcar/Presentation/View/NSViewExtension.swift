//
//  NSViewExtension.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 04/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
import Cocoa

extension NSView {
    
    func setGradientBackground(colorOne: NSColor, colorTwo: NSColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer?=gradientLayer
    }
}
