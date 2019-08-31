//
//  CustomColors.swift
//  StarterGame
//
//  Created by Michael Moore on 11/28/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

//customColors use the Singleton pattern
class customColors {
    
    static var pink = NSColor.init(cgColor: CGColor.init(red: 0.99, green: 0.06, blue: 0.63, alpha: 1.0))
    
    static var blue = NSColor.init(cgColor: CGColor.init(red:0.32, green:0.50, blue:0.95, alpha:1.0))
    
    static var lightOrange = NSColor.init(cgColor: CGColor.init(red:0.95, green:0.32, blue:0.32, alpha:1.0))
    
    static var red = NSColor.init(cgColor: CGColor.init(red:0.86, green:0.06, blue:0.06, alpha:1.0))
    
    static var lightBlue = NSColor.init(cgColor: CGColor.init(red:0.06, green:0.67, blue:0.86, alpha:1.0))
    
    static var lightGreen = NSColor.init(cgColor: CGColor.init(red:0.06, green:0.86, blue:0.76, alpha:1.0))
}
