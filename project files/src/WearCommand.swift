//
//  WearCommand.swift
//  StarterGame
//
//  Created by Michael Moore on 12/8/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation

class WearCommand: Command {
    override init() {
        super.init()
        self.name = "wear"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            player.warningMessage("\nI cannot wear '" + secondWord! + "'")
        } else {
            if player.currentRoom.roomItems.count != 0 {
                var itemArray = player.currentRoom.roomItems
                for _ in 0..<player.currentRoom.roomItems.count {
                    if (itemArray[0].weight + player.playerInv.invWeight) <= player.playerInv.maxInvWeight{
                        player.playerInv.invList.append(itemArray[0])
                        player.outputMessage(String("\nPut on " + itemArray[0].itemName), color: customColors.blue!)
                        player.playerInv.invWeight += itemArray[0].weight
                        itemArray.remove(at: 0)
                    }else{
                        player.warningMessage("\nYou cannot wear anything else...")
                        break
                    }
                }
                player.currentRoom.roomItems = itemArray
                player.outputMessage("\n")
                player.goToRoom(room: player.currentRoom)
            }else{
                player.warningMessage("\nNo items to wear...\n")
            }
        }
        return false
    }
}
