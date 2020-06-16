//
//  Note.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 17/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import Foundation

public enum Note {
    
    // From c3 to c6
    public static let C: [Float] = [130.81, 261.62, 523.24, 1046.5]
    public static let CS: [Float] = [138.59, 277.18, 554.37]
    public static let D: [Float] = [146.83, 293.66, 587.32]
    public static let DS: [Float] = [155.56, 311.13, 622.25]
    public static let E: [Float] = [164.81, 329.62, 659.24]
    public static let F: [Float] = [174.61, 349.23, 523.25]
    public static let FS: [Float] = [185, 370, 740]
    public static let G: [Float] = [196, 392, 784]
    public static let GS: [Float] = [207.18, 415.30, 830.61]
    public static let A: [Float] = [220, 440, 880]
    public static let AS: [Float] = [233.08, 466.16, 932.33]
    public static let B: [Float] = [246.94, 493.88, 987.77]
    
    public static var CPentatonic: [Float] = {
        return C + D + E + FS + A
    }()
    
    public static var CMajor: [Float] = {
        return C + D + E + F + G + A + B
    }()
    
    case C3
    case C4
    case C5
    case C6
    case CS3
    case CS4
    case CS5
    case D3
    case D4
    case D5
    case DS3
    case DS4
    case DS5
    case E3
    case E4
    case E5
    case F3
    case F4
    case F5
    case FS3
    case FS4
    case FS5
    case G3
    case G4
    case G5
    case GS3
    case GS4
    case GS5
    case A3
    case A4
    case A5
    case AS3
    case AS4
    case AS5
    case B3
    case B4
    case B5
    
    public var freq: Float {
        switch self {
        case .C3: return Note.C[0]
        case .C4: return Note.C[1]
        case .C5: return Note.C[2]
        case .C6: return Note.C[3]
        case .CS3: return Note.CS[0]
        case .CS4: return Note.CS[1]
        case .CS5: return Note.CS[2]
        case .D3: return Note.D[0]
        case .D4: return Note.D[1]
        case .D5: return Note.D[2]
        case .DS3: return Note.DS[0]
        case .DS4: return Note.DS[1]
        case .DS5: return Note.DS[2]
        case .E3: return Note.E[0]
        case .E4: return Note.E[1]
        case .E5: return Note.E[2]
        case .F3: return Note.F[0]
        case .F4: return Note.F[1]
        case .F5: return Note.F[2]
        case .FS3: return Note.FS[0]
        case .FS4: return Note.FS[1]
        case .FS5: return Note.FS[2]
        case .G3: return Note.G[0]
        case .G4: return Note.G[1]
        case .G5: return Note.G[2]
        case .GS3: return Note.GS[0]
        case .GS4: return Note.GS[1]
        case .GS5: return Note.GS[2]
        case .A3: return Note.A[0]
        case .A4: return Note.A[1]
        case .A5: return Note.A[2]
        case .AS3: return Note.AS[0]
        case .AS4: return Note.AS[1]
        case .AS5: return Note.AS[2]
        case .B3: return Note.B[0]
        case .B4: return Note.B[1]
        case .B5: return Note.B[2]
        }
    }
}
