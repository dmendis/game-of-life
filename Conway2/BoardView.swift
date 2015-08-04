//
//  BoardView.swift
//  Conway2
//
//  Created by Dineth Mendis on 8/4/15.
//  Copyright © 2015 Luke Harback. All rights reserved.
//

import UIKit

class BoardView: UIView {
    var board:Board!
    var squareSize:CGRect!
    
    func setup(board:Board, cellSize:CGRect) {
        self.board = board
        squareSize = cellSize
    }
    
    override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(ctx, UIColor.whiteColor().CGColor)
        
        for cell in board.liveCells {
            let rect = CGRectMake(CGFloat(cell.x) * squareSize.width, CGFloat(cell.y) * squareSize.height, squareSize.width, squareSize.height)
            CGContextFillRect(ctx, rect)
        }
//        CGContextFlush(ctx)
    }
}