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
    
    
    @IBOutlet var gameStatsView: SCNView!
    @IBOutlet weak var gameStatsOverlayView: UIView!

    
    var emmileahScene = SCNSphere()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sphereNode = SCNNode(geometry: emmileahScene)
        
        //self.view = SCNView(frame: self.view.frame)
        gameStatsView.scene?.rootNode.addChildNode(sphereNode)
        
        //gameStatsView.rootNode.addChildNode(sphereNode)
        
        
        //gameStatsSCNView.scene = gameScene
        gameStatsView.backgroundColor = UIColor.blue()
        gameStatsView.autoenablesDefaultLighting = true
        
        gameStatsOverlayView.layer.cornerRadius = 0.5
    }
    
    @IBAction func returnToGamePlayView(segue: UIStoryboardSegue) {
        
    }
}
