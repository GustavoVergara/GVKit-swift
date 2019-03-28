//
//  Operators.swift
//  GVKit
//

import UIKit

public func /(lhs: CGFloat, rhs: Int) -> CGFloat {
    return lhs / CGFloat(rhs)
}

public func /(lhs: CGFloat, rhs: Double) -> CGFloat {
    return lhs / CGFloat(rhs)
}

public func /(lhs: CGFloat, rhs: Float) -> CGFloat {
    return lhs / CGFloat(rhs)
}

public func *(lhs: CGFloat, rhs: Int) -> CGFloat {
    return lhs * CGFloat(rhs)
}

public func *(lhs: CGFloat, rhs: Double) -> CGFloat {
    return lhs * CGFloat(rhs)
}

public func *(lhs: CGFloat, rhs: Float) -> CGFloat {
    return lhs * CGFloat(rhs)
}

public func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

public func *(lhs: CGSize, rhs: Double) -> CGSize {
    return CGSize(width: lhs.width * CGFloat(rhs), height: lhs.height * CGFloat(rhs))
}

public func *(lhs: CGSize, rhs: Int) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}
