//
//  GameScene.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 14/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

let PI = Float.pi

protocol TouchEventsResponder {
    func touchedPad(pad: PadNode)
}

public class GameManager {
    
    public var scene: SCNScene
    
    var cube: Cube!
    
    public init() {
        self.scene = SCNScene()
        setupScene()
    }
    
    func setupScene() {
        // Lighting
        let directionalLight = SCNLight()
        directionalLight.type = .directional
        let directionalLightNode = SCNNode()
        directionalLightNode.light = directionalLight
        directionalLightNode.eulerAngles = SCNVector3(-PI/4, -PI/4, -PI/4)
        scene.rootNode.addChildNode(directionalLightNode)

        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.intensity = 500
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        scene.rootNode.addChildNode(ambientLightNode)

        let spotLight = SCNLight()
        spotLight.type = .spot
        let spotLightNode = SCNNode()
        spotLightNode.light = spotLight
        spotLightNode.position = SCNVector3(-1, -1, -2)
        spotLightNode.look(at: SCNVector3(0,0,0))
        scene.rootNode.addChildNode(spotLightNode)


        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0,0,0)
        cameraNode.camera?.usesOrthographicProjection = true
        cameraNode.look(at: SCNVector3(-1, -1, -1))
        cameraNode.localTranslate(by: SCNVector3(0, 0, 50))

        scene.rootNode.addChildNode(cameraNode)

        let cube = Cube()
        scene.rootNode.addChildNode(cube)
        
        
        
        Debug.generateGuides(size: 0.05, scene: scene)
    }
}

extension GameManager: TouchEventsResponder {
    
    func touchedPad(pad: PadNode) {
        let ball = Ball(cube: cube, direction: .up, pad: pad)
    }
}
