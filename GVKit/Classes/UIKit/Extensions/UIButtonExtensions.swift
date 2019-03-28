//
//  UIButtonExtensions.swift
//  LiveShows
//
//  Created by Gustavo Vergara Garcia on 29/10/18.
//  Copyright © 2018 Fulllab. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        let image = color.flatMap({ UIImage(color: $0) })
        self.setBackgroundImage(image, for: state)
    }
    
}
