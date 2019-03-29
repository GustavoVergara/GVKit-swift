//
//  OptionalExtensions.swift
//  GVKit
//

import Foundation

public extension Optional {
    
    func unwraped() throws -> Wrapped {
        if let unwraped = self {
            return unwraped
        } else {
            throw Error.foundNilWhileUnwrappingOptional(Wrapped.self)
        }
    }
    
    enum Error: Swift.Error {
        case foundNilWhileUnwrappingOptional(Wrapped.Type)
    }
    
}

public extension Optional where Wrapped == String {
    
    var isNilOrEmpty: Bool {
        return self == nil || self?.isEmpty == true
    }
    
}
