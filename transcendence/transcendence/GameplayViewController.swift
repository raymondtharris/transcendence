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
import MetalKit

class GameplayViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var pauseMenuView: UIView!
    
    @IBOutlet var GameplayView: MTKView!
    
    // IVars
    var loadData = 0
    let gyroManager = CMMotionManager()
    var device:MTLDevice! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseMenuView.isHidden = true
        device = MTLCreateSystemDefaultDevice()
        
        // Check for loaded data to see if new game or continue.
        
        
        
        // Gyroscope Setup
        if gyroManager.isGyroAvailable {
            gyroManager.gyroUpdateInterval = 0.1
            //gyroManager.startGyroUpdates()
            
            gyroManager.startGyroUpdates(to: OperationQueue.main()) {
                (data, error) in
                print(data)
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
    
    @IBAction func continueGame(_ sender: AnyObject) {
        pauseMenuView.isHidden = true
        // Count in to gameplay 3..2..1..Go
        
    }
    
    @IBAction func quitGame(_ sender: AnyObject) {
        //Create an alert action
        
        // if quit save data and exit to main menu
        
        // else return to the pause menu
        
        
    }
    
    
}
