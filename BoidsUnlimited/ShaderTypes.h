//
//  ShaderTypes.h
//  BoidsUnlimited
//
//  Created by Robert Waltham on 2021-04-02.
//

//
//  Header containing types and enum constants shared between Metal shaders and Swift/ObjC source
//
#ifndef ShaderTypes_h
#define ShaderTypes_h

#ifdef __METAL_VERSION__
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#define NSInteger metal::int32_t
#else
#import <Foundation/Foundation.h>
#endif

#include <simd/simd.h>

// Buffer index values shared between shader and C code to ensure Metal shader buffer inputs
// match Metal API buffer set calls.

typedef enum SecondPassInputIndex {
    SecondPassInputIndexParticle = 0,
    SecondPassInputIndexParticleCount = 1,
    SecondPassInputIndexMaxSpeed = 2,
    SecondPassInputIndexMargin = 3,
    SecondPassInputIndexAlign = 4,
    SecondPassInputIndexCohere = 5,
    SecondPassInputIndexSeparate = 6,
    SecondPassInputIndexRadius = 7,
    SecondPassInputIndexWidth = 8,
    SecondPassInputIndexHeight = 9,
    SecondPassInputIndexObstacle = 10,
    SecondPassInputIndexObstacleCount = 11

} SecondPassInputIndex;

typedef enum ThirdPassInputIndex {
    ThirdPassInputTextureIndexParticle = 0,
    ThirdPassInputTextureIndexRadius = 1,
} ThirdPassInputTextureIndex;

#endif /* ShaderTypes_h */

