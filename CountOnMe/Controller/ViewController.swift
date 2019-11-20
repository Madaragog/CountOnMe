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
//    receive the notification
    override func viewDidLoad() {
        super.viewDidLoad()
        let equalResult = Notification.Name(rawValue: "result")
        NotificationCenter.default.addObserver(self, selector: #selector(result), name: equalResult, object: nil)
    }
//    remove the observer
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("result"), object: nil)
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
        if calculator.canAddOperator(elements: elements) {
            textView.text.append(" x ")
        } else {
            alerteVC(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calculator.canAddOperator(elements: elements) {
            textView.text.append(" / ")
        } else {
            alerteVC(message: "Un operateur est déja mis !")
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.result()
    }

    @IBAction func tappedACButton(_ sender: UIButton) {
        textView.text.removeAll()
    }
//    When called it shows an alerte with a message
    private func alerteVC(message: String) {
        let alertVC: UIAlertController = UIAlertController(title: "Zéro!", message:
            message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
//  shows the result
    @objc private func result() {
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
}
