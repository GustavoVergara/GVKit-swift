//
//  UIViewController+Utils.swift
//  GVKit
//
//  Created by Gustavo Vergara Garcia on 26/03/19.
//

import UIKit

public extension Utils where Base: UIViewController {
    
    func presentAlert(title: String? = nil, message: String? = nil, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .default, handler: { [weak alertController] _ in
            completion?()
            alertController?.dismiss(animated: true)
        }))
        self.base.present(alertController, animated: true)
    }
    
}
