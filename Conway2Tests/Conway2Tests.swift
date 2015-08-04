//
//  Conway2Tests.swift
//  Conway2Tests
//
//  Created by Luke Harback on 3/08/2015.
//  Copyright © 2015 Luke Harback. All rights reserved.
//

import XCTest
@testable import Conway2

class Conway2Tests: XCTestCase {
    
    let board = Board()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_age() {
        board.setCell(1, y: 0)
        board.setCell(1, y: 1)
        board.setCell(1, y: 2)
        
        board.age()
        
        let state = board.getBoardState(3, width: 3)
        for i in 0..<state.count {
            XCTAssertTrue(state[i] == (i==1 || i==4 || i==7))
        }
    }
    
    
}
