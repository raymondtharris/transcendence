//
//  Octalye.swift
//  transcendence
//
//  Created by Tim Harris on 5/23/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation


class Octalye: NSObject {
    var Name: String
    var Level: Int
    var Health: Int
    init(newName: String, newLevel: Int, newHealth: Int) {
        self.Name = newName
        self.Level = newLevel
        self.Health = newHealth
    }
    func calculateFeeling() -> Int {
        //calculateFeeling Determines the emotion of the Octalye
        return 1
    }
}
