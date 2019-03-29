//
//  IntExtensions.swift
//  GVKit
//
//  Created by Gustavo Vergara Garcia on 29/03/19.
//

import Foundation

public extension Int {
    
    init?(_ character: Character) {
        guard let int = Int(String(character)) else { return nil }
        self = int
    }
    
}
