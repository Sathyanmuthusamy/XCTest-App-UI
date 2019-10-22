//
//  VendingViewUITest.swift
//  XCTest AppUITests
//
//  Created by Nivas on 30/09/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import XCTest

class VendingViewUITest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testVendingTabExist() {
        let app = XCUIApplication()
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("username")
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        let vendingButton = tabBarsQuery.buttons["Vending"]
        vendingButton.tap()

        XCTAssertEqual(vendingButton.exists, true)
    }
    
    func testVendingTab()
    {
        let app = XCUIApplication()
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("username")

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")

        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        let vendingButton = tabBarsQuery.buttons["Vending"]
        vendingButton.tap()
        tabBarsQuery.buttons["Places"].tap()
        vendingButton.tap()
        
        let dispenseButton = app.buttons["Dispense"]
        dispenseButton.tap()
        XCTAssertEqual(dispenseButton.exists, true)

        let vendButton = app.buttons["Dispense"]
        vendButton.tap()
        XCTAssertEqual(vendButton.exists, true)
    }

}
