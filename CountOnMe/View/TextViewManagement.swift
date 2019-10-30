//
//  TextViewManagement.swift
//  CountOnMe
//
//  Created by Cedric on 30/10/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

class TextViewManagement: UITextView {
    override func setNeedsDisplay() {
        isUserInteractionEnabled = false
    }
}
