//
//  ViewController.swift
//  transcendence
//
//  Created by Tim Harris on 5/23/15.
//  Copyright (c) 2015 Tim Harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var playerObject: Player = Player()
    var testTime: Timer? = nil
    var node1 = GrooveNode(grooveDuration: 10, grooveType: typeGroove.freeStyle, grooveName: nameGroove.jam)
    var node2 = GrooveNode(grooveDuration: 10, grooveType: typeGroove.flow, grooveName: nameGroove.shuffle)
    var node3 = GrooveNode(grooveDuration: 10, grooveType: typeGroove.flow, grooveName: nameGroove.shuffle)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(playerObject.Emmi.Name)
        playerObject.comboQueue.enqueue(node1)
        playerObject.comboQueue.enqueue(node2)
        playerObject.comboQueue.enqueue(node3)
        testTime = Timer.scheduledTimer(timeInterval: 2, target: self, selector: Selector("updateCheck:"), userInfo: nil, repeats: true)
        playerObject.comboQueue.currentGrooveNode = playerObject.comboQueue.dequeue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCheck(_ timer: Timer) {
        if playerObject.comboQueue.currentGrooveNode?.grooveDuration > 0{
            playerObject.comboQueue.currentGrooveNode?.grooveDuration -= 1
        } else {
            if playerObject.comboQueue.Length > 0  {
                playerObject.comboQueue.currentGrooveNode = playerObject.comboQueue.dequeue()
            }
        }
        print("GrooveName \(playerObject.comboQueue.currentGrooveNode!.grooveName.description)  grooveDuration \(playerObject.comboQueue.currentGrooveNode!.grooveDuration)")
    }

}

