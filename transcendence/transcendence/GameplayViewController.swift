//
//  GameplayViewController.swift
//  transcendence
//
//  Created by Tim Harris on 7/8/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

class GameplayViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseMenuView: UIView!
    
    // IVars
    var loadData = 0
    let gyroManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseMenuView.isHidden = true
        
        // Check for loaded data to see if new game or continue.
        
        
        
        // Gyroscope Setup
        if gyroManager.isGyroAvailable {
            gyroManager.gyroUpdateInterval = 0.1
            //gyroManager.startGyroUpdates()
            
            gyroManager.startGyroUpdates(to: OperationQueue.main()) {
                (data, error) in
                
            }
            
        }
    }
    
    @IBAction func togglePauseMenu(_ sender: AnyObject) {
        if pauseMenuView.isHidden {
            // Add Animation to show view.
            pauseMenuView.isHidden = false
            gyroManager.stopGyroUpdates()
        } else {
            pauseMenuView.isHidden = true
            gyroManager.startGyroUpdates(to: OperationQueue.main()) {
                (data, error) in
                
            }
        }
    }
    
    
    
}
