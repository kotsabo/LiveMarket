//
//  LiveMarketUITests.swift
//  LiveMarketUITests
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import XCTest

class LiveMarketUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCUIApplication().buttons.staticTexts["ENTER"]
        XCUIApplication().staticTexts["The Market"]
        
        let cells = XCUIApplication().tables.cells
        XCTAssertEqual(cells.count, 0, "found instead: \(cells.debugDescription)")
        
    }
    
}
