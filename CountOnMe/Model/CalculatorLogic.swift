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
        return elements.last != "+" && elements.last != "-" && elements.last != "/"
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

    @objc func equalFunc(elements: [String]) -> String? {
//        mettre des guard et unwrap left
        // Create local copy of operations
        var operationsToReduce: [String] = elements

        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            if operationsToReduce[0] == "+" || operationsToReduce[0] == "-" ||
                operationsToReduce[0] == "x" || operationsToReduce[0] == "/" {
                operationsToReduce = [""]
            }

            guard let left: Float = Float(operationsToReduce[0]) else {break}
                let operand = operationsToReduce[1]
            guard let right: Float = Float(operationsToReduce[2]) else {break}

                let result: Float
                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                case "/": result = left / right
                case "x": result = left * right
                default: return nil
                }
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(result)", at: 0)
        }
        return operationsToReduce.first
    }
}
