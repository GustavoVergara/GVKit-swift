//
//  UIGestureRecognizer+Closurable.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 31/10/18.
//

import Foundation

/// extension for UIGestureRecognizer - actions with closure
extension UIGestureRecognizer: Closurable {
    
    public func addTarget(closure: @escaping (UIGestureRecognizer) -> Void) -> CancellableType {
        let container = self.getContainer(for: closure)
        self.addTarget(container, action: container.action)
        
        return ClosureCancellable(cancelAction: { [weak self, weak container] in
            guard let `self` = self, let container = container else { return }
            self.removeTarget(container, action: container.action)
        })
    }
    
}
