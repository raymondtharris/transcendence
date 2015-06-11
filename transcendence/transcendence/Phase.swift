//
//  Phase.swift
//  transcendence
//
//  Created by Tim Harris on 5/24/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

enum typePhase {
    //Harmony Phases
    case Joy
    case Echo
    case Order
    case Regen
    case Serenity
    //Chaos Phases
    case Misery
    case Astral
    case Nova
    case Oblivion
    case Armageddon
}

class Phase: NSObject {
    var Name: String
    var phaseType: typePhase
    init(newName: String, newPhaseType: typePhase) {
        self.Name = newName
        self.phaseType = newPhaseType
    }
}