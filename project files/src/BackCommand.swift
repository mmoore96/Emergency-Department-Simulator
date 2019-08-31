//
//  BackCommand.swift
//  StarterGame
//
//  Created by Michael Moore on 12/3/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

class BackCommand: Command {
    override init() {
        super.init()
        self.name = "back"
    }
    
    override func execute(_ player: Player) -> Bool {
        player.isBackingUp = true
        player.isSpeakingWith = ""
            if hasSecondWord() == false {
                if player.backCommand.count != 0 {
                    player.walkTo(player.backCommand[player.backCommand.count - 1])
                    player.backCommand.remove(at: ((player.backCommand.count) - 1))
                }else{
                    player.warningMessage("\nYou cannot go backwards any further...\n")
                }
            } else {
                player.warningMessage("\nYou cannot go back\n")
            }
        
        return false
    }
}
