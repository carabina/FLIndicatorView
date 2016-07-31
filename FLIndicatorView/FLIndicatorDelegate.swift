//
//  FLIndicatorDelegate.swift
//  FLindicator
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 fenglin. All rights reserved.
//

import UIKit

protocol FLIndicatorDelegate {
    func setupAnimationInLayer(layer:CALayer,size:CGFloat, color:UIColor)
}