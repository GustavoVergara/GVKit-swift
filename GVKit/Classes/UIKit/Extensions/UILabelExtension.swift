//
//  UILabelExtension.swift
//  MobfiqUIModule
//
//  Created by Gustavo Vergara Garcia on 23/08/17.
//  Copyright © 2017 Mobfiq. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel {
    
    var isTruncated: Bool {
        get {
            guard let string = self.text as NSString? else {
                return false
            }
            
            let size: CGSize = string.boundingRect(with: CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude),
                                                   options: .usesLineFragmentOrigin,
                                                   attributes: [NSAttributedString.Key.font: self.font as Any],
                                                   context: nil).size
            
            return size.height > self.bounds.size.height
        }
    }
}
