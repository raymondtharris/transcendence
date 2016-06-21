//
//  Kahr.swift
//  transcendence
//
//  Created by Tim Harris on 6/10/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

enum typeKahre { // the types of Kahre energy that comes at the player
    case red
    case blue
    case green
    case purple
    case yellow
    case orange
    case white
    case black
}

class Kahre: NSObject {
    var kahreType: typeKahre // the type of kahre
    var intensity: Int // the intensity of power of the kahre
    override init() {
        //Basic init function for the kahre class
        self.kahreType = typeKahre.blue
        self.intensity = 2
    }
    init(kahreType: typeKahre, intensity: Int) {
        // Init function for kahre with parameters to make a particular kahre
        self.kahreType = kahreType
        self.intensity = intensity
    }
}
