//
//  PlayerRank.swift
//  StarterGame
//
//  Created by Michael Moore on 12/1/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

//The players rank uses the Observer pattern with notifications
protocol Observer {
    
    func update()
}

class PlayerProggresion {
    
    private var observerArray = [Observer]()
    private var _playerExp = Int()
    var playerExp : Int {
        set {
            _playerExp = newValue
            notify()
        }
        get {
            return _playerExp
        }
    }
    
    func attachObserver(observer : Observer){
        observerArray.append(observer)
    }
    
    private func notify(){
        for observer in observerArray {
            observer.update()
        }
    }
    
}

class playerProgress : Observer{
    
    private var expObs = PlayerProggresion()
    private var player : Player
    private var level: String
    private var expToLevel: Int
    
    init(Obs : PlayerProggresion, player : Player) {
        self.expObs = Obs
        self.player = player
        self.level = player.playerStats.playerLevel
        self.expToLevel = player.playerStats.playerExpLevelUp
        self.expObs.attachObserver(observer: self)
    }
    
    func update(){
        level = player.playerStats.playerLevel
        expToLevel = player.playerStats.playerExpLevelUp
        if (expObs.playerExp + player.playerStats.playerExp) >= expToLevel {
            levelUp()
        }else{
            player.playerStats.playerExp += expObs.playerExp
        }
    }
    
    func levelUp(){
        if level == "Pre-Med" {
            player.playerStats.playerLevel = "Medical Student"
            player.playerStats.playerExp = (expObs.playerExp + player.playerStats.playerExp) - expToLevel
            player.playerStats.playerExpLevelUp = (player.playerStats.playerExpLevelUp * 2)
            player.outputMessage("\n You have Ranked Up!", color: NSColor.blue)
            player.goToRoom(room: player.currentRoom)
        } else if level == "Medical Student" {
            player.playerStats.playerLevel = "Intern"
            player.playerStats.playerExp = (expObs.playerExp + player.playerStats.playerExp) - expToLevel
            player.playerStats.playerExpLevelUp = (player.playerStats.playerExpLevelUp * 2)
            player.outputMessage("\n You have Ranked Up!", color: NSColor.blue)
            player.goToRoom(room: player.currentRoom)
        } else if level == "Intern" {
            player.playerStats.playerLevel = "Resident"
            player.playerStats.playerExp = (expObs.playerExp + player.playerStats.playerExp) - expToLevel
            player.playerStats.playerExpLevelUp = (player.playerStats.playerExpLevelUp * 2)
            player.outputMessage("\n You have Ranked Up!", color: NSColor.blue)
            player.goToRoom(room: player.currentRoom)
        } else if level == "Resident" {
            player.playerStats.playerLevel = "Attending"
            player.playerStats.playerExp = (expObs.playerExp + player.playerStats.playerExp) - expToLevel
            player.playerStats.playerExpLevelUp = (player.playerStats.playerExpLevelUp * 2)
            player.outputMessage("\n You have Ranked Up!", color: NSColor.blue)
            player.goToRoom(room: player.currentRoom)
            
            
        }
   }
    
}





