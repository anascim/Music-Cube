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
    struct WaveForm {
        static var sine = { (phase: Float) -> Float in
            return sin(phase)
        }
        
        static var triangle = { (phase: Float) -> Float in
            let frac = phase.truncatingRemainder(dividingBy: PI)
            return phase < PI ? frac : 1 - frac
        }
        
        static var rightsawtooth = { (phase: Float) -> Float in
            return (phase/TWO_PI) * 2.0 - 1.0
        }
        
        static var leftsawtooth = { (phase: Float) -> Float in
            return (1 - (phase/TWO_PI)) * 2.0 - 1.0
        }
        
        static var square = { (phase: Float) -> Float in
            return step(phase, edge: PI) * 2.0 - 1.0
        }
        
        static var whiteNoise = { (phase: Float) -> Float in
            return Float.random(in: -1...1)
        }
    }
    
    struct Envelope {
       
        var attack: Float
        var decay: Float
        var sustain: Float
        var release: Float
        
        var sustainDuration: Float
        
        var duration: Float {
            return attack + decay + sustain + release
        }
        
        func apply(volume: Float, time: Float) -> Float {
            var value: Float = 0
            if time < attack {
                value = time/attack
            } else if time < decay + attack {
                let relTime = time - attack
                let r = decay/relTime
                value = r * sustain + (1 - r)
            } else if time < sustainDuration + decay + attack {
                value = sustain
            } else {
//                let relTime = time - sustainDuration + decay + attack
//                value = (1 - release/relTime) * sustain
                value = 0
            }
            return value * volume
        }
    }
}
