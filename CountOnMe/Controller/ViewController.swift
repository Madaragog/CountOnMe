//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    private var calculator = CalculatorLogic()

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if calculator.expressionHasResult(elements: [textView.text]) {
            textView.text = ""
        }
        textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator(elements: [textView.text]) {
            textView.text.append(" + ")
        } else {
            alerteVC(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator(elements: [textView.text]) {
            textView.text.append(" - ")
        } else {
            alerteVC(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect(elements: [textView.text]) else {
            alerteVC(message: "Entrez une expression correcte !")
            return
        }

        guard calculator.expressionIsCorrect(elements: [textView.text]) else {
            alerteVC(message: "Démarrez un nouveau calcul !")
            return
        }

        // Create local copy of operations
        var operationsToReduce = [textView.text]

        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0]!)!
                let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2]!)!

                let result: Int
                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                default: fatalError("Unknown operator !")
                }
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(result)", at: 0)
        }
        textView.text.append(" = \(String(describing: operationsToReduce.first!))")
    }

    @IBAction func tappedACButton(_ sender: UIButton) {
    }

    private func alerteVC(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message:
            message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
