//
//  PlaceTest.swift
//  MVVMTTDTests
//
//  Created by Sathyan Muthusamy on 04/02/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import XCTest
@testable import XCTest_App

class PlaceTest: XCTestCase {
    
    var place : Place!
    
    override func setUp() {
       
    }

    override func tearDown() {
    }

    func testValidPlace() {
        let dataAttributes: [String : Any] = ["name": "Cafe day", "address": "Chennai"]
        place = Place.init(data: dataAttributes)
        XCTAssertEqual(place.name, "Cafe day")
        XCTAssertEqual(place.address, "Chennai")
    }
    
    func testInvalidPlaceAndAddress() {
        let dataAttributes: [String : Any] = ["name": "Star bucks", "address": "Bangalore"]
        place = Place.init(data: dataAttributes)
        XCTAssertNotEqual(place.name, "Cafe day")
        XCTAssertNotEqual(place.address, "Chennai")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
