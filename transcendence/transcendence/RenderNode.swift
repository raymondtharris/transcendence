//
//  RenderNode.swift
//  transcendence
//
//  Created by Tim Harris on 6/22/15.
//  Copyright © 2015 Tim Harris. All rights reserved.
//

import Foundation
import Metal
import QuartzCore


struct RenderVertex {
    var x,y,z: Float // Position Data
    var r,g,b,a: Float // Color Data
    
    func dataBuffer() -> [Float]{
        return [x,y,z,r,g,b,a]
    }
}

class RenderNode {
    let name:String
    var vertexCount: Int
    var vertexBuffer: MTLBuffer
    var device: MTLDevice
    init(name: String, verticies: Array<RenderVertex>, device: MTLDevice) {
        var vertexData = Array<Float>()
        for vertex in verticies {
            vertexData += vertex.dataBuffer()
        }
        
        let dataSize = vertexData.count * sizeofValue(vertexData[0])
        vertexBuffer = device.newBufferWithBytes(vertexData, length: dataSize, options: MTLResourceOptions.OptionCPUCacheModeDefault)
        
        self.name = name
        self.device = device
        vertexCount = verticies.count
    }
    
    func render(commandQueue: MTLCommandQueue, pipelineState: MTLRenderPipelineState, drawable: CAMetalDrawable, clearColor:MTLClearColor?) {
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .Clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: 0.0, green: 104.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        
        let commandBuffer = commandQueue.commandBuffer()
        
        let renderEncodeOpt = commandBuffer.renderCommandEncoderWithDescriptor(renderPassDescriptor)
        renderEncodeOpt.setRenderPipelineState(pipelineState)
        renderEncodeOpt.setVertexBuffer(vertexBuffer, offset: 0, atIndex: 0)
        renderEncodeOpt.drawPrimitives(.Triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
        renderEncodeOpt.endEncoding()
        
        commandBuffer.presentDrawable(drawable)
        commandBuffer.commit()
    }
}


class Triangle: RenderNode {
    init(device: MTLDevice){
        
        let V0 = RenderVertex(x: 0.0, y: 1.0, z: 0.0, r: 1.0, g: 0.0, b: 0.0, a: 1.0)
        let V1 = RenderVertex(x: -1.0, y: -1.0, z: 0.0, r: 0.0, g: 1.0, b: 0.0, a: 1.0)
        let V2 = RenderVertex(x: 1.0, y: -1.0, z: 0.0, r: 0.0, g: 0.0, b: 1.0, a: 1.0)
        
        let VertexArray = [V0,V1,V2]
        super.init(name: "Triangle", verticies: VertexArray, device: device)
    }
}