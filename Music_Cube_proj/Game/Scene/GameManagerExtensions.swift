//
//  GameManagerExtensions.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

extension GameManager: TouchEventsResponder {
    
    func touchedPad(pad: PadNode) {
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
    
    func touchedNothing() {
        selectedPad?.unhighlight()
        selectedPad = nil
        if !elementsHudHidden {
            hideElementsHud()
        }
    }
    
    func touchedArrowIcon() {
        guard let selectedPad = self.selectedPad else {
            print("WARNING: No pad selected for placing element")
            hideElementsHud(); return
        }
        if selectedPad.element == nil {
            selectedPad.placeElement(element: ArrowElement(pad: selectedPad), anchor: self.cube)
        }
        showRotatingArrowIcon()
    }
    
    func touchedBallIcon() {
        guard let selectedPad = self.selectedPad else {
            print("WARNING: No pad selected for placing element")
            hideElementsHud(); return
        }
        let ball = Ball(cube: cube, direction: .zi, pad: selectedPad)
        balls.append(ball)
        cube.addChildNode(ball)
    }
    
    func touchedArrowRotateIcon() {
        guard let selectedPad = self.selectedPad else {
            print("WARNING: No pad selected for placing element")
            hideElementsHud(); return
        }
        if let arrowElement = selectedPad.element as? ArrowElement {
            arrowElement.rotateDirection()
        }
    }
    
    func touchedPlayIcon() {
        
    }
    
    func touchedPauseIcon() {
        
    }
    
    func touchedArrows(arrowName: String) {
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
