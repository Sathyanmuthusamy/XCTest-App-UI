//
//  VendingViewModelTest.swift
//  MVVMTTDTests
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import XCTest
@testable import XCTest_App

class VendingViewModelTest: XCTestCase {

    var vendingMachine = VendingViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testErrorThrows() {
        
        XCTAssertThrowsError(try vendingMachine.vend(item: "Juice")) { error in
            XCTAssertEqual(error as! VendingError, VendingError.invalidSelection)
        }
        
        XCTAssertThrowsError(try vendingMachine.vend(item: "Chips")) { error in
            XCTAssertEqual(error as! VendingError, VendingError.outOfStock)
        }

        XCTAssertNoThrow(try vendingMachine.vend(item: "Coke"), "Dispensing Coke")
    }
    
    func testUnconditionalFailure() {
        
        XCTAssertThrowsError(try vendingMachine.vend(item: "Chips")) { error in
            if (VendingError.invalidSelection != error as! VendingError) {
                //XCTFail("Failure")
            }
        }
    }
}
