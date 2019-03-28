//
//  KVODisposeBag.swift
//  GVKit
//

import Foundation

public class KVODisposeBag {
    
    private var observations: [NSKeyValueObservation]
    
    public init() {
        self.observations = []
    }
    
    deinit {
        self.clear()
    }
    
    public func add(_ observation: NSKeyValueObservation) {
        self.observations.append(observation)
    }
    
    public func clear() {
        self.observations.forEach { $0.invalidate() }
        self.observations = []
    }
    
}

public extension NSKeyValueObservation {
    
    func dispose(in disposeBag: KVODisposeBag) {
        disposeBag.add(self)
    }
    
}

public class NODisposeBag {
    
    private var observations: [NSObjectProtocol]
    
    public init() {
        self.observations = []
    }
    
    deinit {
        self.clear()
    }
    
    public func add(_ observation: NSObjectProtocol) {
        self.observations.append(observation)
    }
    
    public func clear() {
        self.observations = []
    }
    
}

public extension NSObjectProtocol {
    
    func dispose(in disposeBag: NODisposeBag) {
        disposeBag.add(self)
    }
    
}
