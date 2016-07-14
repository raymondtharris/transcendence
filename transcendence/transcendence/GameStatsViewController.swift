//
//  GameStatsViewController.swift
//  transcendence
//
//  Created by Tim Harris on 7/11/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class GameStatsViewController: UIViewController {
    
    
    @IBOutlet weak var SpriteImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpriteImageView.addSubview(SKView())
        
        
    }
    
    @IBAction func returnToGamePlayView(segue: UIStoryboardSegue) {
        
    }
}
