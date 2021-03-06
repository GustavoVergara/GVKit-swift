//
//  NotificationExtensions.swift
//  GVKit
//

import Foundation

extension Notification.Name: ExpressibleByStringLiteral {
    
    /// Creates an instance initialized to the given string value.
    ///
    /// - Parameter value: The value of the new instance.
    public init(stringLiteral value: String) {
        self.init(value)
    }
    
}

public extension NotificationCenter {
    
    func addObserver(forName name: Notification.Name?,
                     object: Any?,
                     using block: @escaping (Notification) -> Void
    ) -> NSObjectProtocol {
        return self.addObserver(forName: name, object: object, queue: nil, using: block)
    }
    
    func addObserver(forName name: Notification.Name?,
                     queue: OperationQueue? = nil,
                     using block: @escaping (Notification) -> Void
    ) -> NSObjectProtocol {
        return self.addObserver(forName: name, object: nil, queue: queue, using: block)
    }
    
    func addObserver(forName name: Notification.Name?,
                     using block: @escaping (Notification) -> Void
    ) -> NSObjectProtocol {
        return self.addObserver(forName: name, object: nil, queue: nil, using: block)
    }
    
}
