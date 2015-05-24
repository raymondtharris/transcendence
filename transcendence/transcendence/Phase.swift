//
//  Phase.swift
//  transcendence
//
//  Created by Tim Harris on 5/24/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

class Phase: NSObject {
    var Name: String
    var phaseType: String
    init(newName: String, newPhaseType: String) {
        self.Name = newName
        self.phaseType = newPhaseType
    }
}