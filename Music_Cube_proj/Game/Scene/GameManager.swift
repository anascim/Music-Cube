//
//  GameScene.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 14/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit
import SceneKit.ModelIO
import ModelIO

let PI = Float.pi

public class GameManager: NSObject, SCNSceneRendererDelegate {
    
    public var scene: SCNScene
    
    var cube: Cube!
    var balls = [Ball]()
    var cameraNode: SCNNode!
    var arrowElementNode: SCNNode!
    var arrowRotateElementNode: SCNNode!
    
    
    var selectedPad: PadNode?
    
    // HUD
    var elementsCentralNode: SCNNode!
    private(set) var elementsHudHidden = true
    
    public override init() {
        self.scene = SCNScene()
        super.init()
        setupScene()
    }
    
    func setupScene() {
        
        
        // ==================
        // ::   Lighting   ::
        // ==================
        
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


        // ================
        // ::   Camera   ::
        // ================
        
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0,0,0)
        cameraNode.camera?.usesOrthographicProjection = true
        cameraNode.camera?.orthographicScale = 2
        cameraNode.look(at: SCNVector3(-1, -1, -1))
        cameraNode.localTranslate(by: SCNVector3(0, 0, 50))
        scene.rootNode.addChildNode(cameraNode)
        
        
        // =============
        // ::   HUD   ::
        // =============
        
        // Arrows
        let arrowsCentralNode = SCNNode()
        arrowsCentralNode.position = SCNVector3(0.45, -1.6, -5)
        arrowsCentralNode.eulerAngles = SCNVector3(-0.6, 0, 0)
        
        let leftArrowNode = ModelsManager.createNode(filename: "short_arrow")
        leftArrowNode.name = NavArrowNames.left.string
        leftArrowNode.scale = SCNVector3(0.15, 0.15, 0.15)
        leftArrowNode.eulerAngles = SCNVector3(0, 0, PI/2)
        leftArrowNode.position = SCNVector3(-0.15, 0, 0)
        leftArrowNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemYellow

        let rightArrowNode = ModelsManager.createNode(filename: "short_arrow")
        rightArrowNode.name = NavArrowNames.right.string
        rightArrowNode.scale = SCNVector3(0.15, 0.15, 0.15)
        rightArrowNode.eulerAngles = SCNVector3(0, 0, -PI/2)
        rightArrowNode.position = SCNVector3(0.15, 0, 0)
        rightArrowNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemYellow
        
        let upArrowNode = ModelsManager.createNode(filename: "short_arrow")
        upArrowNode.name = NavArrowNames.up.string
        upArrowNode.scale = SCNVector3(0.15, 0.15, 0.15)
        upArrowNode.position = SCNVector3(0, 0.05, 0)
        upArrowNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemYellow
        
        let downArrowNode = ModelsManager.createNode(filename: "short_arrow")
        downArrowNode.name = NavArrowNames.down.string
        downArrowNode.scale = SCNVector3(0.15, 0.15, 0.15)
        downArrowNode.eulerAngles = SCNVector3(0, 0, PI)
        downArrowNode.position = SCNVector3(0, -0.05, 0)
        downArrowNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemYellow
        
        arrowsCentralNode.addChildNode(leftArrowNode)
        arrowsCentralNode.addChildNode(rightArrowNode)
        arrowsCentralNode.addChildNode(upArrowNode)
        arrowsCentralNode.addChildNode(downArrowNode)
        cameraNode.addChildNode(arrowsCentralNode)
        
        // Playback options
        let playbackCentralNode = SCNNode()
        playbackCentralNode.position = SCNVector3(-0.45, -1.6, -5)
        playbackCentralNode.eulerAngles = SCNVector3(-0.4, 0, 0)
        
        let playIconNode = ModelsManager.createNode(filename: "play_icon")
        playIconNode.scale = SCNVector3(0.12, 0.12, 0.12)
        playIconNode.position = SCNVector3(-0.2, 0, 0)
        playIconNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        
        let pauseIconNode = ModelsManager.createNode(filename: "pause_icon")
        pauseIconNode.scale = SCNVector3(0.12, 0.12, 0.12)
        pauseIconNode.position = SCNVector3(0.2, 0, 0)
        pauseIconNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        pauseIconNode.geometry?.materials[1].diffuse.contents = UIColor.white
        
        playbackCentralNode.addChildNode(playIconNode)
        playbackCentralNode.addChildNode(pauseIconNode)
        cameraNode.addChildNode(playbackCentralNode)
        
        // Elements
        elementsCentralNode = SCNNode()
        elementsCentralNode.isHidden = true
        elementsCentralNode.position = SCNVector3(0, 1.6, -5)
        elementsCentralNode.eulerAngles = SCNVector3(-0.6, 0, 0)
        
        arrowElementNode = ModelsManager.createNode(filename: "short_arrow")
        arrowElementNode.name = ElementIconNames.arrow.string
        arrowElementNode.scale = SCNVector3(0.15, 0.15, 0.15)
        arrowElementNode.eulerAngles = SCNVector3(0, 0, -PI/2)
        arrowElementNode.position = SCNVector3(-0.45, 0, 0)
        arrowElementNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemBlue
        
        arrowRotateElementNode = ModelsManager.createNode(filename: "short_arrow")
        arrowRotateElementNode.name = ElementIconNames.arrowRotate.string
        arrowRotateElementNode.isHidden = true
        arrowRotateElementNode.scale = SCNVector3(0.15, 0.15, 0.15)
        arrowRotateElementNode.eulerAngles = SCNVector3(0, 0, -PI)
        arrowRotateElementNode.position = SCNVector3(-0.45, 0, 0)
        arrowRotateElementNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemBlue
        
        let ballElementNode = SCNNode(geometry: ModelsManager.ballGeometry)
        ballElementNode.name = ElementIconNames.ball.string
        ballElementNode.position = SCNVector3(0, 0, 0)
        ballElementNode.geometry?.firstMaterial?.diffuse.contents = UIColor.systemPink
        
        elementsCentralNode.addChildNode(ballElementNode)
        elementsCentralNode.addChildNode(arrowElementNode)
        elementsCentralNode.addChildNode(arrowRotateElementNode)
        cameraNode.addChildNode(elementsCentralNode)
        
        
        
        // =================
        // ::   Objects   ::
        // =================
        
        cube = Cube()
        scene.rootNode.addChildNode(cube)
        
        Debug.generateGuides(size: 0.05, scene: scene)
        
    }
    
    func showElementsHud() {
        elementsHudHidden = false
        elementsCentralNode.isHidden = false
    }
    
    func hideElementsHud() {
        elementsHudHidden = true
        elementsCentralNode.isHidden = true
    }
    
    func showRegularArrowIcon() {
        arrowElementNode.isHidden = false
        arrowRotateElementNode.isHidden = true
    }
    
    func showRotatingArrowIcon() {
        arrowElementNode.isHidden = true
        arrowRotateElementNode.isHidden = false
    }
    
    var lastTime: TimeInterval = 0
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        for b in balls {
            b.update(deltaTime: Float(time - lastTime))
        }
        lastTime = time
    }
}

