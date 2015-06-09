//
//  GrooveQueue.swift
//  transcendence
//
//  Created by Tim Harris on 6/8/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

class GrooveNode: NSObject {
    var grooveDuration: Int
    var grooveType: String
    var grooveName: String
    var next: GrooveNode? = nil
    override init() {
        self.grooveDuration = 4
        self.grooveType = "FreeStyle"
        self.grooveName = "Lucid"
    }
}

class GrooveQueue: NSObject {
    var currentGrooveNode: GrooveNode? = nil
    var First: GrooveNode? = nil
    var Last: GrooveNode? = nil
    var Length: Int
    override init() {
        self.Length = 0
    }
    
    func enqueue(newGroove:GrooveNode) {
        
    }
    
    func dequeue() -> GrooveNode? {
        return nil
    }
    
    func isEmpty() -> Bool {
        if self.Length > 0 {
            return false
        }
        return true
    }
}

