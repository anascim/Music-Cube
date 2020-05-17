//
//  SceneKitExtensions.swift
//  Lockpicking WatchKit Extension
//
//  Created by Alex Nascimento on 10/03/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import SceneKit

extension SCNVector3: Equatable {
    
    public static func == (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
    
    public static func != (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
        return lhs.x != rhs.x && lhs.y != rhs.y && lhs.z != rhs.z
    }
}

// operators
extension SCNVector3 {
    
    static func + (_ lhs: SCNVector3, _ rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
    }
    
    static func + (_ lhs: SCNVector3, _ rhs: Int) -> SCNVector3 {
        return SCNVector3(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs)
    }
    
    static func + (_ lhs: SCNVector3, _ rhs: Float) -> SCNVector3 {
        return SCNVector3(lhs.x + rhs, lhs.y + rhs, lhs.z + rhs)
    }
    
    static func - (_ lhs: SCNVector3, _ rhs: SCNVector3) -> SCNVector3 {
        return SCNVector3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
    }
    
    static func - (_ lhs: SCNVector3, _ rhs: Int) -> SCNVector3 {
        return SCNVector3(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs)
    }
    
    static func - (_ lhs: SCNVector3, _ rhs: Float) -> SCNVector3 {
        return SCNVector3(lhs.x - rhs, lhs.y - rhs, lhs.z - rhs)
    }
    
    static func * (_ lhs: SCNVector3, _ rhs: Int) -> SCNVector3 {
        return SCNVector3(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
    }
    
    static func * (_ lhs: SCNVector3, _ rhs: Float) -> SCNVector3 {
        return SCNVector3(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
    }
    
    static func / (_ lhs: SCNVector3, _ rhs: Float) -> SCNVector3 {
        return SCNVector3(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
    }
    
    static func * (_ lhs: SCNVector3, _ rhs: SCNVector3) -> SCNVector3 {
        return multiply(lhs, rhs)
    }
}

// functions
extension SCNVector3 {
    
    static func multiply(_ lhs: SCNVector3, _ rhs: SCNVector3) -> SCNVector3 {
        let x = lhs.x * lhs.x
        let y = lhs.y * lhs.y
        let z = lhs.z * lhs.z
        return SCNVector3(x, y, z)
    }
    
    mutating func multiply(_ by: SCNVector3) {
        self.x = self.x * by.x
        self.y = self.y * by.y
        self.z = self.z * by.z
    }
    
    func magnitude() -> Float {
        return sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
    }
    
    static func lerp(_ current: SCNVector3, _ target: SCNVector3, _ pct: Float) -> SCNVector3 {
        var pct = pct
        pct = pct < 0 ? 0 : pct
        pct = pct > 1 ? 1 : pct
        let a = current * (1-pct)
        let b = target * pct
        return a + b
    }
}

extension SCNQuaternion {
    
    init(_ simd_quat: simd_quatf) {
        self.init(simd_quat.vector)
    }
}
