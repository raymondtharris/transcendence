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
        // dataBuffer returns an array of all the RenderVertex data formated in the order that it is set up in the struct
        return [x,y,z,r,g,b,a]
    }
}

class RenderNode {
    // Base RenderNode Class
    let name:String // Name of the node
    var vertexCount: Int // Number of vertecies then node has
    var vertexBuffer: MTLBuffer // Vertex Buffer for the node
    var device: MTLDevice // Device to use for node
    
    init(name: String, verticies: Array<RenderVertex>, device: MTLDevice) {
        // Init function for the RenderNode class
        var vertexData = Array<Float>()
        for vertex in verticies {
            vertexData += vertex.dataBuffer()
        }
        
        let dataSize = vertexData.count * sizeofValue(vertexData[0])
        vertexBuffer = device.newBuffer(withBytes: vertexData, length: dataSize, options: MTLResourceOptions())
        
        self.name = name
        self.device = device
        vertexCount = verticies.count
    }
    
    func render(_ commandQueue: MTLCommandQueue, pipelineState: MTLRenderPipelineState, drawable: CAMetalDrawable, clearColor:MTLClearColor?) {
        // Render function 
        let renderPassDescriptor = MTLRenderPassDescriptor()
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        renderPassDescriptor.colorAttachments[0].loadAction = .clear
        renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColor(red: 0.0, green: 104.0/255.0, blue: 5.0/255.0, alpha: 1.0)
        
        let commandBuffer = commandQueue.commandBuffer()
        
        let renderEncodeOpt = commandBuffer.renderCommandEncoder(with: renderPassDescriptor)
        renderEncodeOpt.setRenderPipelineState(pipelineState)
        renderEncodeOpt.setVertexBuffer(vertexBuffer, offset: 0, at: 0)
        renderEncodeOpt.drawPrimitives(.triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
        renderEncodeOpt.endEncoding()
        
        commandBuffer.present(drawable)
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

class Cube: RenderNode {
    init(device: MTLDevice){
        
        let A = RenderVertex(x: -1.0, y:   1.0, z:   1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0)
        let B = RenderVertex(x: -1.0, y:  -1.0, z:   1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0)
        let C = RenderVertex(x:  1.0, y:  -1.0, z:   1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0)
        let D = RenderVertex(x:  1.0, y:   1.0, z:   1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0)
        
        let Q = RenderVertex(x: -1.0, y:   1.0, z:  -1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0)
        let R = RenderVertex(x:  1.0, y:   1.0, z:  -1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0)
        let S = RenderVertex(x: -1.0, y:  -1.0, z:  -1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0)
        let T = RenderVertex(x:  1.0, y:  -1.0, z:  -1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0)
        
        let verticesArray:Array<RenderVertex> = [
            A,B,C ,A,C,D,   //Front
            R,T,S ,Q,R,S,   //Back
            
            Q,S,B ,Q,B,A,   //Left
            D,C,T ,D,T,R,   //Right
            
            Q,A,D ,Q,D,R,   //Top
            B,S,T ,B,T,C    //Bot
        ]
        
        super.init(name: "Cube", verticies: verticesArray, device: device)
    }
}
