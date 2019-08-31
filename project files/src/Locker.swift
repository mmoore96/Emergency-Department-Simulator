//
//  Locker.swift
//  StarterGame
//
//  Created by Michael Moore on 12/7/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

class LockerManager {
    private var yourLocker: Locker
    
    
    
    init() {
        self.yourLocker = lockerRoomED()
        
    }
    
    func inLocker(interaction: String, player: Player){
        yourLocker.inLocker(interaction: interaction, player: player)
    }
    
    
}

protocol Locker {
    func inLocker(interaction: String, player: Player)
}
class lockerRoomED: Locker {
    func helloLocker(player: Player){
         player.outputMessage("\nYou are in the Locker room ", color: NSColor.white)
        
    }
    func inLocker(interaction: String, player: Player){
        player.outputMessage("\nYou are in the Locker room ", color: NSColor.white)
    
        player.outputMessage("You need to put on your lab coat, stethoscope, and hospital badge", color: NSColor.brown)
        
    }
    func wear(interaction: String, player: Player) {
        if interaction == "coat"{
            self.coat(player: player)
            let wearableItems = player.currentGame.worldItems!.itemsList[1].itemsList
            let item = interaction.replacingOccurrences(of: "wear " , with: "")
            let toArray = item.components(separatedBy: " ")
            let itemToAdd = (Int(toArray[0])! - 1)
            let message = "\nYou have put on your" + (wearableItems[itemToAdd].itemName + ", they/it have been added to your inventory\n")
            player.outputMessage(message, color: NSColor.white)
        }
        else if interaction == "stethoscope"{
            self.stethoscope(player: player)
        }
        else if interaction == "hospital badge"{
            self.badge(player: player)
        }
        
        else{
            helloLocker(player: player)
        }
    }
    
    
    func coat(player: Player){

        player.outputMessage("\nYou are in the Locker room ", color: NSColor.white)
       
        
    }
    
    func stethoscope(player: Player){
        player.outputMessage("\nYou are in the Locker room ", color: NSColor.white)
        player.outputMessage("You have put on your stethoscope", color: NSColor.brown)
    }
    func badge(player: Player){
       player.outputMessage("\nYou are in the Locker room ", color: NSColor.white)
        player.outputMessage("You have put on your hospital badge", color: NSColor.brown)
    }
}

