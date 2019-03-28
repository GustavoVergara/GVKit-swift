//
//  Rx+Timer.swift
//  GVKit
//

import Foundation
import RxSwift

public extension Reactive where Base == Timer {
    
    /// Emits events with the time elapsed
    static func withRepeatingInterval(_ repeatInterval: TimeInterval = 1, withLimit timeLimit: TimeInterval) -> Observable<TimeInterval> {
        return Observable<TimeInterval>.create { observer in
            var timeElapsed: TimeInterval = 0
            observer.onNext(timeElapsed)
            
            func increaseTimeElapsed(by amount: TimeInterval) {
                timeElapsed += amount
                observer.onNext(timeElapsed)
            }
            
            let timer = Timer.scheduledTimer(withTimeInterval: repeatInterval, repeats: true, block: { (timer) in
                guard timeElapsed < timeLimit else {
                    observer.onCompleted()
                    timer.invalidate()
                    return
                }
                increaseTimeElapsed(by: repeatInterval)
                
                if timeElapsed + repeatInterval > timeLimit {
                    let timeRemaining = timeLimit - timeElapsed

                    timer.fireDate = timer.fireDate.addingTimeInterval(timeRemaining)
                }
            })
            
            return Disposables.create {
                timer.invalidate()
            }
        }.share(replay: 1, scope: .forever)
    }
    
    /// Emits events with the time elapsed
    static func withRepeatingInterval(_ repeatInterval: TimeInterval = 1) -> Observable<TimeInterval> {
        return Observable<TimeInterval>.create { observer in
            var timeElapsed: TimeInterval = 0
            observer.onNext(timeElapsed)
            
            let timer = Timer.scheduledTimer(withTimeInterval: repeatInterval, repeats: true, block: { (timer) in
                timeElapsed += repeatInterval
                observer.onNext(timeElapsed)
            })
            
            return Disposables.create {
                timer.invalidate()
            }
        }.share(replay: 1, scope: .forever)
    }
    
    static func scheduled(withTimeInterval timeInterval: TimeInterval, repeats: Bool) -> Observable<Timer> {
        return Observable<Timer>.create({ (observer) -> Disposable in
            let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: repeats, block: { (timer) in
                observer.onNext(timer)
            })
            
            return Disposables.create {
                timer.invalidate()
            }
        })
    }
    
}
