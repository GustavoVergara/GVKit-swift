//
//  StringExtension.swift
//  GVKit
//

import Foundation
import UIKit

public extension String {
    
    var isValidCPF: Bool {
        let trimmedSelf = self.trimmingCharacters(in: CharacterSet.decimalDigits.inverted)
        guard self.count == 11 else { return false }
        
        let d1 = Int(trimmedSelf.substring(with: 9..<10))
        
        let d2 = Int(trimmedSelf.substring(with: 10..<11))
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let char = Int(trimmedSelf.substring(with: i..<i+1))!
            
            temp1 += char * (10 - i)
            temp2 += char * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : (11 - temp1)
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : (11 - temp2)
        
        return temp1 == d1 && temp2 == d2
    }
    
    subscript(range: Range<Int>) -> String {
        return self.substring(with: range)
    }
    
    func beginsWith(_ str: String) -> Bool {
        if let range = self.range(of: str) {
            return range.lowerBound == self.startIndex
        }
        return false
    }
    
    func endsWith(_ str: String) -> Bool {
        if let range = self.range(of: str, options: .backwards) {
            return range.upperBound == self.endIndex
        }
        return false
    }
    
    func index(at offset: Int) -> String.Index {
        return self.index(self.startIndex, offsetBy: offset)
    }
    
    /// Returns a string object containing the characters of the
    /// string that lie within a given range.
    ///
    /// Usage:
    ///
    ///  ```swift
    ///  let str = "Hello World!"
    ///  let newString = str.substring(with: 6..<12) -> "World!"
    ///  ```
    func substring(with range: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    func substring(from index: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[startIndex...])
    }
    
    func substring(to index: Int) -> String {
        let endIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[...endIndex])
    }
    
    /// Replace the given 'subRange' of elements with 'newElements'
    ///
    /// Usage:
    ///
    ///  var str = "Hello World!"
    ///  str.replaceSubrange(6..<11, with: "Kitty") // "Hello Kitty!"
    
    mutating func replaceSubrange(_ subrange: Range<Int>, with newElements: String) {
        self.replaceSubrange(subrange.toRange(of: self), with: newElements)
    }
    
    /// Returns a new string in which all occurrences of a target
    /// string in a specified range of the 'String' are replaced by
    /// another given string.
    ///
    /// Usage:
    ///
    ///  var str = "Hello World, World!"
    ///  str = str.stringByReplacingOccurrencesOfString("World", withString: "Kitty", options: NSStringCompareOptions(0), aRange: 6..<11)
    
    func replacingOccurrences(of target: String, with string: String, options: NSString.CompareOptions, range: Range<Int>) -> String {
        return self.replacingOccurrences(of: target, with: string, options: options, range: range.toRange(of: self))
    }
    
    func capitalizingFirstCharacter() -> String {
        let first = self.prefix(1).capitalized
        let other = self.dropFirst()
        return String(first + other)
    }
}



public extension Optional where Wrapped == String {
    
    var isNilOrEmpty: Bool {
        return self == nil || self?.isEmpty == true
    }
    
}

