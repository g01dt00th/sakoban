//
//  Classes.swift
//  sokoban
//
//  Created by Роенко Денис on 18.02.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//
import SwiftUI

enum Move {
    case left
    case right
    case up
    case down
}

enum CellSymbol  {
    case man
    case box
    case wall
    case empty
}

class Box {
    var x: Int
    var y: Int
    var next: Box?
    init(x: Int, y: Int, next: Box?) {
        self.x = x
        self.y = y
        self.next = next
    }
}

class Man {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class Wall {
    var fromX: Int
    var toX: Int
    var fromY: Int
    var toY: Int
    var next: Wall?
    init(fromX: Int, toX: Int, fromY: Int, toY: Int, next: Wall?) {
        self.fromX = fromX
        self.toX = toX
        self.fromY = fromY
        self.toY = toY
        self.next = next
    }
}

class Surface: ObservableObject {
    @Published var width: Int
    @Published var height: Int
    @Published var box: Box?
    @Published var man: Man?
    @Published var wall: Wall?
    
    init(width: Int, height: Int, box: Box?, man: Man?, wall: Wall?) {
        self.width = width
        self.height = height
        self.box = box
        self.man = man
        self.wall = wall
        createSurface()
    }
    
    @Published var surface:[[Cell]] = [[]]
   
    private func createSurface(){
        surface = Array(repeating: Array(repeating: Cell(symbol: CellSymbol.wall), count: height), count: width)
        for y in 0...height-1 {
            for x in 0...width-1 {
                surface[x][y] = Cell(symbol: CellSymbol.empty)
            }
        }
    }
    
}
