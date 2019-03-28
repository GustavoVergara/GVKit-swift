//
//  Rx+RPCircularProgress.swift
//  GVKit
//

import Foundation
import RxSwift
import RxCocoa

#if canImport(RPCircularProgress)
import RPCircularProgress
    
public extension Reactive where Base: RPCircularProgress {
    
    @discardableResult
    func updateProgress(_ progress: CGFloat, animated: Bool = true, initialDelay: CFTimeInterval = 0, duration: CFTimeInterval? = nil) -> Completable {
        let completionSubject = PublishSubject<Void>()
        self.base.updateProgress(progress, animated: animated, initialDelay: initialDelay, duration: duration) {
            completionSubject.on(.completed)
        }
        return completionSubject.ignoreElements()
    }
    
    @discardableResult
    func enableIndeterminate(_ enabled: Bool = true) -> Completable {
        let completionSubject = PublishSubject<Void>()
        self.base.enableIndeterminate(enabled) {
            completionSubject.on(.completed)
        }
        return completionSubject.ignoreElements()
    }
    
    func progress(animated: Bool = true, initialDelay: CFTimeInterval = 0, duration: CFTimeInterval? = nil) -> Binder<CGFloat> {
        return Binder<CGFloat>(self.base, scheduler: MainScheduler.instance, binding: { (base, progress) in
            base.updateProgress(progress, animated: animated, initialDelay: initialDelay, duration: duration)
        })
    }
    
    //    var progress: Binder<CGFloat> {
    //        return Binder<CGFloat>(self.base, scheduler: MainScheduler.instance, binding: { (base, progress) in
    //            base.updateProgress(progress)
    //        })
    //    }
    
    var isAnimatingIndeterminate: Binder<Bool> {
        return Binder<Bool>(self.base, scheduler: MainScheduler.instance, binding: { (base, isIndeterminate) in
            base.enableIndeterminate(isIndeterminate)
        })
    }
    
}
#endif
