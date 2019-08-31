//
//  Room.swift
//  StarterGame
//
//  Created by Rodrigo Obando on 3/16/16.
//  Copyright © 2016 Rodrigo Obando. All rights reserved.
//
import Foundation
class Key {
    var KeyID : String
    var KeyMessage : String
    
    convenience init() {
        self.init(KeyID: "No name", KeyMessage: "None")
    }
    init(KeyID : String, KeyMessage: String) {
        self.KeyID = KeyID
        self.KeyMessage = KeyMessage
    }
    
    func getKeyMessage() -> String {
        return self.KeyMessage
    }
    
    func getKeyName() -> String {
        return self.KeyID
    }
}
class Room {
    var roomNameExit: String
    var roomName: String
    var exits : [String : Room]
    var tag : String
    var lock : Bool
    var keyType : Key
    var Patients : [String]
    var roomItems : [Item]
    var Locker : [String]
    
    convenience init() {
        self.init(tag: "No Tag", lock: false, roomName: "none", roomNameExit: "none")
    }
    
    init(tag : String, lock: Bool, roomName: String, roomNameExit: String) {
        exits = [String : Room]()
        Patients = [String]()
        Locker = [String]()
        roomItems = [Item]()
        self.roomName = roomName
        self.tag = tag
        self.lock = lock
        self.keyType = Key()
        self.roomNameExit = roomNameExit
    }
    
    func lockRoom() {
        self.lock = true
    }
    
    func unlockRoom() {
        self.lock = false
    }
    func setItem(roomItem : Item) {
        roomItems.append(roomItem)
    }
    
//    func getItems() -> String {
//        var itemNames = [String]()
//        for i in 0..<roomItems.count {
//            itemNames.append(roomItems[i].itemName)
//        }
//        if itemNames.count == 0 {
//            return ("*Items: Nothing nearby...\n")
//        }
//        return "*Items: " + itemNames.joined(separator: ", ") + "\n"
//    }
    
    func setExit(_ exitName : String, room : Room) {
        exits[exitName] = room
    }
    
    func getExit(_ exitName : String) -> Room? {
        return exits[exitName]
    }
    
    func getExits() -> String {
        let exitNames : [String] = [String](exits.keys)
        return "Exits: " + exitNames.joined(separator: ", ") + "\n"
    }
    
    func setPatient(_ patientName : String) {
        Patients.append(patientName)
    }
    
    func getPatients() -> String {
        let patientNames : [String] = [String](Patients)
        if patientNames.count == 0 {
            return " Nearby Patients: None nearby...\n"
        }
        return "Nearby Patients: " + patientNames.joined(separator: ", ") + "\n"
    }

    func getPatientArray() -> [String] {
        let patientNames : [String] = [String](Patients)
        if patientNames.count == 0 {
            return [""]
        }
        return patientNames
    }
    func setLocker(_ lockerName : String) {
        Locker.append(lockerName)
    }
    func getLocker() -> String {
        let patientNames : [String] = [String](Patients)
        if patientNames.count == 0 {
            return "** Nearby Patients: None nearby...\n"
        }
        return "** Nearby Patients: " + patientNames.joined(separator: ", ") + "\n"
    }

    
    func description() -> String {
        return "You are \(tag).\n"
    }
    
    deinit {
        tag = ""
        exits.removeAll()
    }
}
