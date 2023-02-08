//
//  Double.swift
//  CryptoPriceCharts
//
//  Created by Sergey Petrosyan on 08.02.23.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var percentFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func formattedToCurrencyString() -> String {
        currencyFormatter.string(from: self as NSNumber) ?? "$0.00"
    }
    
    func formattedToPercentString() -> String {
        guard let stringFormattedToPercent = percentFormatter.string(from: self as NSNumber) else { return "0.00%" }
        return stringFormattedToPercent + "%"
    }
}
