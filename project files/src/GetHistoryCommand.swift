//
//  GetHistoryCommand.swift
//  StarterGame
//
//  Created by Michael Moore on 12/7/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
class GetHistoryCommand: Command {
    override init() {
        super.init()
        self.name = "history"
    }
    
    override func execute(_ player: Player) -> Bool {
        if player.isSpeakingWith == "ashely" {
            if hasSecondWord(){
                player.Patient.speakPt_01(interaction: "history " + secondWord!, player: player)
            }else {
                player.Patient.speakPt_01(interaction: "history", player: player)
                
            }
        }else if player.isSpeakingWith == "john"{
            if hasSecondWord(){
                player.Patient.speakPt_02(interaction: "history" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_02(interaction: "history", player: player)
            }
        }else if player.isSpeakingWith == "pat"{
            if hasSecondWord(){
                player.Patient.speakPt_03(interaction: "history" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_03(interaction: "history", player: player)
            }
        }else if player.isSpeakingWith == "lauren"{
            if hasSecondWord(){
                player.Patient.speakPt_04(interaction: "history" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_04(interaction: "history", player: player)
            }
        }else if player.isSpeakingWith == "brett"{
            if hasSecondWord(){
                player.Patient.speakPt_05(interaction: "history" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_06(interaction: "history", player: player)
            }
        }else if player.isSpeakingWith == "michael"{
            if hasSecondWord(){
                player.Patient.speakPt_06(interaction: "history" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_06(interaction: "history", player: player)
            }
        }
        return false
    }
    
}
