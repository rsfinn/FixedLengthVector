//
//  FixedLengthVector.swift
//  BridgeBaronMac2016
//
//  Created by Russell Finn on 6/5/16.
//  Copyright © 2016 Great Games Products. All rights reserved.
//

public protocol FixedLengthVectorIndex: Strideable, RawRepresentable {
    static var bounds: Range<Self> { get }
}

public extension FixedLengthVectorIndex {
    func successor() -> Self {
        let result = self.advanced(by: 1)
        guard result != Self.bounds.upperBound else { return self }
        return result
    }
    
    func predecessor() -> Self {
        guard self != Self.bounds.lowerBound else { return self }
        return self.advanced(by: -1)
    }
}

#if swift(>=3.2)
public protocol FixedLengthVector : Collection where Index: FixedLengthVectorIndex { }
#else
public protocol FixedLengthVector : Collection {
    associatedtype Element
    associatedtype Index: FixedLengthVectorIndex
}
#endif

extension FixedLengthVector {
    typealias IndexDistance = Index.RawValue
    
    public var startIndex: Index { return Index.bounds.lowerBound }
    public var endIndex: Index { return Index.bounds.upperBound }
}
