//
//  ItemStore.swift
//  Homepwner
//
//  Created by ByteDance on 2022/6/13.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    @discardableResult func createItem() -> Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
