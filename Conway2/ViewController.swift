//
//  ViewController.swift
//  Conway2
//
//  Created by Luke Harback on 3/08/2015.
//  Copyright © 2015 Luke Harback. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var boardView: BoardView!
    var board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        board.setCell(0, 1).setCell(1, 2).setCell(2, 0).setCell(2, 1).setCell(2, 2)
        boardView.setup(board, cellSize: CGRectMake(0, 0, 5, 5))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        drawGrid()
    }
    
    func tick() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW,
            Int64(0.2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.board.age()
            self.drawGrid()
        }
    }
    
    func drawGrid() {
        boardView.setNeedsDisplay()
        tick()
    }

}

