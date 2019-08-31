//
//  GoCommand.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/17/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation

class EnterMainPtRoomCommand: Command {
    override init() {
        super.init()
        self.name = "enter"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasPtRom(){
            player.walkTo(secondWord!)
        } else {
            player.warningMessage("\nEnter which room?")
        }
        return false
    }
}
