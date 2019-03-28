//
//  UIBarButtonItem+Closurable.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 31/10/18.
//

import Foundation

/// extension for UIBarButtonItem - actions with closure
extension UIBarButtonItem: Closurable {
    
    public convenience init(image: UIImage?, style: UIBarButtonItem.Style, closure: @escaping (UIBarButtonItem) -> Void) {
        self.init(image: image, style: style, target: nil, action: nil)
        let container = self.getContainer(for: closure)
        self.target = container
        self.action = container.action
    }
    
    public convenience init(title: String?, style: UIBarButtonItem.Style, closure: @escaping (UIBarButtonItem) -> Void) {
        self.init(title: title, style: style, target: nil, action: nil)
        let container = self.getContainer(for: closure)
        self.target = container
        self.action = container.action
    }
    
}
