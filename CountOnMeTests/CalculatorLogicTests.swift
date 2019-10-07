//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Cedric on 06/10/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTextViewTests: XCTestCase {
    func testGivenInstanceofCalculatorLogic_WhenAccessingIt_TheItShouldExists() {
        let calculatorLogic = CalculatorLogic()

        XCTAssertNotNil(calculatorLogic)
    }

    
}
