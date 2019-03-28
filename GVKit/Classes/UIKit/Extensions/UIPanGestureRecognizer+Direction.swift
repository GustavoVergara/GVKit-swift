//
//  UIPanGestureRecognizer+Direction.swift
//  zeenow
//
//  Created by Allan on 22/03/2018.
//  Copyright © 2018 Zee Dog S.A. All rights reserved.
//

import UIKit

public extension UIPanGestureRecognizer {
    
    var direction: PanDirection {
        let velocity = self.velocity(in: self.view)
        
        var direction: PanDirection = []
        if velocity.x > 0 {
            direction.insert(.right)
        } else {
            direction.insert(.left)
        }
        
        if velocity.y > 0 {
            direction.insert(.up)
        } else {
            direction.insert(.down)
        }
        
        return direction
    }
    
    struct PanDirection: OptionSet {
        public var rawValue: Int
        
        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }
        
        public init() {
            self.init(rawValue: 0)
        }
        
        public var isVertical: Bool {
            return PanDirection.vertical.contains(self)
        }
        
        public var isHorizontal: Bool {
            return PanDirection.horizontal.contains(self)
        }
        
        public static var up: PanDirection      { return PanDirection(rawValue: 1 << 0) }
        public static var down: PanDirection    { return PanDirection(rawValue: 1 << 1) }
        public static var left: PanDirection    { return PanDirection(rawValue: 1 << 2) }
        public static var right: PanDirection   { return PanDirection(rawValue: 1 << 3) }
        
        public static var vertical: PanDirection    { return [.up, .down] }
        public static var horizontal: PanDirection  { return [.left, .right] }
    }
    
}
