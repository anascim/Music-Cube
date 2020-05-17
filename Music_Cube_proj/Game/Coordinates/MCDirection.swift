//
//  Direction.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 15/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

// Directions go around the cube in a right-hand coordinate system
// the "i" is the inverse of the other
enum MCDirection: CaseIterable {
    
    case x
    case xi
    case y
    case yi
    case z
    case zi
    
    // TODO: simplify this using cross product
    func orientation(on face: MCOrientation) -> MCOrientation {
        switch self {
        case .x:
            switch face {
            case .forward:
                return .down
            case .back:
                return .up
            case .up:
                return .forward
            case .down:
                return .back
            default: fatalError("Direction going out of the cube")
            }
        case .xi:
            switch face {
            case .forward:
                return .up
            case .back:
                return .down
            case .up:
                return .back
            case .down:
                return .forward
            default: fatalError("Direction going out of the cube")
            }
        case .y:
            switch face {
            case .forward:
                return .right
            case .back:
                return .left
            case .right:
                return .back
            case .left:
                return .forward
            default: fatalError("Direction going out of the cube")
            }
        case .yi:
            switch face {
            case .forward:
                return .left
            case .back:
                return .right
            case .right:
                return .forward
            case .left:
                return .back
            default: fatalError("Direction going out of the cube")
            }
        case .z:
            switch face {
            case .up:
                return .left
            case .down:
                return .right
            case .right:
                return .up
            case .left:
                return .down
            default: fatalError("Direction going out of the cube")
            }
        case .zi:
            switch face {
            case .up:
                return .right
            case .down:
                return .left
            case .right:
                return .down
            case .left:
                return .up
            default: fatalError("Direction going out of the cube")
            }
        }
    }
    
    // TODO: simplify this using cross product
    func counterClockDirection(up: MCOrientation) -> MCDirection {
        switch up {
        case .up:
            switch self {
            case .x:
                return .zi
            case .xi:
                return .z
            case .z:
                return .x
            case .zi:
                return .xi
            default: fatalError("Direction going out of the cube")
            }
        case .down:
            switch self {
            case .x:
                return .z
            case .xi:
                return .zi
            case .z:
                return .xi
            case .zi:
                return .x
            default: fatalError("Direction going out of the cube")
            }
        case .right:
            switch self {
            case .y:
                return .z
            case .yi:
                return .zi
            case .z:
                return .yi
            case .zi:
                return .y
            default: fatalError("Direction going out of the cube")
            }
        case .left:
            switch self {
            case .y:
                return .zi
            case .yi:
                return .z
            case .z:
                return .y
            case .zi:
                return .yi
            default: fatalError("Direction going out of the cube")
            }
        case .forward:
            switch self {
            case .x:
                return .y
            case .xi:
                return .yi
            case .y:
                return .xi
            case .yi:
                return .x
            default: fatalError("Direction going out of the cube")
            }
        case .back:
            switch self {
            case .x:
                return .yi
            case .xi:
                return .y
            case .y:
                return .x
            case .yi:
                return .xi
            default: fatalError("Direction going out of the cube")
            }
        }
    }
}
