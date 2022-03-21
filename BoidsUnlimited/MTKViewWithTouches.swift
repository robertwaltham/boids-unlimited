//
//  MTKViewWithTouches.swift
//  BoidsUnlimited
//
//  Created by Robert Waltham on 2022-03-24.
//

import Foundation
import MetalKit

class MTKViewWithTouches: MTKView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let renderer = self.delegate as? BoidsRenderer {
            renderer.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let renderer = self.delegate as? BoidsRenderer {
            renderer.touchesMoved(touches, with: event)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let renderer = self.delegate as? BoidsRenderer {
            renderer.touchesEnded(touches, with: event)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let renderer = self.delegate as? BoidsRenderer {
            renderer.touchesCancelled(touches, with: event)
        }
    }

}
