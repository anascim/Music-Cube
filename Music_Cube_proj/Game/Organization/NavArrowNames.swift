//
//  Organizer.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

enum NavArrowNames: CaseIterable {
    
    case left
    case right
    case up
    case down
    
    var string: String {
        switch self {
        case .left: return "left-arrow"
        case .right: return "right-arrow"
        case .up: return "up-arrow"
        case .down: return "down-arrow"
        }
    }
    
    static func isArrowName(_ str: String?) -> Bool {
        guard let str = str else { return false }
        for i in Self.allCases {
            if str == i.string { return true }
        }
        return false
    }
}
