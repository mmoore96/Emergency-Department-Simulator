//
//  File.swift
//  StarterGame
//
//  Created by Michael Moore on 11/9/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation


class PtRoom {
    var exits : [String : PtRoom]
    var tag : String
    
    convenience init() {
        self.init(tag: "No Tag")
    }
    
    init(tag : String) {
        exits = [String : PtRoom]()
        self.tag = tag
    }
    
    func setExit(_ exitName : String, PtRoom : PtRoom) {
        exits[exitName] = PtRoom
    }
    
    func getExit(_ exitName : String) -> PtRoom? {
        return exits[exitName]
    }
    
    func getExits() -> String {
        let exitNames : [String] = [String](exits.keys)
        return "Exits: " + exitNames.joined(separator: " ")
    }
    
    func description() -> String {
        return "You are \(tag).\n *** \(self.getExits())"
    }
    
    deinit {
        tag = ""
        exits.removeAll()
    }
}
