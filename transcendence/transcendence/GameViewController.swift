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
    
    let vertexData:[Float] = [
        0.0, 1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0]
    var vertexBuffer:MTLBuffer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        device  = MTLCreateSystemDefaultDevice()
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .BGRA8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
        
        let dataSize = vertexData.count * sizeofValue(vertexData[0])
        vertexBuffer = device.newBufferWithBytes(vertexData, length: dataSize, options: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
