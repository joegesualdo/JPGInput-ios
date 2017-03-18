//
//  JPGInputDelegate.swift
//  JPGInput
//
//  Created by Joe Gesualdo on 3/18/17.
//  Copyright © 2017 Joe Gesualdo. All rights reserved.
//

import Foundation
import UIKit

protocol JPGInputDelegate: UITextFieldDelegate {
  func textFieldIsValid(_ textField: UITextField) -> Bool
}
