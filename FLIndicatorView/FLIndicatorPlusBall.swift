//
//  FLIndicatorPlusBall.swift
//  FLindicator
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit
import Foundation


class FLIndicatorPlusBall:FLIndicatorDelegate {
    
    
    func setupAnimationInLayer(layer: CALayer, size: CGFloat, color: UIColor) {
        
        let marginBetweenDot:CGFloat = 5.0
        let dotSize = (size - 2*marginBetweenDot) / 3

        let dot = CAShapeLayer()
        dot.frame = CGRect(
            x: 0,
            y: (size - dotSize)/2,
            width:dotSize,
            height: dotSize)
        dot.path = UIBezierPath(ovalInRect: CGRectMake(0 , 0, dotSize, dotSize)).CGPath
        dot.fillColor = color.CGColor
        
        // create replicatorLayer
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRectMake(0, 0, size, size)
        replicatorLayer.instanceDelay = 1.0 / 3
        replicatorLayer.instanceCount = 3
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(marginBetweenDot+dotSize, 0, 0)
        
        replicatorLayer .addSublayer(dot)
        layer.addSublayer(replicatorLayer)
        dot.addAnimation(scaleAnimation(), forKey: "scaleAnimation")
    }
    
    
    func scaleAnimation() -> CABasicAnimation {
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale")
        scaleAnim.toValue = 0.2
        scaleAnim.autoreverses = true
        scaleAnim.repeatCount = HUGE
        scaleAnim.duration = 1.0
        
        return scaleAnim
    }
    
}
