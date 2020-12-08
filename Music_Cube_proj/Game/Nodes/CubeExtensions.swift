//
//  CubeExtensions.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 15/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import Foundation

extension Cube {
    
    var topPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.y == 4
        }
    }
    var bottomPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.y == 0
        }
    }
    var rightPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.x == 4
        }
    }
    var leftPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.x == 0
        }
    }
    var frontPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.z == 4
        }
    }
    var backPads: [MCCoordinate : PadNode] {
        pads.filter { (pair) -> Bool in
            pair.key.z == 0
        }
    }
    
    func printCoords() {
        for coord in padCoords {
            print(coord)
        }
    }
}
