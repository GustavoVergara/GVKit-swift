//
//  RangeExtension.swift
//  GVKit
//

import Foundation

extension Range where Bound == Int {
    
    /// Use for converting Range<Int> to Range<String.Index> object for target string.
    ///
    /// Usage:
    ///```swift
    ///  let str = "Hello World!"
    ///  let convertedRange = (6..<11).toRange(of: str)
    ///```
    
    public func toRange(of string: String) -> Range<String.Index> {
        guard self.upperBound <= string.count else {
            return string.index(at: self.lowerBound)..<string.endIndex
        }
        
        return string.index(at: self.lowerBound)..<string.index(at: self.upperBound)
    }
    
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
    
    public func toNSRange() -> NSRange {
        let loc = self.lowerBound
        
        let len = self.upperBound - loc
        
        return NSMakeRange(loc, len)
    }
    
}
