//
//  Colors.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 17/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import UIKit.UIColor

// https://colorhunt.co/palette/180404
enum Colors {
    
//    case orange
//    case white
//    case blue
//    case pink
//    case red
//    case green
    case yellow
    case lightBlue
    case deepBlue
    case darkBlue
    
    var color: UIColor {
        switch self {
        case .yellow: return UIColor(hex: 0xfcbf1e)
        case .lightBlue: return UIColor(hex: 0x40bad5)
        case .deepBlue: return UIColor(hex: 0x035aa6)
        case .darkBlue: return UIColor(hex: 0x120136)
        }
    }
}

extension UIColor {
    convenience init(hex: Int) {
        let r = CGFloat((hex >> 16) & 0xff)
        let g = CGFloat((hex >> 8) & 0xff)
        let b = CGFloat(hex & 0xff)
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
