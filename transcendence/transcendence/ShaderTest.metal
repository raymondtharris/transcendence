//
//  ShaderTest.metal
//  transcendence
//
//  Created by Tim Harris on 6/17/15.
//  Copyright © 2015 Tim Harris. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex(const device packed_float3* vertex_array[[buffer(0)]], unsigned int vid [[vertex_id]]){
    return float4(vertex_array[vid], 1.0);
}
