//
//  SCNCoordinateExtensions.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

extension MCOrientation {
    
    public var vector: SCNVector3 {
        let (x, y, z) = coord.xyz
        return SCNVector3(x, y, z)
    }
}
