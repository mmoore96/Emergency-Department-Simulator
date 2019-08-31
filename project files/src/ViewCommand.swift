//
//  ViewCommand.swift
//  StarterGame
//
//  Created by Michael Moore on 12/7/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
class ViewCommand: Command {
    override init() {
        super.init()
        self.name = "view"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            if secondWord! == "stats" {
                player.playerStats.view(player: player)
            }else{
                player.warningMessage("\nYou can't view '" + secondWord! + "'\n")
            }
        } else {
            player.warningMessage("\nView What?\n")
        }
        return false
    }
}
