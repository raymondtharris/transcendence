//
//  ShaderTest.metal
//  transcendence
//
//  Created by Tim Harris on 6/17/15.
//  Copyright © 2015 Tim Harris. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn{
    packed_float3 position; //position vector
    packed_float4 color; // color vector
};

struct VertexOut{
    float4 position [[position]]; //position values
    float4 color; //color values
};

vertex VertexOut basic_vertex(const device VertexIn* vertex_array[[buffer(0)]], unsigned int vid [[vertex_id]]){
    // This vertex shader sets up the position and color values for the fragment shader
    VertexIn VertexIn = vertex_array[vid];
    VertexOut VertexOut;
    VertexOut.position =float4(VertexIn.position, 1);
    VertexOut.color = VertexIn.color;
    
    return VertexOut;
    //return float4(vertex_array[vid], 1.0);
}

fragment half4 basic_fragment(VertexOut interpolated [[stage_in]]) {
    return half4(interpolated.color[0], interpolated.color[1], interpolated.color[2], interpolated.color[3]); //returns the color values for the shader
    //return half4(1.0);
}


