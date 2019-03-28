//
//  UITableViewExtension.swift
//  DesafioNexaas
//
//  Created by Gustavo Vergara Garcia on 12/08/18.
//  Copyright © 2018 Gustavo Vergara Garcia. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func deselectAll(animated: Bool) {
        guard let selectedIndexPaths = self.indexPathsForSelectedRows else { return }
        
        for selectedIndexPath in selectedIndexPaths {
            self.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    func performUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        if #available(iOS 11.0, *) {
            self.performBatchUpdates(updates, completion: completion)
        } else {
            self.beginUpdates()
            updates?()
            self.endUpdates()
            completion?(true)
        }
    }
    
}
