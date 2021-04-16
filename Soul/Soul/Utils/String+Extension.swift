//
//  String+Extension.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation
import SwiftUI

// MARK: - STRING
extension String {
     
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }

    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{6,}$").evaluate(with: self)
    }
    
    public func localized(with value: String = "") -> String {
       return String(format: NSLocalizedString(self, comment: "" ), value)
   }
}
