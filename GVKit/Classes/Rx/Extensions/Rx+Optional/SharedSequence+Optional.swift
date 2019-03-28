//
//  SharedSequence+Optional.swift
//  GVKit
//

import Foundation
import RxCocoa

public extension SharedSequenceConvertibleType where E: OptionalType {

    func filterNil() -> SharedSequence<SharingStrategy, E.Wrapped> {
        return self.flatMap { element -> SharedSequence<SharingStrategy, E.Wrapped> in
            guard let value = element.value else {
                return SharedSequence<SharingStrategy, E.Wrapped>.empty()
            }
            return SharedSequence<SharingStrategy, E.Wrapped>.just(value)
        }
    }
    
    func replaceNil(with valueOnNil: E.Wrapped) -> SharedSequence<SharingStrategy, E.Wrapped> {
        return self.map { element -> E.Wrapped in
            guard let value = element.value else {
                return valueOnNil
            }
            return value
        }
    }
    
    func catchOnNil(_ handler: @escaping () -> SharedSequence<SharingStrategy, E.Wrapped>) -> SharedSequence<SharingStrategy, E.Wrapped> {
        return self.flatMap { element -> SharedSequence<SharingStrategy, E.Wrapped> in
            guard let value = element.value else {
                return handler()
            }
            return SharedSequence<SharingStrategy, E.Wrapped>.just(value)
        }
    }
    
    func switchOnNil(to sharedSequence: SharedSequence<SharingStrategy, E.Wrapped>) -> SharedSequence<SharingStrategy, E.Wrapped> {
        return self.flatMap { element -> SharedSequence<SharingStrategy, E.Wrapped> in
            guard let value = element.value else {
                return sharedSequence
            }
            return SharedSequence<SharingStrategy, E.Wrapped>.just(value)
        }
    }
    
}
