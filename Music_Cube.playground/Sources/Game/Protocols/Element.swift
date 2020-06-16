//
//  Element.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

public protocol Element: SCNNode {
    
    func activate(by ball: Ball)
    func delete()
}
