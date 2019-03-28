//
//  BundleExtension.swift
//  GVKit
//

import Foundation

public extension Bundle {
    
    var shortVersion: String? {
        return (self.infoDictionary?["CFBundleShortVersionString"] as? String)
    }
    
    var displayName: String? {
        return self.infoDictionary?["CFBundleName"] as? String
    }
    
}
