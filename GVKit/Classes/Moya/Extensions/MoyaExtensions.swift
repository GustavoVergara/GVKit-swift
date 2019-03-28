//
//  MoyaExtension.swift
//  GVKit
//

import Foundation
import Moya

public extension MoyaProvider {
    
    func inflightRequests(for target: Target) -> [Completion] {
        return self.inflightRequests[self.endpoint(target)] ?? []
    }
    
}
