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
    var  calculator: CalculatorLogic!

    override func setUp() {
        super.setUp()
        calculator = CalculatorLogic()
    }

    func testGivenLastElementIsPlusOrLess_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["7", "1", "+"]))
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["7", "1", "-"]))
    }

    func testGivenLastElementIs1_WhenTestingExpressionIsCorrect_ThenItShouldBeTrue() {
        XCTAssertTrue(calculator.expressionIsCorrect(elements: ["7", "+", "1"]))
    }

    func testGivenNumberOfElementIs2_WhenTestingExpressionHasEnoughElement_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionHasEnoughElement(elements: ["2", "1"]))
    }

    func testGivenLastElementIsPlusOrLess_WhenTestingCanAddOperator_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.canAddOperator(elements: ["7", "1", "+"]))
        XCTAssertFalse(calculator.canAddOperator(elements: ["7", "1", "-"]))
    }

    func testGivenElementContainsEqual_WhenTestingExpressionHasResult_ThenItShouldBeFalse() {
        XCTAssertTrue(calculator.expressionHasResult(elements: ["7", "1", "="]))
    }
}
