//
//  OptionSetExtension.swift
//  GVKit
//

import Foundation

extension OptionSet {
    
    mutating func `if`(_ bool: Bool, use member: Self.Element) {
        if bool {
            self.insert(member)
        } else {
            self.remove(member)
        }
    }
    
}
