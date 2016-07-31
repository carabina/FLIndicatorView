//
//  FLIndicatorViewable.swift
//  FLindicator
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

public protocol  FLIndicatorViewable {}

public extension FLIndicatorViewable where Self :UIViewController {
    
    
    private var activityRestorationIdentifier: String {
        return "FLIndicatorViewContainer"
    }
    
    public func startIndicatorAnimating(size: CGSize? , type: IndicatorAnimationType? = nil, color: UIColor? = nil) {
        let activityContainer: UIView = UIView(frame: view.bounds)
        activityContainer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityContainer.restorationIdentifier = activityRestorationIdentifier
        let actualSize = size ?? FLIndicatorView.DEFAULT_BLOCKER_SIZE
        
        let indicatorView = FLIndicatorView(frame: CGRectMake(0, 0, actualSize.width, actualSize.height), type: type, color: color)
        indicatorView.center = activityContainer.center

        activityContainer.addSubview(indicatorView)
        view.addSubview(activityContainer)
        indicatorView.startAnimating()
    }
    
    
    public func stopIndicatorAnimating() {
        for item in view.subviews
            where item.restorationIdentifier == activityRestorationIdentifier {
                item.removeFromSuperview()
        }
    }}

