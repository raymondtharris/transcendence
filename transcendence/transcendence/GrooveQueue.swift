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
    var grooveMultiplier: Int
    var Length: Int
    override init() {
        self.Length = 0
        self.grooveMultiplier = 0
    }
    
    func enqueue(newGroove:GrooveNode) {
        if let hasHead = self.First {
            self.Last?.next = newGroove
            self.Last = newGroove
        }else{
            self.First = newGroove
            self.Last = self.First
        }
        self.Length++
    }
    
    func dequeue() -> GrooveNode? {
        if let hasHead = self.First {
            var returnNode = hasHead
            self.First = self.First?.next
            self.Length--
            return returnNode
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        if self.Length > 0 {
            return false
        }
        return true
    }
    
    func grooveComboCheck() {
        var newGrooveNode = self.dequeue()
        if let hasNewGroove = newGrooveNode {
            if hasNewGroove.grooveType == currentGrooveNode!.grooveType {
                print("Combo the Groove.")
            }
        }
    }
    
    func calculateGrooveCombo(currentGrooveNode: GrooveNode, newGrooveNode: GrooveNode) {
        if currentGrooveNode.grooveName == newGrooveNode.grooveName {
            self.grooveMultiplier++
        } else {
            print("Fusion Groove")
            // use fusion calculator to determine new Fusion Groove
            self.grooveMultiplier = 2
        }
    }
}

