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

    func testDontContainsEqual_WhenTestingExpressionHasResult_ThenItShouldBeFalse() {
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

    func testGivenElementsAre7DivisedBy0_WhenTestingEqualFunc_ThenResultShouldBeInf() {
        XCTAssertEqual(calculator.equalFunc(elements: ["7", "/", "0"]), "inf")
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

    func testGivenElementsAre1Plus6Less4MultiBy70DiviBy100_WhenTestingEqualFunc_ThenResultShouldBe4Point2() {
        XCTAssertEqual(calculator.equalFunc(elements: ["1", "+", "6", "-", "4", "x", "70", "/", "100"]), "4.2")
    }

    func testGivenElementsAre2Less4Plus6MultiplicatedBy9DivisedBy3_WhenTestingEqualFunc_ThenResultShouldBe16() {
        XCTAssertEqual(calculator.equalFunc(elements: ["2", "-", "4", "+", "6", "x", "9", "/", "3"]), "16.0")
    }

    func testGivenElementsAre24Less35MultiBy1Plus27DiviBy7_WhenTestingEqualFunc_ThenResultShouldBeLess7Point142857() {
        XCTAssertEqual(calculator.equalFunc(elements: ["24", "-", "35", "x", "1", "+", "27", "/", "7"]), "-7.142857")
    }

    func testGivenElementsAre13Less1MultiBy34DiviBy54Plus0_WhenTestingEqualFunc_ThenResultShouldBe12Point3703() {
        XCTAssertEqual(calculator.equalFunc(elements: ["13", "-", "1", "x", "34", "/", "54", "+", "0"]), "12.370371")
    }

    func testGivenElementsAre0Less4Plus3DiviBy13MultiBy9_WhenTestingEqualFunc_ThenResultShouldBeLess1Point9230769() {
        XCTAssertEqual(calculator.equalFunc(elements: ["0", "-", "4", "+", "3", "/", "13", "x", "9"]), "-1.9230769")
    }

    func testGivenElementsAre4Plus1Less2DiviBy63MultiBy20_WhenTestingEqualFunc_ThenResultShouldBe4Point3650794() {
        XCTAssertEqual(calculator.equalFunc(elements: ["4", "+", "1", "-", "2", "/", "63", "x", "20"]), "4.3650794")
    }

    func testGivenElementsAre2Plus5DiviBy4Less45MultiBy12_WhenTestingEqualFunc_ThenResultShouldBeLess536Point75() {
        XCTAssertEqual(calculator.equalFunc(elements: ["2", "+", "5", "/", "4", "-", "45", "x", "12"]), "-536.75")
    }

    func testGivenElementsAre8Plus11DiviBy3MultiBy5Less10_WhenTestingEqualFunc_ThenResultShouldBe16Point333334() {
        XCTAssertEqual(calculator.equalFunc(elements: ["8", "+", "11", "/", "3", "x", "5", "-", "10"]), "16.333334")
    }

    func testGivenElementsAre24DiviBy6MultiBy2Plus1Less4_WhenTestingEqualFunc_ThenResultShouldBe5() {
        XCTAssertEqual(calculator.equalFunc(elements: ["24", "/", "6", "x", "2", "+", "1", "-", "4"]), "5.0")
    }

    func testGivenElementsAre7MultiBy5DiviBy3Plus9Less0_WhenTestingEqualFunc_ThenResultShouldBe20Point666668() {
        XCTAssertEqual(calculator.equalFunc(elements: ["7", "x", "5", "/", "3", "+", "9", "-", "0"]), "20.666668")
    }

    func testGivenElementsAre12MultiBy1Plus14DiviBy7Less2_WhenTestingEqualFunc_ThenResultShouldBe12() {
        XCTAssertEqual(calculator.equalFunc(elements: ["12", "x", "1", "+", "14", "/", "7", "-", "2"]), "12.0")
    }

    func testGivenElementsAre72MultiBy3Plus4Less150DiviBy2_WhenTestingEqualFunc_ThenResultShouldBe145() {
        XCTAssertEqual(calculator.equalFunc(elements: ["72", "x", "3", "+", "4", "-", "150", "/", "2"]), "145.0")
    }

    func testGivenElementsAre24Multi51DiviBy20Less1Plus2_WhenTestingEqualFunc_ThenResultShouldBe65Point2() {
        XCTAssertEqual(calculator.equalFunc(elements: ["24", "x", "51", "/", "20", "-", "1", "+", "5"]), "65.2")
    }

    func testGivenElementsAre30DiviBy6MultiBy2Less100Plus75_WhenTestingEqualFunc_ThenResultShouldBeLess15() {
        XCTAssertEqual(calculator.equalFunc(elements: ["30", "/", "6", "x", "2", "-", "100", "+", "75"]), "-15.0")
    }

    func testGivenElementsAre8DiviBy8Less2MultiBy25Plus42_WhenTestingEqualFunc_ThenResultShouldBeLess7() {
        XCTAssertEqual(calculator.equalFunc(elements: ["8", "/", "8", "-", "2", "x", "25", "+", "42"]), "-7.0")
    }

    func testGivenElementsAre69DiviBy22Less90Plus80MultiBy1_WhenTestingEqualFunc_ThenResultShouldBeLess6Point86364() {
        XCTAssertEqual(calculator.equalFunc(elements: ["69", "/", "22", "-", "90", "+", "80", "x", "1"]), "-6.86364")
    }

    func testGivenElementsAre3MultiBy0Less7Plus3DiviBy0_WhenTestingEqualFunc_ThenResultShouldBeInf() {
        XCTAssertEqual(calculator.equalFunc(elements: ["3", "x", "0", "-", "7", "+", "3", "/", "0"]), "inf")
    }
}
