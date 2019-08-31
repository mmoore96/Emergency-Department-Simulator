//
//  HelpCommand.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/17/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

class HelpCommand: Command {
    var words : CommandWords
    var customColor = customColors()
    
    init(commands : CommandWords) {
        words = commands
        super.init()
        self.name = "help"
    }
    
    override func execute(_ player: Player) -> Bool {
        if hasSecondWord() {
            if secondWord! == "eval" {
                player.errorMessage("\nThe Evaluate Command allows you to assess patients\n")
            }else if secondWord! == "go" {
                player.errorMessage("\nThe Go command lets you navigate in the ED and from patient room to room\n")
            }else if secondWord! == "vitals" {
                player.errorMessage("\nThe  vitals command lets you see the patient's vital signs.\n")
            }else if secondWord! == "history"{
                player.errorMessage("\nThe history command lets you see the pt's PMHx, PMSHx, FHx, and PSHx,\n")
            }else if secondWord! == "PE"{
                player.errorMessage("\nThe PE command lets you preform a physical exam.\n")
            }else if secondWord! == "labs"{
                player.errorMessage("\nThe labs command lets you see the pt's lab results\n")
            }else if secondWord! == "imaging"{
                player.errorMessage("\nThe imaging command lets you see the pt's imaging results\\n")
            }else if secondWord! == "final"{
                player.errorMessage("\nThe final command will give you a list of final diagnoses for the pt\n")
            }else if secondWord! == "quit"{
                player.errorMessage("\nThe quit command exits the game.\n")
            }else if secondWord! == "view"{
                player.errorMessage("\nThe view command allows you to view your stats and your rank.\n")
            }
            
        } else {
            player.outputMessage("\nHelp with what? Type help and a command for more info...example 'help go'\n\nYour available commands are:\n\(words.description())\n", color: customColors.red!)
        }
        return false
    }
}
