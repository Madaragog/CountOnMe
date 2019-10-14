//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Cedric on 06/10/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorLogic {

    // Error check computed variables
    func expressionIsCorrect(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-"
    }

    func expressionHasEnoughElement(elements: [String]) -> Bool {
        return elements.count >= 3
    }

    func canAddOperator(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-"
    }

    func expressionHasResult(elements: [String]) -> Bool {
        return elements.contains("=")
    }
}
