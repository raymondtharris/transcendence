//
//  Kahr.swift
//  transcendence
//
//  Created by Tim Harris on 6/10/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

enum typeKahre {
    case Red
    case Blue
    case Green
    case Purple
    case Yellow
    case Orange
    case White
    case Black
}

class Kahre: NSObject {
    var kahreType: typeKahre
    var intensity: Int
    override init() {
        self.kahreType = typeKahre.Blue
        self.intensity = 2
    }
    init(kahreType: typeKahre, intensity: Int) {
        self.kahreType = kahreType
        self.intensity = intensity
    }
}