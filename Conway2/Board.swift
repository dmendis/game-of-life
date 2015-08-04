//
//  File.swift
//  Conway2
//
//  Created by Luke Harback on 3/08/2015.
//  Copyright © 2015 Luke Harback. All rights reserved.
//

import Foundation

let size = 10000

struct Cell:Hashable, Equatable {
    var x:Int
    var y:Int
    
    var hashValue: Int {
        get {
            return x + y * size
        }
    }
}

func ==(lhs: Cell, rhs: Cell) -> Bool {
    return lhs.x == rhs.x && rhs.y == lhs.y
}

class Board {
    var liveCells: Set<Cell>
    
    init () {
        liveCells = Set<Cell>()
    }
    
    func age() {
        var futureCells = Set<Cell>()
        var deadCells = Set<Cell>()
        
        for cell in liveCells {
            var liveCellCount = 0

            for j in cell.y-1...cell.y+1 {
                for i in cell.x-1...cell.x+1 {
                    if !(cell.x == i && cell.y == j) {
                        if isAlive(i, y: j) {
                            liveCellCount++
                        } else {
                            deadCells.insert(Cell(x: i, y: j))
                        }
                    }
                }
            }
            
            // rule 1 & 3
//            if liveCellCount < 2 || liveCellCount > 3 {
                // don't add to future cells
//            }
            
            // rule 1, 2, 3
            if liveCellCount == 2 || liveCellCount == 3 {
                futureCells.insert(cell)
            }
        }
        
        for cell in deadCells {
            var liveCellCount = 0
            for j in cell.y-1...cell.y+1 {
                for i in cell.x-1...cell.x+1 {
                    if !(cell.x == i && cell.y == j) {
                        if isAlive(i, y: j) {
                            liveCellCount++
                        }
                    }
                }
            }
            
            // rule 4
            if liveCellCount == 3 {
                futureCells.insert(cell)
            }
        }
        
        liveCells = futureCells
    }
    
    func setCell(x: Int, _ y: Int, alive:Bool = true) -> Self {
        let cell = Cell(x: x, y: y)
        if alive {
            liveCells.insert(cell)
        } else {
            if let pos = liveCells.indexOf({$0.x == x && $0.y == y}) {
                liveCells.removeAtIndex(pos)
            }
        }
        return self
    }
    
    func isAlive(x: Int, y: Int) -> Bool {
        return liveCells.indexOf({$0.x == x && $0.y == y}) != nil
    }
    
    func getBoardState(height: Int, width: Int) -> [Bool] {
        return Array(count: height * width, repeatedValue: false)
    }
    
//    func getRow(row:Int, width:Int=100) -> [Bool] {
//        var items = [Bool](count: 100, repeatedValue: false)
//        
//        // [0,0,0,0,0,0,0]
//        
//        let rowAliveCells = liveCells.filter {  $0.y == row }
//        
//        for i in 0..<rowAliveCells.count {
//            items[rowAliveCells[i].x] = true
//            // [0,0,1,0,1,0,0]
//        }
//        
//        return items
//    }
}
