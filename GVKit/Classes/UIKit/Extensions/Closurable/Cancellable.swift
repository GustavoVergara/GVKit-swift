//
//  Cancellable.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 29/11/18.
//

import Foundation

public protocol CancellableType {
    /// Dispose resource.
    func cancel()
}

public class ClosureCancellable: CancellableType {
    
    private let cancelAction: () -> Void
    
    public init(cancelAction: @escaping () -> Void) {
        self.cancelAction = cancelAction
    }
    
    public func cancel() {
        cancelAction()
    }
    
}
