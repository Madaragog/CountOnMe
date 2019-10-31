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

    func testGivenLastElementIsMultiplicated_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["56", "12", "x"]))
    }

    func testGivenLastElementIs5_WhenTestingExpressionIsCorrect_ThenItShouldBeTrue() {
        XCTAssertTrue(calculator.expressionIsCorrect(elements: ["3", "+", "5"]))
    }

    func testGivenFirstElementIsLess_WhenTestingExpressionIsCorrect_ThenItShouldBeTrue() {
        XCTAssertTrue(calculator.expressionIsCorrect(elements: ["-", "2", "+", "95"]))
    }

    func testGivenFirstElementIsPlus_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["+", "55", "/", "5"]))
    }

    func testGivenFirstElementIsMultiplicated_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["x", "42", "+", "7"]))
    }

    func testGivenFirstElementIsDivised_WhenTestingExpressionIsCorrect_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionIsCorrect(elements: ["/", "39", "-", "8"]))
    }

    func testGivenNumberOfElementIs2_WhenTestingExpressionHasEnoughElement_ThenItShouldBeFalse() {
        XCTAssertFalse(calculator.expressionHasEnoughElement(elements: ["2", "1"]))
    }

    func testGivenNumberOfElementIs3_WhenTestingExpressionHasEnoughElement_ThenItShouldBeTrue() {
        XCTAssertTrue(calculator.expressionHasEnoughElement(elements: ["5", "-", "8"]))
    }

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

    func testGivenElementsAre1plus3_WhenTestingEqualFunc_ThenResultShouldBe4() {
        XCTAssertEqual(calculator.equalFunc(elements: ["1", "+", "3"]), "4.0")
    }

    func testGivenElementsAre4less3_WhenTestingEqualFunc_ThenResultShouldBe1() {
        XCTAssertEqual(calculator.equalFunc(elements: ["4", "-", "3"]), "1.0")
    }

    func testGivenElementsAreLess2Plus4_WhenTestingEqualFunc_ThenResultShouldBe2() {
        XCTAssertEqual(calculator.equalFunc(elements: ["-2", "+", "4"]), "2.0")
    }

    func testGivenElementsAre1Plus1Less4_WhenTestingEqualFunc_ThenResultShouldBeLess2() {
        XCTAssertEqual(calculator.equalFunc(elements: ["1", "+", "1", "-", "4"]), "-2.0")
    }

    func testGivenElementsAre6DivisedBy3_WhenTestingEqualFunc_ThenResultShouldBe2() {
        XCTAssertEqual(calculator.equalFunc(elements: ["6", "/", "3"]), "2.0")
    }

    func testGivenElementsAre7DivisedBy3_WhenTestingEqualFunc_ThenResultShouldBe3Point5() {
        XCTAssertEqual(calculator.equalFunc(elements: ["7", "/", "2"]), "3.5")
    }

    func testGivenElementsAre8MultiplicatedBy4_WhenTestingEqualFunc_ThenResultShouldBe32() {
        XCTAssertEqual(calculator.equalFunc(elements: ["8", "x", "4"]), "32.0")
    }

    func testGivenElementsAre6MultiplicatedBy4DivisedBy2_WhenTestingEqualFunc_ThenResultShouldBe12() {
        XCTAssertEqual(calculator.equalFunc(elements: ["6", "x", "4", "/", "2"]), "12.0")
    }

    func testGivenElementsAre8DivisedBy8MultiplicatedBy7_WhenTestingEqualFunc_ThenResultShouldBe7() {
        XCTAssertEqual(calculator.equalFunc(elements: ["8", "/", "8", "x", "7"]), "7.0")
    }

    func testGivenElementsAre1MultiplicatedBy7DivisedBy3_WhenTestingEqualFunc_ThenResultShouldBe3Point5() {
        XCTAssertEqual(calculator.equalFunc(elements: ["1", "x", "7", "/", "3"]), "2.3333333")
    }

    func testGivenElementsAre6DivisedBy5MultiplicatedBy9_WhenTestingEqualFunc_ThenResultShouldBe10Point8() {
        XCTAssertEqual(calculator.equalFunc(elements: ["6", "/", "5", "x", "9"]), "10.8")
    }

    func testGivenElementsAre1MultiBy6DiviBy4MultiBy70DiviBy100_WhenTestingEqualFunc_ThenResultShouldBe1Point05() {
        XCTAssertEqual(calculator.equalFunc(elements: ["1", "x", "6", "/", "4", "x", "70", "/", "100"]), "1.05")
    }

    func testGivenElementsAre2Plus4Less6MultiplicatedBy9DivisedBy3_WhenTestingEqualFunc_ThenResultShouldBeLess12() {
        XCTAssertEqual(calculator.equalFunc(elements: ["2", "+", "4", "-", "6", "x", "9", "/", "3"]), "-12.0")
    }
}
