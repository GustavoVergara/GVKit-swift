//
//  Range+NS.swift
//  GVKit
//
//  Created by Gustavo Vergara Garcia on 25/04/19.
//

import Foundation

public extension Range where Bound == Int {
    
    /// Use for converting Range<Int> to NSRange object
    ///
    /// Usage:
    ///```swift
    ///  let range = 10..<15
    ///  println(range.startIndex) // 10
    ///  println(range.endIndex)  // 15
    ///  let convertedRange = range.toNSRange() // (10,5)
    ///  println(convertedRange.location) // 10
    ///  println(convertedRange.length) // 5
    ///```
    
    func toNSRange() -> NSRange {
        let loc = self.lowerBound
        
        let len = self.upperBound - loc
        
        return NSMakeRange(loc, len)
    }
    
}
