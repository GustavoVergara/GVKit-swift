//
//  UIViewControllerExtensions.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 31/10/18.
//

import UIKit

extension UIViewController {
    
    func move(to parentViewController: UIViewController, into containerView: UIView) {
        parentViewController.addChild(self)
        containerView.addSubview(self.view)
        self.didMove(toParent: parentViewController)
    }
    
}
