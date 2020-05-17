//
//  CoordinateExtensions.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 15/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

extension MCCoordinate {
    
    subscript(index: Int) -> Int {
        get {
            switch index {
            case 0: return x
            case 1: return y
            case 2: return z
            default: fatalError("Coordinate index out of range!")
            }
        }
        set {
            switch index {
            case 0: x = newValue
            case 1: y = newValue
            case 2: z = newValue
            default: fatalError("Coordinate index out of range!")
            }
        }
    }
    
    static func + (lhs: MCCoordinate, rhs: MCCoordinate) -> MCCoordinate {
        let x = lhs.x + rhs.x
        let y = lhs.y + rhs.y
        let z = lhs.z + rhs.z
        return MCCoordinate(x,y,z)
    }
}

extension MCCoordinate: Hashable {
    static func == (lhs: MCCoordinate, rhs: MCCoordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
        hasher.combine(z)
    }
}
