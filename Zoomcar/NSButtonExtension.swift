//
//  NSButtonExtension.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 28/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa
extension NSButton{
    public func shadow(cornerRadius:CGFloat,shadowColor:NSColor,shadowOpacity:Float){
        self.layer?.cornerRadius=cornerRadius
        self.layer?.shadowColor=shadowColor.cgColor
        self.layer?.shadowOffset=CGSize(width: 0, height: 0)
        self.layer?.shadowOpacity=shadowOpacity
    }
  
        
    public func setText(text: String, color: NSColor, font: NSFont ,alignment:NSTextAlignment?) {
            
            let paragraphStyle = NSMutableParagraphStyle.init()
        if alignment != nil{
                    paragraphStyle.alignment = alignment!
        }
            let range = NSRange.init(location: 0, length: (text.lengthOfBytes(using: String.Encoding.utf8)))
            let attributedTitle = NSMutableAttributedString.init(string: text)
            attributedTitle.addAttribute( NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            attributedTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            attributedTitle.addAttribute(NSAttributedString.Key.font, value: font, range: range)
            self.attributedTitle = attributedTitle
        }
    
    
        public func backgroundWithAlpha(color: NSColor, alpha:CGFloat) {
            self.layer?.backgroundColor = color.withAlphaComponent(alpha).cgColor
            
        }
        
    
}
class CustomButton: NSButton {
    var isChecked:Bool=false
    func check(text:String, color1: NSColor, color2: NSColor, font: NSFont,alignment:NSTextAlignment?){
        self.wantsLayer=true
        self.isChecked = !(self.isChecked)
        if(self.isChecked){
            self.setText(text: text, color: color1, font: font,alignment:alignment)
            self.shadow(cornerRadius: 10.0, shadowColor:color1 , shadowOpacity: 1.0)
            self.layer?.shadowRadius=2.0
        }
        else{
            self.setText(text: text, color: color2, font: font,alignment:alignment)
            self.layer?.shadowOpacity=0

        }
        
    }
}
