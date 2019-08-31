//
//  LabResultsCommand.swift
//  StarterGame
//
//  Created by Michael Moore on 12/3/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
class LabResultsCommand: Command {
    override init() {
        super.init()
        self.name = "labs"
    }
    
    override func execute(_ player: Player) -> Bool {
        if player.isSpeakingWith == "ashely" {
            if hasSecondWord(){
                player.Patient.speakPt_01(interaction: "labs" + secondWord!, player: player)
            }else {
                player.Patient.speakPt_01(interaction: "labs", player: player)
            }
        }else if player.isSpeakingWith == "john"{
                if hasSecondWord(){
                    player.Patient.speakPt_02(interaction: "labs" + secondWord!, player: player)
                }else {
                    player.Patient.speakPt_02(interaction: "labs", player: player)
                }
        }else if player.isSpeakingWith == "pat"{
                if hasSecondWord(){
                    player.Patient.speakPt_03(interaction: "labs" + secondWord!, player: player)
                }else {
                    player.Patient.speakPt_03(interaction: "labs", player: player)
                }
            }else if player.isSpeakingWith == "lauren"{
                if hasSecondWord(){
                    player.Patient.speakPt_04(interaction: "labs" + secondWord!, player: player)
                }else {
                    player.Patient.speakPt_04(interaction: "labs", player: player)
                }
            }else if player.isSpeakingWith == "brett"{
                if hasSecondWord(){
                    player.Patient.speakPt_05(interaction: "labs" + secondWord!, player: player)
                }else {
                    player.Patient.speakPt_05(interaction: "labs", player: player)
                }
            }else if player.isSpeakingWith == "michael"{
                if hasSecondWord(){
                    player.Patient.speakPt_06(interaction: "labs" + secondWord!, player: player)
                }else {
                    player.Patient.speakPt_06(interaction: "labs", player: player)
                }
        }
        return false
    }
    
}
