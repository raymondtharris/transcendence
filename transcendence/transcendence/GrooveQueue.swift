//
//  GrooveQueue.swift
//  transcendence
//
//  Created by Tim Harris on 6/8/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import Foundation

enum typeGroove { // Types of Grooves
    case FreeStyle
    case Metered
    case Flow
}

enum nameGroove { // Names of Grooves
    case Lucid
    case Synccopation
    case Polyrhythmic
    case OverBar
    case OddTime
    case Jam
    case Shuffle
    
    var description: String {  //print string for groove names
        switch self {
        case .Lucid: return "Lucid"
        case .Synccopation: return "Synccopation"
        case .Polyrhythmic: return "Polyrhythmic"
        case .OverBar: return "OverBar"
        case .OddTime: return "OddTime"
        case .Jam: return "Jam"
        case .Shuffle: return "Shuffle"
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
        self.grooveType = typeGroove.FreeStyle
        self.grooveName = nameGroove.Lucid
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
    
    func enqueue(newGroove:GrooveNode) {
        if let _ = self.First {
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
            let returnNode = hasHead
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
        let newGrooveNode = self.dequeue()
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

