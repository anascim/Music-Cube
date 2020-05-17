//
//  Coordinate.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 14/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

struct MCCoordinate {
    
    var x: Int
    var y: Int
    var z: Int
    var xyz: (Int, Int, Int) {
        (x, y, z)
    }
    
    init(_ x: Int, _ y: Int, _ z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    // There should always be one axis with the value 0 or 4 and the other two between 1-3
    // The dominant axis is the one that is either 0 or 4.
    func getDominant() -> (Int, MCOrientation) {
        for i in 0...2 {
            if self[i] == 0 {
                switch i {
                case 0: return (0, .left)
                case 1: return (0, .down)
                case 2: return (0, .back)
                default: fatalError()
                }
            }
            if self[i] == 4 {
                switch i {
                case 0: return (4, .right)
                case 1: return (4, .up)
                case 2: return (4, .forward)
                default: fatalError()
                }
            }
        }
        fatalError("No dominant axis on pad coordinate")
    }
    
    func isCentral() -> Bool {
        var count2s = 0
        for i in 0...2 {
            if self[i] == 2 {
                count2s += 1
            }
        }
        return count2s == 2
    }
    
    func nextCoord(on direction: MCDirection) -> MCCoordinate {
        var nextCoord = self
        if checkOverstep(on: direction) {
            nextCoord = retreatDominant(nextCoord)
        }
        let (_, face) = getDominant()
        nextCoord = nextCoord + direction.orientation(on: face).coord
        return nextCoord
    }
    
    func checkOverstep(on direction: MCDirection) -> (Bool) {
        let (_, face) = getDominant()
        let newCoord = self + direction.orientation(on: face).coord
        var count = 0
        for i in 0...2 {
            if newCoord[i] == 0 || newCoord[i] == 4 {
                count += 1
            }
        }
//        print(count)
        return count != 1
    }
    
    func retreatDominant(_ coord: MCCoordinate) -> MCCoordinate {
        var newCoord = self
        for i in 0...2 {
            if newCoord[i] == 0 {
                newCoord[i] = 1
            }
            else if newCoord[i] == 4 {
                newCoord[i] = 3
            }
        }
        return newCoord
    }
}
