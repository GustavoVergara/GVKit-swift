//
//  DoubleExtensions.swift
//  GVKit
//

public extension Double {
    
    /// Rounds a decimal to `digits` decimal places.
    func rounded(upTo digits: Int) -> Double {
        let behavior = NSDecimalNumberHandler(roundingMode: .bankers, scale: Int16(digits), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        return NSDecimalNumber(value: self).rounding(accordingToBehavior: behavior).doubleValue
    }
    
}

public extension Decimal {
    
    /// Rounds a decimal to `digits` decimal places.
    func rounded(upTo digits: Int) -> Decimal {
        let behavior = NSDecimalNumberHandler(roundingMode: .bankers, scale: Int16(digits), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        return NSDecimalNumber(decimal: self).rounding(accordingToBehavior: behavior).decimalValue
    }
    
}
