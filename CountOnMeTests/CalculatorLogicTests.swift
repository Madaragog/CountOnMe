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

    func testGivenLastElementIsPlus_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["7", "1", "+"]))
    }

    func testGivenLastElementIsLess_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["4", "6", "-"]))
    }

    func testGivenLastElementIsDivided_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["4", "6", "/"]))
    }

    func testGivenLastElementIs5_WhenTestingExpressionIsCorrect_ThenItShouldBeTrue() {
        XCTAssertTrue(calculator.expressionIsCorrect(elements: ["3", "+", "5"]))
    }

    func testGivenNumberOfElementIs2_WhenTestingExpressionHasEnoughElement_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionHasEnoughElement(elements: ["2", "1"]))
    }

    func testGivenNumberOfElementIs3_WhenTestingExpressionHasEnoughElement_ThenItShouldBeTrue() {
        XCTAssertTrue(calculator.expressionHasEnoughElement(elements: ["5", "-", "8"]))
    }
// tester le true
    func testGivenLastElementIsPlus_WhenTestingCanAddOperator_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.canAddOperator(elements: ["2", "4", "+"]))
    }

    func testGivenLastElementIsLess_WhenTestingCanAddOperator_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.canAddOperator(elements: ["3", "7", "-"]))
    }

    func testGivenLastElementIsDifferentThanPlusOrLess_WhenTestingCanAddOperator_ThenItShouldBeFalse() {
        XCTAssertTrue(calculator.canAddOperator(elements: ["6", "2", "+", "4"]))
    }

    func testGivenElementContainsEqual_WhenTestingExpressionHasResult_ThenItShouldBeTrue() {
        XCTAssertTrue(calculator.expressionHasResult(elements: ["7", "1", "="]))
    }

    func testGivenElementContainsEqual_WhenTestingExpressionHasResult_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionHasResult(elements: ["8", "2", "9"]))
    }
}
