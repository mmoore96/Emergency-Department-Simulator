//
//  Player.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/16/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

class Player {
    var currentGame : Game
    var currentRoom : Room
    let Patient = PatientManager()
    var locker = LockerManager()
    var io : GameOutput
    var isEvaluating = false
    var backCommand = [String]()
    var isSpeakingWith = ""
    var isBackingUp = false
    var playerInv = Inventory(invName: "Provider's Inv")
    var playerStats = Statistics(playerHealth: 100, playerLevel: "Pre-Med", playerExp: 0)
    init(room : Room, output : GameOutput, game : Game) {
        currentRoom = room
        io = output
        currentGame = game
    }
    func walkTo(_ direction : String) {
        let nextRoom : Room? = currentRoom.getExit(direction)
        if nextRoom != nil {
            if nextRoom!.lock == false{
                if self.currentRoom.roomName == self.currentGame.worldRooms[0].roomName  {
                    self.backCommand = [String]()
                }else{
                    if self.isBackingUp != true {
                        self.backCommand.append(self.currentRoom.roomNameExit)
                    }else{
                        self.isBackingUp = false
                    }
            }

                self.currentRoom = nextRoom!
                self.outputMessage("\nCurrent Location: ", color: NSColor.white)
                self.outputMessage(nextRoom!.roomName, color: NSColor.green)
                self.outputMessage("\n\(nextRoom!.description())", color: NSColor.white)
                if nextRoom!.roomName == "Room06" {
                    self.currentGame.end()
                }else{
                    self.outputMessage((nextRoom!.getExits()), color: NSColor.orange)
                    self.outputMessage((nextRoom!.getPatients()), color: customColors.lightGreen!)
                  
                }

            }else{
                if nextRoom!.keyType.KeyMessage == "" {
                    self.outputMessage("\nThis location requires you to see patients in order..\n", color: NSColor.red)
                }else{
                    self.outputMessage("\n" + nextRoom!.keyType.KeyMessage + "\n", color: NSColor.brown)
                }
            }
        } else {
            self.errorMessage("\nThere is no location '\(direction)'\n")
        }
    }
    
    
        func goToRoom (room: Room) {
            if self.currentRoom.roomName == self.currentGame.worldRooms[2].roomName {
                self.backCommand = [String]()
            }

            self.currentRoom = room
            self.outputMessage("\nCurrent Location: ", color: NSColor.white)
            self.outputMessage(room.roomName, color: NSColor.green)
            self.outputMessage("\n\(room.description())", color: NSColor.white)
            self.outputMessage((room.getExits()), color: NSColor.orange)
            self.outputMessage((room.getPatients()), color: customColors.lightGreen!)
            //self.outputMessage((room.getItems()), color: NSColor.yellow)
        }
        
        func evalPt(_ direction : String){
            //let 
        }
    
    func speakWith(patientName: String) {
        if patientName == "ashely" {
            isSpeakingWith = "ashely"
            Patient.speakPt_01(interaction: "", player: self)
        } else if patientName == "john" {
            isSpeakingWith = "john"
            Patient.speakPt_02(interaction: "", player: self)
        }
        else if patientName == "pat" {
            isSpeakingWith = "pat"
            Patient.speakPt_03(interaction: "", player: self)
        }
        else if patientName == "brett" {
            isSpeakingWith = "brett"
            Patient.speakPt_04(interaction: "", player: self)
        }
        else if patientName == "lauren" {
            isSpeakingWith = "lauren"
            Patient.speakPt_05(interaction: "", player: self)
        }
        else if patientName == "michael" {
            isSpeakingWith = "michael"
            Patient.speakPt_06(interaction: "", player: self)
        }
        
    }
//    func obtain(locker: String) {
//        if itemName == "coat" {
//            isObtaining = "coat"
//            Locker.getLocker(interaction: "", player: self)
//        } else if patientName == "stethoscope" {
//            isObtaining = "stethoscope"
//            Locker.getLocker(interaction: "", player: self)
//        }
//    }
    func outputMessage(_ message : String) {
        io.sendLine(message)
    }
    
    func outputMessage(_ message : String, color : NSColor) {
        let lastColor : NSColor = io.currentColor
        io.currentColor = color
        self.outputMessage(message)
        io.currentColor = lastColor
    }
    
    func errorMessage(_ message : String) {
        self.outputMessage(message, color: NSColor.red)
    }
    
    func warningMessage(_ message : String) {
        self.outputMessage(message, color: NSColor.orange)
    }
    
    func commandMessage(_ message : String) {
        self.outputMessage(message, color: NSColor.brown)
    }

}

