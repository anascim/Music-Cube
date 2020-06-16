//
//  CubeExtensions.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 15/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import Foundation

extension Cube {
    
    public var topPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.y == 4
        }
    }
    public var bottomPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.y == 0
        }
    }
    public var rightPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.x == 4
        }
    }
    public var leftPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.x == 0
        }
    }
    public var frontPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.z == 4
        }
    }
    public var backPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.z == 0
        }
    }
    
    public func printCoords() {
        for coord in padCoords {
            print(coord)
        }
    }
    
}
