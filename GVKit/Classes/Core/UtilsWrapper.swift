//
//  UtilsWrapper.swift
//  GVKit
//

public struct Utils<Base> {
    public let base: Base
}

public protocol UtilsCompatible {}
public extension UtilsCompatible {
    
    typealias Utils = GVKit.Utils<Self>
    
    var utils: Utils {
        return Utils(base: self)
    }
    
}

#if canImport(UIKit)
extension UIView: UtilsCompatible {}
extension UIViewController: UtilsCompatible {}
#endif
