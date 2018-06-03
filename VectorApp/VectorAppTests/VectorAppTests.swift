//
//  VectorAppTests.swift
//  VectorAppTests
//
//  Created by Russell Finn on 6/3/18.
//  Copyright © 2018 The Spruce Hill Group. All rights reserved.
//

import XCTest
@testable import VectorApp
@testable import VectorEngine

class VectorAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVecPlayer4() {
        var v0 = VecPlayer4(repeating: 0)
        XCTAssertEqual(v0[.north], 0)
        XCTAssertEqual(v0[.east], 0)
        XCTAssertEqual(v0[.south], 0)
        XCTAssertEqual(v0[.west], 0)
        v0[.north] += 1
        XCTAssertEqual(v0[.north], 1)
        v0[.east] = 2
        XCTAssertEqual(v0[.north], 1)
        XCTAssertEqual(v0[.east], 2)
        
        let v1 = VecPlayer4(north: 1, east: 2, south: 3, west: 4)
        XCTAssertEqual(v1[.north], 1)
        XCTAssertEqual(v1[.east], 2)
        XCTAssertEqual(v1[.south], 3)
        XCTAssertEqual(v1[.west], 4)
        
        XCTAssertEqual(v1.index(after: .north), .east)
        XCTAssertEqual(v1.index(after: .south), .west)
        XCTAssertEqual(v1.index(after: .west), .noPlayer)
        
        XCTAssertEqual(v1.count, 4)
        XCTAssertEqual(v1.isEmpty, false)
        XCTAssertEqual(v1.first, 1)
        
        XCTAssertThrowsError(try VecPlayer4(array: [0])) { error in
            switch error {
            case VecPlayer4Error.inputArrayTooShort:
                break
            default:
                XCTFail("wrong error thrown by VecPlayer4(array:): \(error)")
            }
        }
        XCTAssertNoThrow(try VecPlayer4(array: [1, 2, 3, 4]))
        let v2 = try! VecPlayer4(array: [1, 2, 3, 4])
        for (a, b) in zip(v1, v2) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testVecSuit4() {
        var v0 = VecSuit4(repeating: 0)
        XCTAssertEqual(v0[.clubs], 0)
        XCTAssertEqual(v0[.diamonds], 0)
        XCTAssertEqual(v0[.hearts], 0)
        XCTAssertEqual(v0[.spades], 0)
        v0[.clubs] += 1
        XCTAssertEqual(v0[.clubs], 1)
        v0[.diamonds] = 2
        XCTAssertEqual(v0[.clubs], 1)
        XCTAssertEqual(v0[.diamonds], 2)
        
        let v1 = VecSuit4(clubs: 1, diamonds: 2, hearts: 3, spades: 4)
        XCTAssertEqual(v1[.clubs], 1)
        XCTAssertEqual(v1[.diamonds], 2)
        XCTAssertEqual(v1[.hearts], 3)
        XCTAssertEqual(v1[.spades], 4)
        
        XCTAssertEqual(v1.index(after: .clubs), .diamonds)
        XCTAssertEqual(v1.index(after: .hearts), .spades)
        
        XCTAssertEqual(v1.index(after: .spades), .noTrump)
//        XCTAssertEqual(v1[.noTrump], 0)
        
        XCTAssertEqual(v1.count, 4)
        XCTAssertEqual(v1.isEmpty, false)
        XCTAssertEqual(v1.first, 1)
        
        let v2 = VecSuit4(clubs: 1, diamonds: 2, hearts: 0, spades: 0)
        XCTAssert(v0 == v2)
        
        let a = [1, 2, 3, 4]
        let v3 = VecSuit4(vectorAddress: a)
        XCTAssert(v3 == v1)
    }
    
    func testSuitIndex() {
        XCTAssertEqual(Suit.diamonds.successor(), .hearts)
        XCTAssertEqual(Suit.diamonds.predecessor(), .clubs)
        XCTAssertEqual(Suit.clubs.predecessor(), .clubs)
        XCTAssertEqual(Suit.spades.successor(), .noTrump)
        XCTAssertEqual(Suit.noTrump.successor(), .noTrump)
    }
}
