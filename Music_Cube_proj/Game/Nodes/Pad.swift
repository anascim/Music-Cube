//
//  Pad.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 13/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import Foundation
import SceneKit

class PadNode: SCNNode {
    
    let coord: MCCoordinate
    var color: UIColor
    var selectionColor: UIColor
    
    private(set) var element: Element?
    
    init(coord: MCCoordinate, color: UIColor, selectionColor: UIColor) {
        self.coord = coord
        self.color = color
        self.selectionColor = selectionColor
        super.init()
        self.geometry = SCNBox()
        self.geometry?.firstMaterial?.diffuse.contents = color
        setTransform()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func highlight() {
        self.geometry?.firstMaterial?.diffuse.contents = selectionColor
    }
    
    public func unhighlight() {
        self.geometry?.firstMaterial?.diffuse.contents = color
    }
    
    public func placeElement(element: Element, anchor: SCNNode) {
        self.element = element
        anchor.addChildNode(element)
    }
    
    public func ballArrived(_ ball: Ball) {
        element?.activate(by: ball)
    }
    
    private func setTransform() {
        let (_, dir) = coord.getDominant()
        switch dir {
        case .up:
            self.scale = SCNVector3(0.2, 0.05, 0.2)
            self.position = SCNVector3(CGFloat(coord.x)/4 - 0.5, (CGFloat(coord.y)-0.5)/4 - 0.5, CGFloat(coord.z)/4 - 0.5)
        case .down:
            self.scale = SCNVector3(0.2, 0.05, 0.2)
            self.position = SCNVector3(CGFloat(coord.x)/4 - 0.5, (CGFloat(coord.y)+0.5)/4 - 0.5, CGFloat(coord.z)/4 - 0.5)
        case .right:
            self.scale = SCNVector3(0.05, 0.2, 0.2)
            self.position = SCNVector3((CGFloat(coord.x)-0.5)/4 - 0.5, CGFloat(coord.y)/4 - 0.5, CGFloat(coord.z)/4 - 0.5)
        case .left:
            self.scale = SCNVector3(0.05, 0.2, 0.2)
            self.position = SCNVector3((CGFloat(coord.x)+0.5)/4 - 0.5, CGFloat(coord.y)/4 - 0.5, CGFloat(coord.z)/4 - 0.5)
        case .forward:
            self.scale = SCNVector3(0.2, 0.2, 0.05)
            self.position = SCNVector3(CGFloat(coord.x)/4 - 0.5, CGFloat(coord.y)/4 - 0.5, (CGFloat(coord.z)-0.5)/4 - 0.5)
        case .back:
            self.scale = SCNVector3(0.2, 0.2, 0.05)
            self.position = SCNVector3(CGFloat(coord.x)/4 - 0.5, CGFloat(coord.y)/4 - 0.5, (CGFloat(coord.z)+0.5)/4 - 0.5)
        }
    }
}


