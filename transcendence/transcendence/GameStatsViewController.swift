//
//  GameStatsViewController.swift
//  transcendence
//
//  Created by Tim Harris on 7/11/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit
import SceneKit



class GameStatsViewController: UIViewController {
    
    
    @IBOutlet weak var gameStatsSCNView: SCNView!
    
    let gameScene = SCNScene()
    var emmileahScene = SCNSphere()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sphereNode = SCNNode(geometry: emmileahScene)
        
        gameScene.rootNode.addChildNode(sphereNode)
        
        
        gameStatsSCNView.scene = gameScene
        gameStatsSCNView.backgroundColor = UIColor.blue()
    }
    
    @IBAction func returnToGamePlayView(segue: UIStoryboardSegue) {
        
    }
}
