//
//  GameManagerExtensions.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

extension GameManager: TouchEventsResponder {
    
    public func touchedPad(pad: PadNode) {
        if selectedPad == pad {
            (pad.element as? ArrowElement)?.rotateDirection()
            return
        }
        selectedPad?.unhighlight()
        selectedPad = pad
        selectedPad!.highlight()
        if elementsHudHidden {
            showElementsHud()
        }
        if let _ = selectedPad?.element as? ArrowElement {
            showRotatingArrowIcon()
        } else {
            showRegularArrowIcon()
        }
    }
    
    public func touchedNothing() {
        selectedPad?.unhighlight()
        selectedPad = nil
        if !elementsHudHidden {
            hideElementsHud()
        }
    }
    
    public func touchedArrowIcon() {
        guard let selectedPad = self.selectedPad else {
            print("WARNING: No pad selected for placing element")
            hideElementsHud(); return
        }
        if selectedPad.element == nil {
            selectedPad.placeElement(element: ArrowElement(pad: selectedPad), anchor: self.cube)
        }
        showRotatingArrowIcon()
    }
    
    public func touchedBallIcon() {
        guard let selectedPad = self.selectedPad else {
            print("WARNING: No pad selected for placing element")
            hideElementsHud(); return
        }
        let face = selectedPad.coord.getDominant().1
        let ball: Ball
        if face == .forward || face == .back {
            ball = Ball(cube: cube, direction: .xi, pad: selectedPad)
        } else {
            ball = Ball(cube: cube, direction: .zi, pad: selectedPad)            
        }
        balls.append(ball)
        cube.addChildNode(ball)
    }
    
    public func touchedArrowRotateIcon() {
        guard let selectedPad = self.selectedPad else {
            print("WARNING: No pad selected for placing element")
            hideElementsHud(); return
        }
        if let arrowElement = selectedPad.element as? ArrowElement {
            arrowElement.rotateDirection()
        }
    }
    
    public func touchedArrowDeleteIcon() {
        guard let selectedPad = self.selectedPad else {
            print("WARNING: No pad selected for placing element")
            hideElementsHud(); return
        }
        if let arrowElement = selectedPad.element as? ArrowElement {
            arrowElement.delete()
        }
        showRegularArrowIcon()
    }
    
    public func touchedWipeIcon() {
        for pad in cube.pads.values {
            if let element = pad.element {
                element.delete()
            }
        }
        for ball in balls {
            balls.removeAll(where: { $0 == ball })
            ball.removeFromParentNode()
        }
    }
    
    public func touchedPlayIcon() {
        GameManager.isPaused = false
        self.playIconNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemGreen
        self.pauseIconNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        self.pauseIconNode.geometry?.materials[1].diffuse.contents = UIColor.white
    }
    
    public func touchedPauseIcon() {
        GameManager.isPaused = true
        self.playIconNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        self.pauseIconNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemRed
        self.pauseIconNode.geometry?.materials[1].diffuse.contents = UIColor.systemRed
    }
    
    public func touchedArrows(arrowName: String) {
        switch arrowName {
        case NavArrowNames.left.string:
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.2
            cube.eulerAngles = cube.eulerAngles + SCNVector3(0, -PI/2, 0)
            SCNTransaction.commit()
        case NavArrowNames.right.string:
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.2
            cube.eulerAngles = cube.eulerAngles + SCNVector3(0, PI/2, 0)
            SCNTransaction.commit()
        case NavArrowNames.up.string:
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.4
            cube.rotate(by: SCNQuaternion(0.707106781186548,0,-0.707106781186548, 0), aroundTarget: SCNVector3(0,0,0))
            SCNTransaction.commit()
        case NavArrowNames.down.string:
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.4
            cube.rotate(by: SCNQuaternion(0.707106781186548,0,-0.707106781186548, 0), aroundTarget: SCNVector3(0,0,0))
            SCNTransaction.commit()
        default: fatalError("Wrong string passed on arrow name")
        }
    }
}
