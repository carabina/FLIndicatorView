//
//  FLIndicatorScale.swift
//  FLindicator
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

class FLIndicatorScale: FLIndicatorDelegate {
    
        func setupAnimationInLayer(layer:CALayer,size:CGFloat, color:UIColor) {
            
            let pulse = CAShapeLayer()
            pulse.frame = CGRect(x: 0,y: 0,width: size,height: size)
            pulse.path = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: size, height: size)).CGPath
            pulse.fillColor = color.CGColor
            
            let replicatorLayer = CAReplicatorLayer()
            replicatorLayer.frame = CGRect(x: 0,y: 0,width: size,height: size)
            
            replicatorLayer.instanceCount = 2
            replicatorLayer.instanceDelay = 1/2
            replicatorLayer.addSublayer(pulse)
            //hide the original layer
            pulse.opacity = 0.0
            layer.addSublayer(replicatorLayer)
            
            let groupAnimation = CAAnimationGroup()
            groupAnimation.animations = [alphaAnimation(), scaleAnimation()]
            groupAnimation.duration = 1.0
            groupAnimation.autoreverses = false
            groupAnimation.repeatCount = HUGE
            
            pulse.addAnimation(groupAnimation, forKey: "groupAnimation")
            
        }
        
        func alphaAnimation() -> CABasicAnimation{
            let alphaAnim = CABasicAnimation(keyPath: "opacity")
            alphaAnim.fromValue = 1.0
            alphaAnim.toValue = 0.0
            
            return alphaAnim
        }
        func scaleAnimation() -> CABasicAnimation{
            let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
            scaleAnim.fromValue = 0.0
            scaleAnim.toValue = 1.0
        
            return scaleAnim
        }
}
