//
//  IndexTypes.swift
//  VectorApp
//
//  Created by Russell Finn on 6/3/18.
//  Copyright © 2018 The Spruce Hill Group. All rights reserved.
//

import VectorEngine

/// Allows Swift enum types that are built upon integer types
/// to be compared directly (like C/C++ enum values).
public func < <T: RawRepresentable>(a: T, b: T) -> Bool where T.RawValue: BinaryInteger {
    return a.rawValue < b.rawValue
}

extension Player : FixedLengthVectorIndex {
    public typealias Stride = Player.RawValue
    
    public static var bounds: Range<Player> {
        return .north ..< .noPlayer
    }
    
    public static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    public func advanced(by n: Stride) -> Player {
        if let result = Player(rawValue: self.rawValue + n) {
            return result
        }
        return n > 0 ? Player.bounds.upperBound : Player.bounds.lowerBound

//        return Player(rawValue: self.rawValue + n)!
    }
    
    public func distance(to other: Player) -> Stride {
        return other.rawValue - self.rawValue
    }
}

extension Suit : FixedLengthVectorIndex {
    public typealias Stride = Suit.RawValue
    
    public static var bounds: Range<Suit> {
        return .clubs ..< .noSuit
    }
    
    public static func < (lhs: Suit, rhs: Suit) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    public func advanced(by n: Stride) -> Suit {
        if let result = Suit(rawValue: self.rawValue + n) {
            return result
        }
        return n > 0 ? Suit.bounds.upperBound : Suit.bounds.lowerBound
    }
    
    public func distance(to other: Suit) -> Stride {
        return other.rawValue - self.rawValue
    }
}
