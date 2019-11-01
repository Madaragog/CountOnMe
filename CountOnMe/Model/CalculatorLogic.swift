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
        return elements.last != "+" && elements.last != "-"
    }

    func expressionHasResult(elements: [String]) -> Bool {
        return elements.contains("=")
    }
//    performe calcul
    @objc func equalFunc(elements: [String]) -> String? {
        var operationsToReduce: [String] = elements
        if elements[0] == "-" {
            operationsToReduce[0] = "\(elements[0])\(elements[1])"
            operationsToReduce.remove(at: 1)
        }
        while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
            if calculatePriorities(operationsToReduce: operationsToReduce) != nil {
                operationsToReduce = calculatePriorities(operationsToReduce: operationsToReduce)!
            }
        }
        while operationsToReduce.count > 1 {
        guard operationsToReduce.count >= 3 else {return operationsToReduce.first}
        guard let left: Float = Float(operationsToReduce[0]) else {break}
        let operand = operationsToReduce[1]
        guard let right: Float = Float(operationsToReduce[2]) else {break}
        let result: Float
        switch operand {
        case "+": result = left + right
        case "-": result = left - right
        default: return nil
        }
        operationsToReduce = Array(operationsToReduce.dropFirst(3))
        operationsToReduce.insert("\(result)", at: 0)
        }
        return operationsToReduce.first
    }
//    calculate the priorities when the calcul contains a division and\or a multiplication
    private func calculatePriorities(operationsToReduce: [String]) -> [String]? {
        var prioritiesCalculated: [String] = operationsToReduce
        while prioritiesCalculated.contains("x") || prioritiesCalculated.contains("/") {
                if let index = prioritiesCalculated.firstIndex(where: { $0 == "x" || $0 == "/"}) {
                    guard let left: Float = Float(prioritiesCalculated[index - 1]) else {break}
                    let operand = prioritiesCalculated[index]
                    guard let right: Float = Float(prioritiesCalculated[index + 1]) else {break}
                    let result: Float
                    switch operand {
                    case "x": result = left * right
                    case "/": result = left / right
                        if right == 0 {
                            break
                            }
                    default: return nil
                    }
                    prioritiesCalculated[index - 1] = "\(result)"
                    prioritiesCalculated.remove(at: index)
                    prioritiesCalculated.remove(at: index)
                }
        }
        return prioritiesCalculated
    }
}
