//
//  HGRectangleLayer.swift
//  HGSwiftAnimationSample
//
//  Created by XiaoDou on 15/9/8.
//  Copyright (c) 2015年 北京嗨购电子商务有限公司. All rights reserved.
//

import UIKit

class HGRectangleLayer: CAShapeLayer {
    
    override init!() {
        super.init()
        fillColor = HGColors.clear.CGColor
        lineWidth = 5.0
        path = rectanglePathFull.CGPath
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var rectanglePathFull: UIBezierPath {
        var rectanglePath = UIBezierPath()
        rectanglePath.moveToPoint(CGPointMake(0.0, 100.0))
        rectanglePath.addLineToPoint(CGPointMake(0.0, -lineWidth))
        rectanglePath.addLineToPoint(CGPointMake(100.0, -lineWidth))
        rectanglePath.addLineToPoint(CGPointMake(100.0, 100.0))
        rectanglePath.addLineToPoint(CGPointMake(-lineWidth / 2, 100.0))
        rectanglePath.closePath()
        return rectanglePath
    }
    
    func animateStrokeWithColor(color: UIColor) {
        strokeColor = color.CGColor
        var strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 0.4
        addAnimation(strokeAnimation, forKey: nil)
    }
    
}
