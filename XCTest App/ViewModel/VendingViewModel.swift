//
//  VendingViewModel.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

enum VendingError: Error, Equatable {
    case invalidSelection
    case outOfStock
}

struct Item {
    var count: Int
}

class VendingViewModel: NSObject {

    var inventory = [
        "Candy": Item(count: 5),
        "Chips": Item(count: 0),
        "Coke": Item(count: 10)
    ]
    
    func vend(item name: String) throws {
        
        guard let item = inventory[name] else {
            throw VendingError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingError.outOfStock
        }
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
    
}
