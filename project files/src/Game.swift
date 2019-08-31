//
//  Game.swift
//  StarterGame
//
//  Created by George Moore.
//   
// 

import Foundation
import Cocoa
class Game {
    var player : Player?
    var parser : Parser
    var playing : Bool
    var worldItems: Item?
    var worldRooms = [Room]()
    
    init(gameIO : GameOutput) {
        playing = false
        parser = Parser(newCommands: CommandWords())
        player = Player(room: createWorld(), output: gameIO, game:self)
        
    }
    
    func createWorld() -> Room {
        //ED
        let outside = Room(tag: "outside the main entrance of the Emergency Deparment, You can head into the ED.", lock: false, roomName: "outside ED", roomNameExit: "outside")
        worldRooms.append(outside) //0
        let waitingRoom = Room(tag: "You are in the waiting room of the ED ", lock: false, roomName: "waiting", roomNameExit: "waiting")
        worldRooms.append(waitingRoom) //1
//        let lockerRoom = Room(tag: "You are in the locker room of the ED ", lock: false, roomName: "locker", roomNameExit: "locker")
//        worldRooms.append(lockerRoom)//2
        let mainED = Room(tag: "in the main ED. There are three pts to be seen. They are in rooms: \n 01, 02, 03, 04, 05, 06.", lock: false, roomName: "main", roomNameExit: "main")
        worldRooms.append(mainED) //2
        let Room01 = Room(tag: "in ED 01 ", lock: false, roomName: "main room 01", roomNameExit: "room01")
        worldRooms.append(Room01) //3
        let pt_01 = Room(tag: "In Main ED RM 01, Ashely is the pt", lock: false, roomName: "Pt in ED room 01", roomNameExit: "room01")
        worldRooms.append(pt_01) //4
        let Room02 = Room(tag: "in ED 02 ", lock: true, roomName: "main room 02", roomNameExit: "room02")
        worldRooms.append(Room02) //5
        Room02.keyType.KeyMessage = "See pts in the order of rooms"
        let pt_02 = Room(tag: "In Main ED RM 02, John is the pt", lock: true, roomName: "Pt in ED room 02", roomNameExit: "room02")
        worldRooms.append(pt_02) //6
        pt_02.keyType.KeyMessage = "See pts in the order of rooms"
        let Room03 = Room(tag: "in ED 03 ", lock: true, roomName: "main room 03", roomNameExit: "room03")
        worldRooms.append(Room03) //7
        let pt_03 = Room(tag: "In Main ED RM 03, Pat is the pt", lock: true, roomName: "Pt in ED room 03", roomNameExit: "room03")
        worldRooms.append(pt_03) //8
        let Room04 = Room(tag: "in ED 04 ", lock: true, roomName: "main room 04", roomNameExit: "room04")
        worldRooms.append(Room04) //9
        Room02.keyType.KeyMessage = "See pts in the order of rooms"
        let pt_04 = Room(tag: "In Main ED RM 04, Brett is the pt", lock: true, roomName: "Pt in ED room 04", roomNameExit: "room04")
        worldRooms.append(pt_04) //10
        let Room05 = Room(tag: "in ED 05 ", lock: true, roomName: "main room 05", roomNameExit: "room05")
        worldRooms.append(Room05) //11
        let pt_05 = Room(tag: "In Main ED RM 05, Lauren is the pt", lock: true, roomName: "Pt in ED room 05", roomNameExit: "room05")
        worldRooms.append(pt_05) //12
        let Room06 = Room(tag: "in ED 06 ", lock: true, roomName: "main room 06", roomNameExit: "room06")
        worldRooms.append(Room06) //13
        Room02.keyType.KeyMessage = "See pts in the order of rooms"
        let pt_06 = Room(tag: "In Main ED RM 06, Michael is the pt", lock: true, roomName: "Pt in ED room 06", roomNameExit: "room06")
        worldRooms.append(pt_06) //14
        
        pt_02.keyType.KeyMessage = "You need to see the pt in Room01 before being able to evaluate this pt."
        pt_03.keyType.KeyMessage = "You need to see the pt in Room02 before being able to evaluate this pt."
        pt_04.keyType.KeyMessage = "You need to see the pt in Room03 before being able to evaluate this pt."
        pt_05.keyType.KeyMessage = "You need to see the pt in Room04 before being able to evaluate this pt."
        pt_06.keyType.KeyMessage = "You need to see the pt in Room05 before being able to evaluate this pt."
        pt_01.setPatient("ashely")
        pt_02.setPatient("john")
        pt_03.setPatient("pat")
        pt_04.setPatient("brett")
        pt_05.setPatient("lauren")
        pt_06.setPatient("michael")
        //yourLocker.setLocker("coat")
        //Exits ED
        outside.setExit("waiting", room: waitingRoom)
        waitingRoom.setExit("main", room: mainED)
        //lockerRoom.setExit("main", room: mainED)
        mainED.setExit("room01", room: pt_01)
        mainED.setExit("room02", room: pt_02)
        mainED.setExit("room03", room: pt_03)
        mainED.setExit("room04", room: pt_04)
        mainED.setExit("room05", room: pt_05)
        mainED.setExit("room06", room: pt_06)
        pt_01.setExit("main", room: mainED)
        pt_02.setExit("main", room: mainED)
        pt_03.setExit("main", room: mainED)
        pt_04.setExit("main", room: mainED)
        pt_05.setExit("main", room: mainED)
        pt_06.setExit("main", room: mainED)
        
       
        
        for i in 0..<worldRooms.count {
            if i != 14 {
                pt_06.setExit(worldRooms[i].roomNameExit, room: worldRooms[i])
            }
        }

        player?.currentRoom = outside
        return outside
    }
    func createItems() -> Item {
    //items will use the composite design pattern
    
    let Items = Item(itemName: "Provider Items")
    let wearableItems = Item(itemName: "Wearable Items")

    Items.add(item: wearableItems)
    
        
    

    wearableItems.add(item: Item(itemName: "Lab coat"))
    wearableItems.add(item: Item(itemName: "Stethoscope"))
    wearableItems.add(item: Item(itemName: "Hospital Badge"))
        
    return wearableItems
    }
    func start() {
        playing = true
        player?.outputMessage("Welcome to the ED Simulator!\n You are an EM Provider, who just arrived to the ED! \n" , color: NSColor.white)
        player?.outputMessage(welcome(), color: NSColor.white)
        player?.outputMessage("\n\nCurrent Location: ", color: NSColor.white)
        player?.outputMessage(" Outside ED", color: NSColor.green)
        player?.outputMessage(startMessage(), color: NSColor.white)
        player?.outputMessage(roomExits(), color: NSColor.orange)
        player?.outputMessage(roomPatients(), color: customColors.lightGreen!)
        //player?.outputMessage(roomItems(), color: customColors.blue!)
    }
    
    func end() {
        playing = false
        player?.outputMessage(goodbye())
    }
    
    func welcome() -> String {
        let message = "You will need to walk into the ED and begin seeing patients in the ED. \n\nType 'help' if you need help."
        return message
        
    }
    func startMessage() -> String {
        return "\n\(player!.currentRoom.description())"
    }
    
    func roomExits() -> String {
        return player!.currentRoom.getExits()
    }
    
    func roomPatients() -> String {
        return player!.currentRoom.getPatients()
    }
//    func roomItems() -> String {
//        return player!.currentRoom.getItems()
//    }
    func roomLockers() -> String {
        return player!.currentRoom.getLocker()
    }
    
    func goodbye() -> String {
        return "\nThank you for playing the ED Simulator!, Goodbye.\n"
    }
    
    func execute(_ commandString : String) -> Bool {
        var finished : Bool = false
        if playing {
            player?.commandMessage("\n>\(commandString)")
            let command : Command? = parser.parseCommand(commandString)
            if command != nil {
                finished = (command?.execute(player!))!
            } else {
                player?.errorMessage("\nI don't understand...")
            }
        }
        return finished
    }
}
