//
//  FLIndicatorView.swift
//  FLindicator
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit


public enum IndicatorAnimationType {
    case plusBall
    case circle
    case scale
    
    func animation() -> FLIndicatorDelegate  {
        switch self {
        case .plusBall:
            return FLIndicatorPlusBall()
        case .circle:
            return FLIndicatorCircle()
        case .scale:
            return FLIndicatorScale()
        }
    }
}

public class FLIndicatorView: UIView {
    
    public static var DEFAULT_TYPE:IndicatorAnimationType  = .plusBall
    public static var DEFAULT_COLOR = UIColor.whiteColor()
    public static var DEFAULT_BLOCKER_SIZE = CGSizeMake(60, 60)
    
    public var type:IndicatorAnimationType = IndicatorAnimationType.plusBall
    public var color:UIColor = UIColor.whiteColor()
    
    init(frame:CGRect, type:IndicatorAnimationType?,color:UIColor?) {
        self.type = type ?? FLIndicatorView.DEFAULT_TYPE
        self.color = color ?? FLIndicatorView.DEFAULT_COLOR
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAnimaiton() {
        let size:CGFloat
        if frame.size.width >= frame.size.height  {
            size  = frame.size.height
        } else {
            size = frame.size.width
        }
        
        layer.sublayers = nil;
        let animaton :FLIndicatorDelegate = type.animation()
        animaton.setupAnimationInLayer(layer, size: size, color: color)
        layer.speed = 0.0

    }
    
    
    func startAnimating() {
        
        if hidden {
            hidden = false
        }
        
        if layer.sublayers == nil {
            setupAnimaiton()
        }
        layer.speed = 1.0
    }
    
    func stopAnimating() {
        layer.sublayers = nil
        layer.speed = 0.0
        
        if !hidden {
            hidden =  true
        }
    }
}
