//
//  ElementIconNames.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 17/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

enum ElementIconNames: CaseIterable {
    
    case arrow
    case arrowRotate
    case ball
    
    var string: String {
        switch self {
        case .arrow: return "arrow_element_icon"
        case .arrowRotate: return "arrow_rotate_icon"
        case .ball: return "ball_element_icon"
        }
    }
}
