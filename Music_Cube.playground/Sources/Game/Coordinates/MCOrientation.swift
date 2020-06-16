//
//  Direction.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 14/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

public enum MCOrientation: CaseIterable {
    case up
    case down
    case right
    case left
    case forward
    case back
    
    public var coord: MCCoordinate {
        switch self {
        case .up: return MCCoordinate(0, 1, 0)
        case .down: return MCCoordinate(0, -1, 0)
        case .right: return MCCoordinate(1, 0, 0)
        case .left: return MCCoordinate(-1, 0, 0)
        case .forward: return MCCoordinate(0, 0, 1)
        case .back: return MCCoordinate(0, 0, -1)
        }
    }
}
