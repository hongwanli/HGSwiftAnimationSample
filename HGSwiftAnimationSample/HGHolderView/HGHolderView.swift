//
//  HGHolderView.swift
//  HGSwiftAnimationSample
//
//  Created by XiaoDou on 15/9/7.
//  Copyright (c) 2015年 北京嗨购电子商务有限公司. All rights reserved.
//

import UIKit

protocol HGHolderViewDelegate: class {
    func addTitleLabel()
}

class HGHolderView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    let ovalLayer = HGOvalLayer()
    let triangleLayer = HGTriangleLayer()
    let rectangleLayer = HGRectangleLayer()
    
    var parentFrame: CGRect = CGRectZero
    weak var delegate: HGHolderViewDelegate?
    
    func addOvalLayer() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expandAnimationFunction()
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "wobbleOvalLayer", userInfo: nil, repeats: false)
    }
    
    func wobbleOvalLayer() {
        ovalLayer.wobbleAnimationFunction()
        ovalLayer.addSublayer(triangleLayer)
        
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: "drawAnimatedTriangle", userInfo: nil, repeats: false)
    }
    

    func drawAnimatedTriangle() {
        triangleLayer.triangleAnimation()
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: "spinAndTransform",
            userInfo: nil, repeats: false)
    }
    
    func spinAndTransform() {
        // 1
        layer.anchorPoint = CGPointMake(0.5, 0.6)
        
        // 2
        var rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2.0)
        rotationAnimation.duration = 0.45
        rotationAnimation.removedOnCompletion = true
        layer.addAnimation(rotationAnimation, forKey: nil)
    
        ovalLayer.contractAnimation()
        
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: "drawRectangleLayer", userInfo: nil, repeats: false)
    }
    
    func drawRectangleLayer() {
        layer.addSublayer(rectangleLayer)
        rectangleLayer.animateStrokeWithColor(HGColors.blue)
        NSTimer.scheduledTimerWithTimeInterval(0.90, target: self, selector: "expandView",
            userInfo: nil, repeats: false)
    }
    
    func expandView() {
        backgroundColor = HGColors.blue
        frame = CGRectMake(frame.origin.x - rectangleLayer.lineWidth,
            frame.origin.y - rectangleLayer.lineWidth,
            frame.size.width + rectangleLayer.lineWidth * 2,
            frame.size.height + rectangleLayer.lineWidth * 2)
        layer.sublayers = nil
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.frame = self.parentFrame
            }, completion: { finished in
            self.addTitleLabel()
        })
    }

    func addTitleLabel() {
        self.delegate?.addTitleLabel()
    }
}
