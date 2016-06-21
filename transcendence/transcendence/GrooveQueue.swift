//
//  GrooveQueue.swift
//  transcendence
//
//  Created by Tim Harris on 6/8/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

enum typeGroove { // Types of Grooves
    case freeStyle
    case metered
    case flow
}

enum nameGroove { // Names of Grooves
    case lucid
    case synccopation
    case polyrhythmic
    case overBar
    case oddTime
    case jam
    case shuffle
    
    var description: String {  //print string for groove names
        switch self {
        case .lucid: return "Lucid"
        case .synccopation: return "Synccopation"
        case .polyrhythmic: return "Polyrhythmic"
        case .overBar: return "OverBar"
        case .oddTime: return "OddTime"
        case .jam: return "Jam"
        case .shuffle: return "Shuffle"
        }
    }
}

class GrooveNode: NSObject {
    var grooveDuration: Int // The duration of the groove node
    var grooveType: typeGroove // type of groove for the node
    var grooveName: nameGroove // name of the groove for the node
    var next: GrooveNode? = nil // The next node connected to this groove node
    override init() {
        // Basic init function with some default values
        self.grooveDuration = 4
        self.grooveType = typeGroove.freeStyle
        self.grooveName = nameGroove.lucid
    }
    init(grooveDuration: Int, grooveType: typeGroove, grooveName: nameGroove) {
        
        self.grooveDuration = grooveDuration
        self.grooveType = grooveType
        self.grooveName = grooveName
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
    
    func enqueue(_ newGroove:GrooveNode) {
        if let _ = self.First {
            self.Last?.next = newGroove
            self.Last = newGroove
        }else{
            self.First = newGroove
            self.Last = self.First
        }
        self.Length += 1
    }
    
    func dequeue() -> GrooveNode? {
        if let hasHead = self.First {
            let returnNode = hasHead
            self.First = self.First?.next
            self.Length -= 1
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
        let newGrooveNode = self.dequeue()
        if let hasNewGroove = newGrooveNode {
            if hasNewGroove.grooveType == currentGrooveNode!.grooveType {
                print("Combo the Groove.")
            }
        }
    }
    
    func calculateGrooveCombo(_ currentGrooveNode: GrooveNode, newGrooveNode: GrooveNode) {
        if currentGrooveNode.grooveName == newGrooveNode.grooveName {
            self.grooveMultiplier += 1
        } else {
            print("Fusion Groove")
            // use fusion calculator to determine new Fusion Groove
            self.grooveMultiplier = 2
        }
    }
}

