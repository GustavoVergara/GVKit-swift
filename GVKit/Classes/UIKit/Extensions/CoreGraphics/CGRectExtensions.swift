//
//  CGRectExtensions.swift
//  GVKit
//
//  Created by Gustavo Vergara Garcia on 27/03/19.
//

import Foundation

public extension CGRect {
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    
    init(origin: CGPoint, width: CGFloat, height: CGFloat) {
        self.init(x: origin.x, y: origin.y, width: width, height: height)
    }
    
    init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(x: x, y: y, width: size.width, height: size.height)
    }
    
}
