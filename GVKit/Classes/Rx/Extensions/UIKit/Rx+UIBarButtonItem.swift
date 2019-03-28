//
//  Rx+UIBarButtonItem.swift
//  GVKit
//

import RxSwift
import RxCocoa

#if canImport(UIKit)
import UIKit

public extension Reactive where Base: UIBarButtonItem {
    
    /// Bindable sink for `tintColor` property.
    var tintColor: Binder<UIColor> {
        return Binder(self.base) { element, value in
            element.tintColor = value
        }
    }
    
}
#endif
