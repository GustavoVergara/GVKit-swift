//
//  ClosureProtocolExtensions.swift
//  MobfiqKit
//
//  Created by Gustavo Vergara Garcia on 14/03/18.
//  Copyright © 2018 Mobfiq. All rights reserved.
//

import Foundation
import UIKit

// TODO: Send the event that triggered the closure
// TODO: Cancel a closure

public protocol Closurable: class {}
// restrict protocol to only classes => can refer to the class instance in the protocol extension
public extension Closurable {
    
    // Create container for closure, store it and return it
    func getContainer(for closure: @escaping (Self) -> Void) -> ClosureContainer<Self> {
        let container = ClosureContainer(closure: closure, caller: self)
        // store the container so that it can be called later, we do not need to explicitly retrieve it.
        objc_setAssociatedObject(self, Unmanaged.passUnretained(self).toOpaque(), container, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return container
    }
}

/// Container class for closures, so that closure can be stored as an associated object
public final class ClosureContainer<T: Closurable> {
    
    var closure: (T) -> Void
    weak var caller: T?
    
    // target action
    var action: Selector { return #selector(ClosureContainer.processHandler) }
    
    public init(closure: @escaping (T) -> Void, caller: T?) {
        self.closure = closure
        self.caller = caller
    }
    
    // method for the target action, visible to UIKit classes via @objc
    @objc func processHandler() {
        if let caller = self.caller {
            self.closure(caller)
        }
    }
    
}
