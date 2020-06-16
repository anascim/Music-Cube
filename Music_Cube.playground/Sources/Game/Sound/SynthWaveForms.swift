//
//  SynthExtensions.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 17/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import AVFoundation

extension Synth {
    
    // Signal waves... phase is supposed to be a radian value. The returns are on a range [-1...1]
    public struct WaveForm {
        public static var sine = { (phase: Float) -> Float in
            return sin(phase)
        }
        
        public static var triangle = { (phase: Float) -> Float in
            let frac = phase.truncatingRemainder(dividingBy: PI)
            return phase < PI ? frac : 1 - frac
        }
        
        public static var rightsawtooth = { (phase: Float) -> Float in
            return (phase/TWO_PI) * 2.0 - 1.0
        }
        
        public static var leftsawtooth = { (phase: Float) -> Float in
            return (1 - (phase/TWO_PI)) * 2.0 - 1.0
        }
        
        public static var square = { (phase: Float) -> Float in
            return step(phase, edge: PI) * 2.0 - 1.0
        }
        
        public static var whiteNoise = { (phase: Float) -> Float in
            return Float.random(in: -1...1)
        }
    }
    
}
