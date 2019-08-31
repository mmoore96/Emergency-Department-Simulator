//
//  GoCommand.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/17/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation



import Foundation

class SpeakCommand: Command {
    override init() {
        super.init()
        self.name = "eval"
    }
    
    override func execute(_ player: Player) -> Bool {
        player.isSpeakingWith = ""
        if hasSecondWord() {
            let patientList = player.currentRoom.getPatientArray()
            for i in 0..<patientList.count {
                if patientList[i] == secondWord!{
                    player.speakWith(patientName: patientList[i])
                    break
                }
            }
            if player.isSpeakingWith == "" {
                player.warningMessage("\n'" + secondWord! + "' cannot be evaluated.\n")
            }
        } else {
            player.warningMessage("\nWho are you trying to evaluate?\n")
        }
        return false
    }
}
