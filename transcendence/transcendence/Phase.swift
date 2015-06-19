//
//  Phase.swift
//  transcendence
//
//  Created by Tim Harris on 5/24/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

enum namePhase { //Names of all available phases
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
enum typePhase { //All types of phases
    case Harmony
    case Chaos
}

class Phase: NSObject {
    var Name: namePhase // Name of the phase
    var phaseType: typePhase // Type of the phase
    init(newName: namePhase, newPhaseType: typePhase) {
        // Init function for phase that has parameters to make a particular phase
        self.Name = newName
        self.phaseType = newPhaseType
    }
}