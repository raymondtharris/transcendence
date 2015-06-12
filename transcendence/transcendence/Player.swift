//
//  Player.swift
//  transcendence
//
//  Created by Tim Harris on 6/11/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

class Player: NSObject {
    var Emmi: Octalye
    var Leah: Octalye
    var playerPhase: Phase
    var comboQueue: GrooveQueue
    var Experience: Int
    var Feeling: String
    override init() {
        self.Emmi = Octalye(newName: "Emmi", newLevel: 1, newHealth: 20)
        self.Leah = Octalye(newName: "Leah", newLevel: 1, newHealth: 20)
        self.playerPhase = Phase(newName: namePhase.Joy, newPhaseType: typePhase.Harmony)
        self.comboQueue = GrooveQueue()
        self.Experience = 0
        self.Feeling = "Neutral"
    }
}