//
//  WKWebKitExtensions.swift
//  MobfiqKit
//
//  Created by Gustavo Vergara Garcia on 20/09/18.
//  Copyright © 2018 Mobfiq. All rights reserved.
//

import Foundation
import WebKit

public extension WKWebView {
    
    func insertCSS(_ cssString: String, completionHandler: ((Any?, Error?) -> Void)? = nil) {
        self.insertHeader("<style>\(cssString)</style>", completionHandler: completionHandler)
    }
    
    func insertHeader(_ header: String, completionHandler: ((Any?, Error?) -> Void)? = nil) {
        let jsString = "document.head.appendChild(\(header);"
        self.evaluateJavaScript(jsString, completionHandler: completionHandler)
    }
    
}
