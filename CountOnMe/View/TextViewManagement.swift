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
//        with this the user can copy and past but the keyboard doesn't show when the textView is tapped
        inputView = UIView()
    }
}
