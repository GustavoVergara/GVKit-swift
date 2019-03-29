//
//  RangeExtension.swift
//  GVKit
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

public extension Range where Bound == Int {

    /// Use for converting Range<Int> to Range<String.Index> object for target string.
    ///
    /// Usage:
    ///```swift
    ///  let str = "Hello World!"
    ///  let convertedRange = (6..<11).toRange(of: str)
    ///```

    func toRange(of string: String) -> Range<String.Index> {
        guard self.upperBound <= string.count else {
            return string.index(at: self.lowerBound)..<string.endIndex
        }
        
        return string.index(at: self.lowerBound)..<string.index(at: self.upperBound)
    }

}

public extension ClosedRange where Bound == Int {
    
    func toRange(of string: String) -> ClosedRange<String.Index> {
        guard self.upperBound <= string.count else {
            return string.index(at: self.lowerBound)...string.endIndex
        }
        
        return string.index(at: self.lowerBound)...string.index(at: self.upperBound)
    }
    
}

public extension PartialRangeFrom where Bound == Int {
    
    func toRange(of string: String) -> PartialRangeFrom<String.Index> {
        return string.index(at: self.lowerBound)...
    }
    
}

public extension PartialRangeThrough where Bound == Int {
    
    func toRange(of string: String) -> PartialRangeThrough<String.Index> {
        if self.upperBound <= string.count {
            return ...string.index(at: self.upperBound)
        } else {
            return ...string.endIndex
        }
    }

}

public extension PartialRangeUpTo where Bound == Int {
    
    func toRange(of string: String) -> PartialRangeUpTo<String.Index> {
        if self.upperBound <= string.count {
            return ..<string.index(at: self.upperBound)
        } else {
            return ..<string.endIndex
        }
    }
    
}
