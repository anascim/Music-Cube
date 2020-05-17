//
//  PlaybackIconNames.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 17/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

enum ControlIconNames {
    
    case play
    case pause
    case wipe
    
    var string: String {
        switch self {
        case .play: return "play-icon"
        case .pause: return "pause-icon"
        case .wipe: return "wipe-icon"
        }
    }
}
