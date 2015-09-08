//
//  ViewController.swift
//  HGSwiftAnimationSample
//
//  Created by XiaoDou on 15/9/7.
//  Copyright (c) 2015年 北京嗨购电子商务有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HGHolderViewDelegate {
    var holderView = HGHolderView(frame: CGRectZero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addHolderView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.size.width / 2 - boxSize / 2, y: view.bounds.height / 2 - boxSize / 2, width: boxSize, height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
        holderView.addOvalLayer()
    }
    //代理方法
    func addTitleLabel() {
        holderView.removeFromSuperview()
        view.backgroundColor = HGColors.blue
        
        var titleLabel: UILabel = UILabel(frame: view.frame)
        titleLabel.textColor = HGColors.white
        titleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 150.0)
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.text = "哈"
        titleLabel.transform = CGAffineTransformMakeScale(0.25, 0.25)
        view.addSubview(titleLabel)
        
        //放大动画
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: ({
            titleLabel.transform = CGAffineTransformScale(titleLabel.transform, 4.0, 4.0)
        }), completion: { finished in
            self.addActionButton()
        })
    }
        
    func addActionButton() {
        var actionButton: UIButton = UIButton(frame: view.frame)
        actionButton.addTarget(self, action: "actionButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(actionButton)
    }
    
    func actionButtonPressed() {
        view.backgroundColor = HGColors.white
        view.subviews.map( {$0.removeFromSuperview() })
        holderView = HGHolderView(frame: CGRectZero)
        addHolderView()
    }
    
}

