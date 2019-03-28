//
//  MinMax.swift
//  GVKit
//

import Foundation

public func minmax<T>(_ value: T, min minValue: T, max maxValue: T) -> T where T : Comparable {
    return min(max(value, minValue), maxValue)
}
