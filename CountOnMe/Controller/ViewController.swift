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

    private var calculator: CalculatorLogic = CalculatorLogic()

    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText: String = sender.title(for: .normal) else {
            return
        }
        if calculator.expressionHasResult(elements: elements) {
            textView.text = ""
        }
        textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculator.canAddOperator(elements: elements) {
            textView.text.append(" + ")
        } else {
            alerteVC(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculator.canAddOperator(elements: elements) {
            textView.text.append(" - ")
        } else {
            alerteVC(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculator.canAddOperator(elements: elements) {
            textView.text.append(" / ")
        } else {
            alerteVC(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculator.expressionIsCorrect(elements: elements) else {
            alerteVC(message: "Entrez une expression correcte !, démarrez un nouveau calcul !")
            return
        }
        if let result: String = calculator.equalFunc(elements: elements) {
            textView.text.append(" = \(result)")
        } else {
            alerteVC(message: "Désoler mais aucun résultat n˙a été trouvé")
        }
    }
// REVOIR OPTIONNELS ET UNWRAP ET TYPE mettre le type avec deux points essayer de typer le code (let var)
    @IBAction func tappedACButton(_ sender: UIButton) {
    }

    private func alerteVC(message: String) {
        let alertVC: UIAlertController = UIAlertController(title: "Zéro!", message:
            message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
