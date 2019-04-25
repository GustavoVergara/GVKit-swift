//
//  OptionSetExtension.swift
//  GVKit
//

extension OptionSet {
    
    /// If the Bool passed is true the member is inserted into `self`, otherwise the member is removed from `self`
    mutating func `if`(_ bool: Bool, use member: Self.Element) {
        if bool {
            self.insert(member)
        } else {
            self.remove(member)
        }
    }
    
}
