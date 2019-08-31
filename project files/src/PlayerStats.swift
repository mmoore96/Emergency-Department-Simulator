//
//  PlayerStats.swift
//  StarterGame
//
//  Created by Michael Moore on 12/7/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

class Statistics {
    var playerHealth: Int
    var playerMaxHealth: Int
    var playerExp: Int
    var playerExpLevelUp = 100
    var playerLevel: String
    
    
    init(playerHealth: Int, playerLevel: String, playerExp: Int){
        self.playerHealth = playerHealth
        
        self.playerLevel = playerLevel
        self.playerExp = playerExp
        self.playerMaxHealth = 100
    }
    
    func view(player: Player) {
        var statStr = "\nProvider Stats:\n"
        statStr += "\nHealth Grade: " + String(self.playerHealth) + "/" + String(self.playerMaxHealth)
        statStr += "\n    Level: " + String(self.playerLevel)
        
        player.outputMessage(statStr, color: NSColor.green)
    }
}
    class Inventory {
        var invName : String
        var invList = [Item]()
        var invWeight = 0
        var maxInvWeight = 10
        
        init(invName: String) {
            self.invName = invName
        }
        
        func view(player: Player) {
            var invStr = "\nProvider's inv: weight("
            invStr += String(invWeight) + "/" + String(maxInvWeight) + ")\n"
            if invList.count != 0 {
                
                for i in 0..<invList.count {
                    let message = String(i + 1) + ": " + invList[i].itemName
                     invStr += message
                    if i != (invList.count-1){
                        invStr += ", "
                    }
                }
                invStr += "\n"
            }else{
                invStr += "Empty\n"
            }
            player.outputMessage(invStr, color: customColors.blue!)
        }
}

    

