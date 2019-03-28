//
//  UIColorExtension.swift
//  MobfiqModels
//
//  Created by Gustavo Vergara Garcia on 21/08/17.
//  Copyright © 2017 Mobfiq. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {

    convenience init(hex: Int) {
        self.init(red: CGFloat((hex >> 16) & 0xff) / 255,
                  green: CGFloat((hex >> 8) & 0xff) / 255,
                  blue: CGFloat(hex & 0xff) / 255,
                  alpha: 1)
    }
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        let didGetComponents = getRed(&r, green: &g, blue: &b, alpha: &a)
        return didGetComponents ? (r, g, b, a) : nil
    }

}
