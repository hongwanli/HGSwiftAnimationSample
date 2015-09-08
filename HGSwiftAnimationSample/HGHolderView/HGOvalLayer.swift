//
//  HGOvalLayer.swift
//  HGSwiftAnimationSample
//
//  Created by XiaoDou on 15/9/7.
//  Copyright (c) 2015年 北京嗨购电子商务有限公司. All rights reserved.
//

import UIKit

class HGOvalLayer: CAShapeLayer {
    let animationDuration: NSTimeInterval = 0.3
    
    override init!() {
        super.init()
        fillColor = HGColors.red.CGColor
        path = ovalPathSmall.CGPath
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //椭圆最小路径
    var ovalPathSmall: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 50, y: 50, width: 0, height: 0))
    }
    //椭圆最大路径
    var ovalPathLarge: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
    //椭圆垂直方向挤压路径
    var ovalSquishVerticalPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
    }
    //椭圆水平方向挤压路径
    var ovalSquishHorizontalPath: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
    }
    //椭圆放大动画
    func expandAnimationFunction() {
        var expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalPathSmall.CGPath
        expandAnimation.toValue = ovalPathLarge.CGPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        addAnimation(expandAnimation, forKey: nil)
    }
    
    //椭圆晃动动画
    func wobbleAnimationFunction() {
        var wobbleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation1.fromValue = ovalPathLarge.CGPath
        wobbleAnimation1.toValue = ovalSquishVerticalPath.CGPath
        wobbleAnimation1.beginTime = 0.0
        wobbleAnimation1.duration = animationDuration
        
        var wobbleAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation2.fromValue = ovalSquishVerticalPath.CGPath
        wobbleAnimation2.toValue = ovalSquishHorizontalPath.CGPath
        wobbleAnimation2.beginTime = wobbleAnimation1.beginTime + wobbleAnimation1.duration
        wobbleAnimation2.duration = animationDuration
        
        var wobbleAnimation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation3.fromValue = ovalSquishHorizontalPath.CGPath
        wobbleAnimation3.toValue = ovalSquishVerticalPath.CGPath
        wobbleAnimation3.beginTime = wobbleAnimation2.beginTime + wobbleAnimation2.duration
        wobbleAnimation3.duration = animationDuration
        
        var wobbleAnimation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        wobbleAnimation4.fromValue = ovalSquishVerticalPath.CGPath
        wobbleAnimation4.toValue = ovalPathLarge.CGPath
        wobbleAnimation4.beginTime = wobbleAnimation3.beginTime + wobbleAnimation3.duration
        wobbleAnimation4.duration = animationDuration
        
        var wobbleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        wobbleAnimationGroup.animations = [wobbleAnimation1, wobbleAnimation2, wobbleAnimation3, wobbleAnimation4]
        wobbleAnimationGroup.duration = wobbleAnimation4.beginTime + wobbleAnimation4.duration
        wobbleAnimationGroup.repeatCount = 2
        addAnimation(wobbleAnimationGroup, forKey: nil)
    }
    //缩小动画
    func contractAnimation() {
        var expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalPathLarge.CGPath
        expandAnimation.toValue = ovalPathSmall.CGPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        addAnimation(expandAnimation, forKey: nil)
    }
    
}
