//
//  ArrowElement.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

class ArrowElement: SCNNode {
    
    unowned var pad: PadNode
    var direction: MCDirection
    
    init(pad: PadNode) {
        self.pad = pad
        let face = pad.coord.getDominant().1
        if face == .forward || face == .back {
            direction = .y
        } else if face == .right || face == .left {
            direction = .z
        } else {
            direction = .x
        }
        super.init()
        
        if face == .up || face == .down {
            geometry = ModelsManager.createNode(filename: "arrow_side").geometry
        } else if face == .right || face == .left {
            geometry = ModelsManager.createNode(filename: "arrow_side_rl").geometry
        } else if face == .forward || face == .back {
            geometry = ModelsManager.createNode(filename: "arrow_side_fb").geometry
        }
        
        geometry?.firstMaterial?.diffuse.contents = UIColor.systemBlue
        
        scale = SCNVector3(0.08,0.08,0.08)
        let normal = pad.coord.getDominant().1.vector
        position = pad.position + normal * 0.03
        
        switch face {
        case .up:
            eulerAngles.y = PI
        case .down:
            break
        case .right:
            eulerAngles.x = PI/2
        case .left:
            eulerAngles.x = -PI/2
        case .forward:
            eulerAngles.z = -PI/2
        case .back:
            eulerAngles.z = PI/2
        }
    }
    
    // Rotate countercock-wise
    public func rotateDirection() {
        direction = direction.counterClockDirection(up: pad.coord.getDominant().1)
        let face = pad.coord.getDominant().1
        switch face {
        case .up:
            eulerAngles.y = eulerAngles.y + PI/2
        case .down:
            eulerAngles.y = eulerAngles.y - PI/2
        case .right:
            eulerAngles.x = eulerAngles.x + PI/2
        case .left:
            eulerAngles.x = eulerAngles.x - PI/2
        case .forward:
            eulerAngles.z = eulerAngles.z + PI/2
        case .back:
            eulerAngles.z = eulerAngles.z - PI/2
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArrowElement: Element {
    
    func activate(by ball: Ball) {
        ball.direction = self.direction
        switch pad.coord.getDominant().1 {
        case .up:
            ball.synth.play(note: .A3, for: 0.1)
        case .down:
            ball.synth.play(note: .E4, for: 0.1)
        case .right:
            ball.synth.play(note: .D4, for: 0.1)
        case .left:
            ball.synth.play(note: .A4, for: 0.1)
        case .forward:
            ball.synth.play(note: .C4, for: 0.1)
        case .back:
            ball.synth.play(note: .G4, for: 0.1)
        }
    }
    
    func delete() {
        self.pad.element = nil
        self.removeFromParentNode()
    }
}
