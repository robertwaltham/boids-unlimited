//
//  MetalView.swift
//  SwiftUIMacos
//
//  Created by Robert Waltham on 2022-02-27.
//

import Foundation
import MetalKit
import SwiftUI

struct MetalView: UIViewRepresentable {
    
    typealias UIViewType = MTKView
    
    @Binding var alignCoefficient: Float
    @Binding var cohereCoefficient: Float
    @Binding var separateCoefficient: Float
    
    @Binding var drawSize: Float
      
    @Binding var count: Int
    @Binding var maxSpeed: Float
    @Binding var radius: Float
    
    init(alignCoefficient: Binding<Float>, cohereCoefficient: Binding<Float>, separateCoefficient: Binding<Float>, drawSize: Binding<Float>, count: Binding<Int>, radius: Binding<Float>, maxSpeed: Binding<Float>) {
        self._alignCoefficient = alignCoefficient
        self._cohereCoefficient = cohereCoefficient
        self._separateCoefficient = separateCoefficient
        
        self._drawSize = drawSize
        
        self._count = count
        self._maxSpeed = maxSpeed
        self._radius = radius
    }

    func makeUIView(context: Context) -> MTKView {
        let mtkView = MTKViewWithTouches()
        mtkView.delegate = context.coordinator
        
        guard let coordinator = context.coordinator as? BoidsRenderer else {
            fatalError("wrong coordinator")
        }
        
        mtkView.preferredFramesPerSecond = 60
        mtkView.enableSetNeedsDisplay = true
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkView.device = metalDevice
        }
        mtkView.framebufferOnly = false
        mtkView.clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 0)
        mtkView.drawableSize = mtkView.frame.size
        mtkView.enableSetNeedsDisplay = true
        mtkView.isPaused = false
        mtkView.preferredFramesPerSecond = 30
        mtkView.isMultipleTouchEnabled = true
        coordinator.view = mtkView
        coordinator.buildPipeline()
        
        return mtkView
    }
    
    func updateUIView(_ uiView: MTKView, context: Context) {
        let boidsRenderer = context.coordinator as? BoidsRenderer
        boidsRenderer?.separateCoefficient = separateCoefficient
        boidsRenderer?.alignCoefficient = alignCoefficient
        boidsRenderer?.cohereCoefficient = cohereCoefficient
        
        boidsRenderer?.drawRadius = Int(drawSize)
        
        boidsRenderer?.maxSpeed = maxSpeed
        boidsRenderer?.radius = radius
        boidsRenderer?.particleCount = count
    }
    
    func makeCoordinator() -> Coordinator {
        BoidsRenderer(self)
    }
    
    class Coordinator : NSObject, MTKViewDelegate {
        
        func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
            
        }
        
        func draw(in view: MTKView) {
            
        }
    }
}
