//
//  TipCalViewModel.swift
//  TipCalculator
//
//  Created by Mayuresh Rao on 12/5/20.
//

import Foundation

class Tip {
    func calculateTip(tip: TipModel) -> (Double, Double) {
        let tipAmt = tip.totalAmount * tip.tipPercentage / 100
        let newTotal = tip.totalAmount + tipAmt
        return (tipAmt/tip.numberOfPeople, newTotal/tip.numberOfPeople)
    }
}
