//
//  UINavigationItemExtensions.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 18/12/18.
//

import UIKit

extension UINavigationItem {
    
    var backBarButtonTitle: String? {
        get {
            return self.backBarButtonItem?.title
        }
        set {
            if let backBarButton = self.backBarButtonItem {
                backBarButton.title = newValue
            } else {
                self.backBarButtonItem = UIBarButtonItem(title: newValue, style: .done, target: nil, action: nil)
            }
        }
    }
    
}
