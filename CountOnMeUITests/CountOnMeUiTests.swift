//
//  CountOnMeUiTests.swift
//  CountOnMeUITests
//
//  Created by Cedric on 01/11/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest

class CountOnMeUiTests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCalcul() {
        app.buttons["2"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        XCTAssertEqual(app.textViews["text"].value as? String, "245")
    }

    func testTime() {
        measure {
            app.buttons["2"].tap()
            app.buttons["4"].tap()
            app.buttons["5"].tap()
            app.buttons["AC"].tap()
        }
    }
}
