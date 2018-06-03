//
//  VectorTypes.swift
//  VectorApp
//
//  Created by Russell Finn on 6/3/18.
//  Copyright © 2018 The Spruce Hill Group. All rights reserved.
//

import VectorEngine

enum VecPlayer4Error: Error {
    case inputArrayTooShort
}

struct VecPlayer4<T> : FixedLengthVector {
    typealias Element = T
    typealias Index = Player
    typealias IndexDistance = Int
    
    private var contents: Array<T>
    
    init(repeating repeatedValue: T) {
        contents = Array(repeating: repeatedValue, count: 4)
    }
    
    init(north: T, east: T, south: T, west: T) {
        contents = [ north, east, south, west ]
    }
    
    init(array: Array<T>) throws {
        if array.count < 4 {
            throw VecPlayer4Error.inputArrayTooShort
        }
        contents = Array(array.prefix(4))
    }
    
    func index(after i: Index) -> Index {
        return i.advanced(by: 1)
    }
    
    subscript(i: Player) -> T {
        get {
            let i = Int(i.rawValue)
            assert(0..<contents.count ~= i, "index out of range")
            return self.contents[i]
        }
        set {
            let i = Int(i.rawValue)
            assert(0..<contents.count ~= i, "index out of range")
            self.contents[i] = newValue
        }
    }
    
    var isEmpty: Bool { return false }
    var count: IndexDistance { return 4 }
    var first: T { return contents[0] }
}

struct VecSuit4<T> : FixedLengthVector {
    typealias Element = T
    typealias Index = Suit
    typealias IndexDistance = Int
    
    fileprivate var contents: Array<T>
    
    init(repeating repeatedValue: T) {
        contents = Array<T>(repeating: repeatedValue, count: 4)
    }
    
    init(vectorAddress: UnsafePointer<T>) {
        contents = Array<T>()
        var vectorAddress = vectorAddress
        contents.append(vectorAddress.pointee)
        vectorAddress = vectorAddress.successor()
        contents.append(vectorAddress.pointee)
        vectorAddress = vectorAddress.successor()
        contents.append(vectorAddress.pointee)
        vectorAddress = vectorAddress.successor()
        contents.append(vectorAddress.pointee)
    }
    
    init(clubs: T, diamonds: T, hearts: T, spades: T) {
        contents = [clubs, diamonds, hearts, spades]
    }
    
    func index(after i: Index) -> Index {
        return i.advanced(by: 1)
    }
    
    subscript(i: Suit) -> T {
        get {
            let i = Int(i.rawValue)
            assert(0..<contents.count ~= i, "index out of range")
            return self.contents[i]
        }
        set {
            let i = Int(i.rawValue)
            assert(0..<contents.count ~= i, "index out of range")
            self.contents[i] = newValue
        }
    }
    
    var isEmpty: Bool { return false }
    var count: IndexDistance { return 4 }
    var first: T { return contents[0] }
}

func ==<T: Equatable> (lhs: VecSuit4<T>, rhs: VecSuit4<T>) -> Bool {
    return lhs.contents == rhs.contents
}
