//
//  UIControl+Closurable.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 31/10/18.
//

import Foundation

extension UIControl: Closurable {}
public extension Closurable where Self: UIControl {
    
    @discardableResult
    func addTarget(forControlEvents events: UIControl.Event, closure: @escaping (Self) -> Void) -> CancellableType {
        let container = self.getContainer(for: closure)
        self.addTarget(container, action: container.action, for: events)
        
        return ClosureCancellable(cancelAction: { [weak self, weak container] in
            guard let `self` = self, let container = container else { return }
            self.removeTarget(container, action: container.action, for: events)
        })
    }
    
}
