//
//  StringExtension.swift
//  GVKit
//

import Foundation
import UIKit

public extension String {
    
    var isValidCPF: Bool {
        let trimmedSelf = self.trimmingCharacters(in: CharacterSet.decimalDigits.inverted)
        guard trimmedSelf.count == 11 else { return false }
        
        let d1 = Int(trimmedSelf[9])
        let d2 = Int(trimmedSelf[10])
        
        var temp1 = 0, temp2 = 0
        
        for index in 0...8 {
            let char = Int(trimmedSelf[index])!
            
            temp1 += char * (10 - index)
            temp2 += char * (11 - index)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : (11 - temp1)
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : (11 - temp2)
        
        return temp1 == d1 && temp2 == d2
    }
    
    func index(at offset: Int) -> String.Index {
        return self.index(self.startIndex, offsetBy: offset)
    }
    
    subscript(index: Int) -> Character {
        return self[self.index(at: index)]
    }

    subscript(range: Range<Int>) -> Substring {
        return self[range.toRange(of: self)]
    }
    
    subscript(range: ClosedRange<Int>) -> Substring {
        return self[range.toRange(of: self)]
    }
    
    subscript(range: PartialRangeFrom<Int>) -> Substring {
        return self[range.toRange(of: self)]
    }
    
    subscript(range: PartialRangeThrough<Int>) -> Substring {
        return self[range.toRange(of: self)]
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> Substring {
        return self[range.toRange(of: self)]
    }
    
    /// Replace the given 'subrange' of elements with 'newElements'
    mutating func replaceSubrange(_ subrange: Range<Int>, with newElements: String) {
        self.replaceSubrange(subrange.toRange(of: self), with: newElements)
    }
    
    /// Returns a new string in which all occurrences of a target
    /// string in a specified range of the 'String' are replaced by
    /// another given string.
    func replacingOccurrences(of target: String, with string: String, options: NSString.CompareOptions, range: Range<Int>) -> String {
        return self.replacingOccurrences(of: target, with: string, options: options, range: range.toRange(of: self))
    }
    
    var firstCharacterCapitalized: String {
        guard self.isEmpty == false else { return self }
        let first = self.prefix(1).capitalized
        let other = self.dropFirst()
        return String(first + other)
    }
    
}
