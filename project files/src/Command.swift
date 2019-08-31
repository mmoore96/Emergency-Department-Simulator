//
//  Command.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/17/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation

class Command {
    var name : String
    var secondWord : String?
    var ptRoom : String?
    var pt : String?
    init() {
        self.name = ""
        self.ptRoom = ""
        self.pt = ""
    }
    
    func hasSecondWord() -> Bool {
        return secondWord != nil
    }
    
    func hasPtRom() -> Bool {
        
        return ptRoom != nil
    }
    
    func hasPt() -> Bool {
        return pt != nil
    }
    
    func execute(_ player : Player) -> Bool {
        return false
    }
    
    func executePt(_ patient : Patient) -> Bool {
        return false
    }
}
