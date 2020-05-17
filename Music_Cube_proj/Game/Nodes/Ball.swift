//
//  Ball.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 15/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

class Ball: SCNNode {
    
    unowned let cube: Cube
    
    let synth: Synth
    
    var lastPad: PadNode
    var nextPad: PadNode
    var lastPosition: SCNVector3
    var nextPosition: SCNVector3
    var direction: MCDirection
    
    // lerp
    var pct: Float = 0
    var speed: Float = 1
    var pointsDistance: Float = 0
    
    init(cube: Cube, direction: MCDirection, pad: PadNode) {
        self.cube = cube
        self.direction = direction
        self.lastPad = pad
        self.nextPad = pad
        self.lastPosition = lastPad.position
        self.nextPosition = lastPosition
        self.synth = Synth()
        super.init()
        self.geometry = ModelsManager.ballGeometry
        self.position = lastPosition
        self.reachedNextPosition()
    }
    
    func update(deltaTime: Float) {
        if GameManager.isPaused { return }
        if pct > 0.99 {
            reachedNextPosition()
        }
        pct += deltaTime * speed / pointsDistance
        self.position = SCNVector3.lerp(lastPosition, nextPosition, pct)
    }
    
    private func reachedPad() {
        lastPad = nextPad
        lastPad.ballArrived(self)
        nextPad = cube.nextPad(from: lastPad, direction: direction)
    }
    
    private func reachedNextPosition() {
        lastPosition = nextPosition
        if lastPosition == nextPad.position {
            reachedPad()
            if lastPad.coord.checkOverstep(on: direction) {
                // go to corner
                let currentFace = lastPad.coord.getDominant().1
                let (dx, dy, dz) = direction.orientation(on: currentFace).coord.xyz
                let x = dx == 0 ? lastPad.position.x : nextPad.position.x
                let y = dy == 0 ? lastPad.position.y : nextPad.position.y
                let z = dz == 0 ? lastPad.position.z : nextPad.position.z
                nextPosition = SCNVector3(x, y, z)
            } else {
                nextPosition = nextPad.position
            }
        } else {
            // reached corner
            nextPosition = nextPad.position
        }
        let diff = nextPosition - lastPosition
        pointsDistance = diff.magnitude()
        pct = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
