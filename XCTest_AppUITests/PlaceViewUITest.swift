//
//  PlaceViewUITest.swift
//  XCTest AppTests
//
//  Created by Nivas on 30/09/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import XCTest

class PlaceViewUITest: XCTestCase {

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
    
    func testPlacesTabExist() {
        let app = XCUIApplication()
        let usernameTextField = app.textFields["Username"]
        usernameTextField.tap()
        usernameTextField.typeText("username")
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        app.buttons["Login"].tap()
        
        let tabBarsQuery = app.tabBars
        let placesButton = tabBarsQuery.buttons["Places"]
        placesButton.tap()
        
        XCTAssertEqual(placesButton.exists, true)
    }
    
    func  testPlacesHasTable()
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
        let placesButton = tabBarsQuery.buttons["Places"]
        placesButton.tap()

        let table = XCUIApplication().tables.matching(identifier: "UITestTableView")
        XCTAssertNotNil(table)
    }
    
    func testPlacesTableCellInitialization()
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
        let placesButton = tabBarsQuery.buttons["Places"]
        placesButton.tap()
        
        let cell = XCUIApplication().tables.cells.matching(identifier: "PlaceCell")
        XCTAssertNotNil(cell)
    }
    
    func testPlacesTableRowCount()
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
        let placesButton = tabBarsQuery.buttons["Places"]
        placesButton.tap()

        XCTAssert(app.tables.staticTexts.count == 6)
    }

}
