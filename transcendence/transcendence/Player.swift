//
//  Player.swift
//  transcendence
//
//  Created by Tim Harris on 6/11/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

class Player: NSObject {
    var Emmi: Octalye  //One half of the Octalye duo
    var Leah: Octalye   //Other half of the Octalye duo
    var playerPhase: Phase // Current Phase that the Octalye duo are in
    var comboQueue: GrooveQueue // The Queue data structure that works through the combo stream for the player
    var Experience: Int // The number of experience that the player has accumulated
    var Feeling: String // The current Feeling that the Octalye duo is experiencing
    override init() {
        // Basic init function that gives some default values for the player setup
        self.Emmi = Octalye(newName: "Emmi", newLevel: 1, newHealth: 20)
        self.Leah = Octalye(newName: "Leah", newLevel: 1, newHealth: 20)
        self.playerPhase = Phase(newName: namePhase.joy, newPhaseType: typePhase.harmony)
        self.comboQueue = GrooveQueue()
        self.Experience = 0
        self.Feeling = "Neutral"
    }
}
