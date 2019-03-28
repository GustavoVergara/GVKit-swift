//
//  TimerExtensions.swift
//  GVKit
//

import Foundation

public extension Timer {
    
    /// block: passes `Self` and the time elapsed
    @available(iOS 10.0, *)
    static func scheduledWithRepeatingInterval(_ repeatInterval: TimeInterval = 1, withLimit timeLimit: TimeInterval, block: @escaping (Timer, TimeInterval) -> Void) -> Timer {
        var timeElapsed: TimeInterval = 0
        let timer = Timer.scheduledTimer(withTimeInterval: repeatInterval, repeats: true, block: { (timer) in
            timeElapsed += repeatInterval
            block(timer, timeElapsed)
            if timeElapsed + repeatInterval > timeLimit {
                timer.invalidate()
            }
        })
        block(timer, timeElapsed)
        
        return timer
    }
    
}
