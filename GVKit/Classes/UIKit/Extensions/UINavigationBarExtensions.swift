//
//  UINavigationBarExtensions.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 05/11/18.
//

import Foundation

public extension UINavigationBar {
    
    var titleFont: UIFont? {
        get {
            return self.titleTextAttributes?[.font] as? UIFont
        }
        set {
            if self.titleTextAttributes == nil { self.titleTextAttributes = [:] }
            self.titleTextAttributes?[.font] = newValue
        }
    }
    
    var titleColor: UIColor? {
        get {
            return self.titleTextAttributes?[.foregroundColor] as? UIColor
        }
        set {
            if self.titleTextAttributes == nil { self.titleTextAttributes = [:] }
            self.titleTextAttributes?[.foregroundColor] = newValue
        }
    }
    
}
