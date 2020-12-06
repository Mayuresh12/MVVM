//
//  Extensions.swift
//  TipCalculator
//
//  Created by Mayuresh Rao on 12/5/20.
//

import Foundation

extension Double {
    var  toString: String {
        return String.init(format: "%0.2", self)
    }
}

extension String {
    var toDouble: Double? {
        return Double(self)
    }
}
