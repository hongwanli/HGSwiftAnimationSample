//
//  HGTriangleLayer.swift
//  HGSwiftAnimationSample
//
//  Created by XiaoDou on 15/9/8.
//  Copyright (c) 2015年 北京嗨购电子商务有限公司. All rights reserved.
//

import UIKit

class HGTriangleLayer: CAShapeLayer {
    
    let innerPadding: CGFloat = 30
    
    override init!() {
        super.init()
        fillColor = HGColors.red.CGColor
        strokeColor = HGColors.red.CGColor
        lineWidth = 7.0
        lineCap = kCALineCapRound
        lineJoin = kCALineJoinRound
        path = trianglePathSmall.CGPath
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var trianglePathSmall: UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPointMake(5.0 + innerPadding, 95.0))
        trianglePath.addLineToPoint(CGPointMake(50.0, 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPointMake(95.0 - innerPadding, 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var trianglePathLeftExtension: UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPointMake(5.0, 95.0))
        trianglePath.addLineToPoint(CGPointMake(50.0, 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPointMake(95.0 - innerPadding, 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var trianglePathRightExtension: UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPointMake(5.0, 95.0))
        trianglePath.addLineToPoint(CGPointMake(50.0, 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPointMake(95.0, 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var trianglePathTopExtension: UIBezierPath {
        var trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPointMake(5.0, 95.0))
        trianglePath.addLineToPoint(CGPointMake(50.0, 12.5))
        trianglePath.addLineToPoint(CGPointMake(95.0, 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    func triangleAnimation() {
        var triangleAnimationLeft: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationLeft.fromValue = trianglePathSmall.CGPath
        triangleAnimationLeft.toValue = trianglePathLeftExtension.CGPath
        triangleAnimationLeft.beginTime = 0.0
        triangleAnimationLeft.duration = 0.3
        
        var triangleAnimationRight: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationRight.fromValue = trianglePathLeftExtension.CGPath
        triangleAnimationRight.toValue = trianglePathRightExtension.CGPath
        triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration
        triangleAnimationRight.duration = 0.25
        
        var triangleAnimationTop: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationTop.fromValue = trianglePathRightExtension.CGPath
        triangleAnimationTop.toValue = trianglePathTopExtension.CGPath
        triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration
        triangleAnimationTop.duration = 0.20
        
        var triangleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        triangleAnimationGroup.animations = [triangleAnimationLeft, triangleAnimationRight, triangleAnimationTop]
        triangleAnimationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration
        triangleAnimationGroup.fillMode = kCAFillModeForwards
        triangleAnimationGroup.removedOnCompletion = false
        addAnimation(triangleAnimationGroup, forKey: nil)
    }
    
}
