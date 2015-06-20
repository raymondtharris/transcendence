//
//  Octalye.swift
//  transcendence
//
//  Created by Tim Harris on 5/23/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation


class Octalye: NSObject {
    var Name: String // Name of the Octalye
    var Level: Int // Level of the Octalye
    var Health: Int // Value of the Health of the Octalye
    init(newName: String, newLevel: Int, newHealth: Int) {
        // Init function of Octalye with parameter to make a particular one.
        self.Name = newName
        self.Level = newLevel
        self.Health = newHealth
    }
    func calculateFeeling() -> Int {
        //calculateFeeling Determines the emotion of the Octalye
        return 1
    }
}
