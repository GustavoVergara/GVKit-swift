//
//  File.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 30/01/19.
//

import Foundation

#if canImport(RxSwift) && canImport(RxCocoa)
import RxSwift
import RxCocoa

public extension Reactive where Base: UIView {
    
    var hasLoadingOverlay: Binder<Bool> {
        return Binder<Bool>(self.base, scheduler: MainScheduler.instance, binding: { (view, hasLoadingOverlay) in
            if hasLoadingOverlay {
                view.utils.addLoadingOverlay()
            } else {
                view.utils.removeLoadingOverlay()
            }
        })
    }
    
}

#endif
