//
//  SequenceExtensions.swift
//  GVKit
//

import Foundation

public extension Collection {
    
    func last(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        var returnValue: Element?
        
        for element in self where try predicate(element) {
            returnValue = element
        }
        
        return returnValue
    }
    
    func at(_ index: Index) -> Element? {
        guard self.indices.contains(index) else { return nil }
        return self[index]
    }
    
}

public extension Collection where Index == Int {
    
    func indices(where predicate: (Element) throws -> Bool) rethrows -> [Index] {
        var returnValue = [Index]()
        for (index, element) in self.enumerated() where try predicate(element) {
            returnValue.append(index)
        }
        return returnValue
    }
    
}

extension Collection where Element: Equatable {
    
    func index(after firstElement: Element) -> Index? {
        guard let elementIndex = self.firstIndex(of: firstElement), elementIndex < self.endIndex else { return nil }
        
        return self.index(after: elementIndex)
    }
    
}

public extension Set {
    
    struct Differences<Element: Hashable> {
        public let common: Set<Element>
        public let removed: Set<Element>
        public let inserted: Set<Element>
        public let difference: Set<Element>
        
        public init(between lhsSet: Set<Element>, and rhsSet: Set<Element>) {
            self.common = lhsSet.intersection(rhsSet)
            self.difference = lhsSet.symmetricDifference(rhsSet)
            self.inserted = rhsSet.intersection(self.difference)
            self.removed = lhsSet.intersection(self.difference)
        }
        
        private init(common: Set<Element> = [], removed: Set<Element> = [], inserted: Set<Element> = []) {
            self.common = common
            self.removed = removed
            self.inserted = inserted
            self.difference = removed.union(inserted)
        }
        
    }
    
    func difference(from other: Set<Element>) -> Differences<Element> {
        return Differences<Element>(between: self, and: other)
    }
}

// MARK: - Operators

public extension Array {
    
    static func +=(lhs: inout Array<Element>, rhs: Element) {
        lhs.append(rhs)
    }
    
    static func +(lhs: Array<Element>, rhs: Element) -> Array<Element> {
        return lhs + [rhs]
    }
    
    static func +(lhs: Element, rhs: Array<Element>) -> Array<Element> {
        return [lhs] + rhs
    }
    
}