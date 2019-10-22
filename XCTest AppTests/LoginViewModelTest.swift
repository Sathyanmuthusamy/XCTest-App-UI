//
//  LoginViewModelTest.swift
//  XCTest AppTests
//
//  Created by Sathyan Muthusamy on 26/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import XCTest
@testable import XCTest_App

class LoginViewModelTest: XCTestCase {

    var loginModel = LoginViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessLoginValidation() {
        let check = loginModel.checkLoginValidation(username: "Username", password: "Password")
        XCTAssert(true)
        XCTAssertTrue(check, "Input fields are not empty.")
    }
    
    func testFailureLoginValidation() {
        let check = loginModel.checkLoginValidation(username: "", password: "")
        XCTAssert(true)
        XCTAssertFalse(check, "Input fields are empty.")
    }

}
