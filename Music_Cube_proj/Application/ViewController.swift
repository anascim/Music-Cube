//
//  ViewController.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 13/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    var sceneView: SCNView!
    
    var touchEventsResponder: TouchEventsResponder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView = view as? SCNView
        let gameScene = GameManager()
        touchEventsResponder = gameScene
        sceneView.delegate = gameScene
        sceneView.scene = gameScene.scene
        sceneView.rendersContinuously = true
//        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = UIColor(red: 0.7, green: 0.8, blue: 1, alpha: 1)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let hit = sceneView.hitTest(touches.first!.location(in: view), options: nil)
        if hit.count == 0 {
            touchEventsResponder?.touchedNothing()
        }
        //for result in hit.first
        if let result = hit.first {
            if let pad = result.node as? PadNode {
                touchEventsResponder?.touchedPad(pad: pad)
            } else if NavArrowNames.isArrowName(result.node.name) {
                touchEventsResponder?.touchedArrows(arrowName: result.node.name!)
            } else if result.node.name == ElementIconNames.arrow.string {
                touchEventsResponder?.touchedArrowIcon()
            } else if result.node.name == ElementIconNames.arrowRotate.string {
                touchEventsResponder?.touchedArrowRotateIcon()
            } else if result.node.name == ElementIconNames.arrowDeletion.string {
                touchEventsResponder?.touchedArrowDeleteIcon()
            } else if result.node.name == ControlIconNames.play.string {
                touchEventsResponder?.touchedPlayIcon()
            } else if result.node.name == ControlIconNames.pause.string {
                touchEventsResponder?.touchedPauseIcon()
            } else if result.node.name == ControlIconNames.wipe.string {
                touchEventsResponder?.touchedWipeIcon()
            } else if result.node.name == ElementIconNames.ball.string {
                touchEventsResponder?.touchedBallIcon()
            }
        }
    }
}

