//
//  GameViewController.swift
//  transcendence
//
//  Created by Tim Harris on 6/17/15.
//  Copyright © 2015 Tim Harris. All rights reserved.
//

import Foundation
import UIKit
import Metal
import QuartzCore

class GameViewController: UIViewController {
    var device:MTLDevice! = nil
    var metalLayer:CAMetalLayer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        device  = MTLCreateSystemDefaultDevice()
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .BGRA8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
