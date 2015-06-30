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
    
    //let vertexData:[Float] = [0.0, 1.0, 0.0,-1.0, -1.0, 0.0,1.0, -1.0, 0.0]
    
    //var vertexBuffer: MTLBuffer! = nil
    var objectToDraw: Cube!//Triangle!
    
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
        
        //let dataSize:Int = vertexData.count * sizeofValue(vertexData[0])
        //vertexBuffer = self.device.newBufferWithBytes(vertexData, length: dataSize, options: MTLResourceOptions.OptionCPUCacheModeDefault)
        objectToDraw = Cube(device: device)//Triangle(device: device)
        
        
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
        let drawable = metalLayer.nextDrawable()
        objectToDraw.render(commandQueue, pipelineState: pipelineState, drawable: drawable!, clearColor: nil)
        
       /*
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable?.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .Clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: 0.0, green: 104.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        
        let commandBuffer = commandQueue.commandBuffer()
        
        let renderEncodeOpt = commandBuffer.renderCommandEncoderWithDescriptor(renderPassDescriptor)
        renderEncodeOpt.setRenderPipelineState(pipelineState)
        renderEncodeOpt.setVertexBuffer(vertexBuffer, offset: 0, atIndex: 0)
        renderEncodeOpt.drawPrimitives(.Triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
        renderEncodeOpt.endEncoding()
        
        commandBuffer.presentDrawable(drawable!)
        commandBuffer.commit()
        */
        
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
