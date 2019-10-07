//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Cedric on 06/10/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

class CalculatorLogic {
    var textView: TextView!
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
}
