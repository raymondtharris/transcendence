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
    case joy
    case echo
    case order
    case regen
    case serenity
    //Chaos Phases
    case misery
    case astral
    case nova
    case oblivion
    case armageddon
}
enum typePhase { //All types of phases
    case harmony
    case chaos
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
