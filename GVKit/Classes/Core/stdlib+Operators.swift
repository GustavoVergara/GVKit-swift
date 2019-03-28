//
//  Operators.swift
//  GVKit
//

// Division By Int

public func /(lhs: Double, rhs: Int) -> Double {
    return lhs / Double(rhs)
}

public func /(lhs: Float, rhs: Int) -> Float {
    return lhs / Float(rhs)
}

// Multiplication by Int

public func *(lhs: Double, rhs: Int) -> Double {
    return lhs * Double(rhs)
}

public func *(lhs: Float, rhs: Int) -> Float {
    return lhs * Float(rhs)
}

// Multiplication by Double

public func *(lhs: Float, rhs: Double) -> Float {
    return lhs * Float(rhs)
}

// Multiplication by Double

public func *(lhs: Double, rhs: Float) -> Double {
    return lhs * Double(rhs)
}
