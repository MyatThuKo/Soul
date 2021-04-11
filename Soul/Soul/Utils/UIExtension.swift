//
//  UIExtension.swift
//  Soul
//
//  Created by Mark Rachapoom on 11/4/21.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
#endif
