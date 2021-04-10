//
//  String+Extension.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import Foundation

extension String {
     public func localized(with value: String = "") -> String {
        return String(format: NSLocalizedString(self, comment: "" ), value)
    }
}
