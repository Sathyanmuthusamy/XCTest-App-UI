//
//  Place.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

struct Place : Equatable {

    var name : String?
    var address : String?
    
    init(data: [String : Any]) {
        self.name = data["name"] as? String ?? ""
        self.address = data["address"] as? String ?? ""
    }
}
