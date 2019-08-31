//
//  WrongFinalCommand2.swift
//  StarterGame
//
//  Created by Michael Moore on 12/7/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation

class CheckFinalCommand03: Command {
    override init() {
        super.init()
        self.name = "3"
    }
    
    override func execute(_ player: Player) -> Bool {
        if player.isSpeakingWith == "ashely" {
            if hasSecondWord(){
                player.Patient.speakPt_01(interaction: "3" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_01(interaction: "3", player: player)
            }
        }else if player.isSpeakingWith == "john"{
            if hasSecondWord(){
                player.Patient.speakPt_02(interaction: "3" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_02(interaction: "3", player: player)
            }
        }else if player.isSpeakingWith == "pat"{
            if hasSecondWord(){
                player.Patient.speakPt_03(interaction: "3" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_03(interaction: "3", player: player)
            }
        }else if player.isSpeakingWith == "lauren"{
            if hasSecondWord(){
                player.Patient.speakPt_04(interaction: "3" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_04(interaction: "3", player: player)
            }
        }else if player.isSpeakingWith == "brett"{
            if hasSecondWord(){
                player.Patient.speakPt_05(interaction: "3" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_05(interaction: "3", player: player)
            }
        }else if player.isSpeakingWith == "michael"{
            if hasSecondWord(){
                player.Patient.speakPt_06(interaction: "3" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_06(interaction: "3", player: player)
            }
            
            
            
            
            
        }
        
        return false
    }
    
}
