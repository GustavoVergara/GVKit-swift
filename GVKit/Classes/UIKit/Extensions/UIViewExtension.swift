//
//  UIViewExtension.swift
//  MobfiqUIModule
//
//  Created by Gustavo Vergara Garcia on 24/08/17.
//  Copyright © 2017 Mobfiq. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
        
    /**
     Rotate a view by specified degrees
     
     - parameter angle: angle in degrees
     */
    func rotate(by degrees: CGFloat) {
        let radians = (degrees / 180.0) * CGFloat.pi
        self.transform = self.transform.rotated(by: radians)
    }
    
}
