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
    
    let vertexData:[Float] = [0.0, 1.0, 0.0,-1.0, -1.0, 0.0,1.0, -1.0, 0.0]
    
    var vertexBuffer: MTLBuffer! = nil
    var pipelineState: MTLRenderPipelineState! = nil
    var commandQueue: MTLCommandQueue! = nil
    var displayLink: CADisplayLink! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        device  = MTLCreateSystemDefaultDevice()
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .BGRA8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
        
        let dataSize:Int = vertexData.count * sizeofValue(vertexData[0])
        vertexBuffer = device.newBufferWithBytes(vertexData, length: dataSize, options:nil)
        
        let defaultLibrary = device.newDefaultLibrary()
        let fragmentProgram = defaultLibrary!.newFunctionWithName("basic_fragment")
        let vertexProgram = defaultLibrary!.newFunctionWithName("basic_vertex")
        
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexProgram!
        pipelineDescriptor.fragmentFunction = fragmentProgram!
        pipelineDescriptor.colorAttachments[0].pixelFormat = .BGRA8Unorm
        
        var pipelineError:NSError?
        do{
            try pipelineState = device.newRenderPipelineStateWithDescriptor(pipelineDescriptor)
        } catch{
           print("Failed to create pipeline state, error \(pipelineError)")
        }
        commandQueue = device.newCommandQueue()
        
        displayLink = CADisplayLink(target: self, selector: Selector("gameloop"))
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
        
        
        
    }
    
    func render(){
        
    }
    func gameloop(){
        autoreleasepool{
            self.render()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
