//
//  Date+Extension.swift
//  Soul
//
//  Created by Aswani G on 4/11/21.
//

import Foundation


extension Formatter {
    static let displayDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
