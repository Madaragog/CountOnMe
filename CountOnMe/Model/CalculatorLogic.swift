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
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "x" &&
            elements.first != "+" && elements.first != "/" && elements.first != "x"
    }

    func expressionHasEnoughElement(elements: [String]) -> Bool {
        return elements.count >= 3
    }

    func canAddOperator(elements: [String]) -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "x"
    }

    func expressionHasResult(elements: [String]) -> Bool {
        return elements.contains("=")
    }
//    performe calcul
    @objc func equalFunc(elements: [String]) -> String? {
        var operationsToReduce: [String] = elements
//        if the first index is a subtraction operator than it's a negative number so it
//        merges the first and the second index
        if operationsToReduce[0] == "-" {
            operationsToReduce[0] = "\(operationsToReduce[0])\(operationsToReduce[1])"
            operationsToReduce.remove(at: 1)
        }
        while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
            if let result = calculatePriorities(operationsToReduce: operationsToReduce) {
                operationsToReduce = result
            } else {
                return nil
            }
        }
        while expressionHasEnoughElement(elements: operationsToReduce) {
            if let result = calculateAdditionAndSubtraction(operationsToReduce: operationsToReduce) {
                operationsToReduce = result
            } else {
                return nil
            }
        }
        return operationsToReduce.first
    }
//    calculate the addition and subtraction
    private func calculateAdditionAndSubtraction(operationsToReduce: [String]) -> [String]? {
        var additionAndSubtraction: [String] = operationsToReduce
        guard let left: Float = Float(additionAndSubtraction[0]) else {
            return nil
        }
        let operand = additionAndSubtraction[1]
        guard let right: Float = Float(additionAndSubtraction[2]) else {
            return nil
        }
        let result: Float
        switch operand {
        case "+": result = left + right
        case "-": result = left - right
        default: return nil
        }
        additionAndSubtraction = Array(additionAndSubtraction.dropFirst(3))
        additionAndSubtraction.insert("\(result)", at: 0)
        return additionAndSubtraction
    }
//    calculate the priorities when the calcul contains a division and\or a multiplication
    private func calculatePriorities(operationsToReduce: [String]) -> [String]? {
        var prioritiesCalculated: [String] = operationsToReduce
        if let index = prioritiesCalculated.firstIndex(where: { $0 == "x" || $0 == "/"}) {
            guard let left: Float = Float(prioritiesCalculated[index - 1]) else {
                return nil
            }
            let operand = prioritiesCalculated[index]
            guard let right: Float = Float(prioritiesCalculated[index + 1]) else {
                return nil
            }
            let result: Float
            switch operand {
            case "x":
                result = left * right
            case "/":
                if right == 0 {
                    return nil
                } else {
                    result = left / right
                }
            default:
                return nil
            }
            prioritiesCalculated[index - 1] = "\(result)"
            prioritiesCalculated.remove(at: index)
            prioritiesCalculated.remove(at: index)
        }
        return prioritiesCalculated
    }
}
