//
//  Cube.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 13/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

class Cube: SCNNode {
    
    var padCoords = Set<MCCoordinate>()
    
    var pads = [MCCoordinate : PadNode]()
    
    override init() {
        super.init()
        fillCoords()
        createPads()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillCoords() {
        var newCoord: MCCoordinate
        // top and bottom
        for x in 1...3 {
            for z in 1...3 {
                newCoord = MCCoordinate(x,4,z)
                padCoords.insert(newCoord)
                newCoord = MCCoordinate(x,0,z)
                padCoords.insert(newCoord)
            }
        }
        
        // right and left
        for y in 1...3 {
            for z in 1...3 {
                newCoord = MCCoordinate(4,y,z)
                padCoords.insert(newCoord)
                newCoord = MCCoordinate(0,y,z)
                padCoords.insert(newCoord)
            }
        }
        
        // front and back
        for x in 1...3 {
            for y in 1...3 {
                newCoord = MCCoordinate(x,y,4)
                padCoords.insert(newCoord)
                newCoord = MCCoordinate(x,y,0)
                padCoords.insert(newCoord)
            }
        }
    }
    
    func createPads() {
        for coord in padCoords {
            let pad = PadNode(coord: coord, color: .systemOrange, selectionColor: .systemYellow)
            pads[coord] = pad
            self.addChildNode(pad)
        }
    }
    
    func nextPad(from pad: PadNode, direction: MCDirection) -> PadNode {
        let nextCoord = pad.coord.nextCoord(on: direction)
        guard let pad = pads[nextCoord] else { fatalError("Pad not in dictionary") }
        return pad
    }
}
