//
//  TouchEventsResponder.swift
//  Music_Cube_proj
//
//  Created by Alex Nascimento on 16/05/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

protocol TouchEventsResponder: AnyObject {
    
    func touchedPad(pad: PadNode)
    func touchedArrows(arrowName: String)
    func touchedArrowIcon()
    func touchedBallIcon()
    func touchedArrowRotateIcon()
    func touchedArrowDeleteIcon()
    func touchedPlayIcon()
    func touchedPauseIcon()
    func touchedWipeIcon()
    func touchedNothing()
}
