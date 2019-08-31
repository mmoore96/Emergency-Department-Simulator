//
//  ItemManager.swift
//  StarterGame
//
//  Created by Michael Moore on 12/7/18.
//  Copyright © 2018 Rodrigo Obando. All rights reserved.
//

import Foundation
import Cocoa

//The items use composite design pattern

class Item{
    let itemName: String
    var itemsList = [Item]()
    var weight = 0
    
   
    init() {
        self.itemName = "Nothing"
        
    }
    
    
    init(itemName: String) {
        self.itemName = itemName
        self.weight = 2
        }
    
    
    func add(item: Item){
        itemsList.append(item)
    }
    
    func remove(index: Int){
        itemsList.remove(at: index)
    }
    
    func getItemList() -> [Item]{
        return itemsList
    }
}

