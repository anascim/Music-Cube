//
//  ModelsManager.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit
import ModelIO
import SceneKit.ModelIO

public class ModelsManager {
    
    public static var ballGeometry = SCNSphere(radius: 0.1)
    
    public static func createNode(filename: String) -> SCNNode {
        guard let objFilePath = Bundle.main.path(forResource: filename, ofType: "obj") else {
            fatalError("Failed to find path for asset \(filename)")
        }
        let objUrl = URL(fileURLWithPath: objFilePath)
        let asset = MDLAsset(url: objUrl)
        
        guard let object = asset.object(at: 0) as? MDLMesh else {
            fatalError("Failed to load object from asset \(filename)")
        }
        return SCNNode(mdlObject: object)
    }
}
