//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: TextView!

    @IBOutlet var numberButtons: [UIButton]!

    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }

    var expressionHasEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-"
    }

    var expressionHasResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }

        if expressionHasResult {
            textView.text = ""
        }

        textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" + ")
        } else {
            alerteVCAdditionAndSubstractionButton(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" - ")
        } else {
            alerteVCAdditionAndSubstractionButton(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
            alerteVCEqualButton(message: "Entrez une expression correcte !")
            return
        }

        guard expressionHasEnoughElement else {
            alerteVCEqualButton(message: "Démarrez un nouveau calcul !")
            return
        }

        // Create local copy of operations
        var operationsToReduce = elements

        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!

            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        textView.text.append(" = \(operationsToReduce.first!)")
    }

    @IBAction func tappedACButton(_ sender: UIButton) {
    }

    private func alerteVCAdditionAndSubstractionButton(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message:
            message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    private func alerteVCEqualButton(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
    }
}
