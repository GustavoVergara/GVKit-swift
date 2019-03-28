//
//  CGPointExtension.swift
//  MobfiqKit
//
//  Created by Gustavo Vergara Garcia on 04/12/17.
//  Copyright © 2017 Mobfiq. All rights reserved.
//

import Foundation

public extension CGPoint {
    
    func distance(to point: CGPoint) -> CGFloat {
        let xDist = self.x - point.x
        let yDist = self.y - point.y
        return sqrt((xDist * xDist) + (yDist * yDist))
    }
    
}

public extension CGSize {
    
    var inPixels: CGSize {
        return CGSize(width: self.width * UIScreen.main.scale, height: self.height * UIScreen.main.scale)
    }
    
}
