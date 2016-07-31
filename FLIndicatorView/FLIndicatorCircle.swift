//
//  FLIndicatorCircle.swift
//  FLindicator
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class FLIndicatorCircle: FLIndicatorDelegate {
    
    func setupAnimationInLayer(layer: CALayer, size: CGFloat, color: UIColor) {
        
        
            let dotSize  = size / 10
            let centerY = size/2 - dotSize / 2
        
            let dot = CAShapeLayer()
            dot.frame = CGRect(
                x: 0,
                y: 0,
                width:dotSize,
                height: dotSize)
            
            dot.position = CGPointMake(size-dotSize, centerY)
            dot.path = UIBezierPath(ovalInRect: CGRect(x: 0, y:0, width: dotSize, height: dotSize)).CGPath
            dot.fillColor = color.CGColor
            dot.transform =  CATransform3DMakeScale(0.01, 0.01, 0.01)
            
            let replicatorLayer = CAReplicatorLayer()
            replicatorLayer.frame = CGRect(x: 0,y: 0,width: size ,height: size)
            replicatorLayer.instanceDelay = 0.0
    
            replicatorLayer.instanceCount = 15
            replicatorLayer.instanceDelay = 1/15
            let angle = CGFloat(2 * M_PI) / CGFloat(15)
            replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
            replicatorLayer.addSublayer(dot)
            layer.addSublayer(replicatorLayer)
            dot.addAnimation(rotationAnimation(), forKey: "rotateAnimation")
        }
        
        func rotationAnimation() -> CABasicAnimation{
            let scale = CABasicAnimation(keyPath: "transform.scale")
            scale.fromValue = 1
            scale.toValue = 0.1
            scale.duration = 1
            scale.repeatCount = HUGE
            
            return scale
        }
    

}
