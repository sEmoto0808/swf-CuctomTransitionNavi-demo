//
//  ZoomNavigationController.swift
//  swf-CustomTransition-demo
//
//  Created by S.Emoto on 2018/05/25.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class ZoomNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    
    // デフォルトのpush・popアニメーションをZoomTransitionAnimatorで実装したアニメーションに置き換える
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        
        let zoomTransitionAnimator = ZoomTransitionAnimator()
        
        // pushとpopでは異なるアニメーションをさせるので条件を分ける
        switch operation {
        case .push:
            zoomTransitionAnimator.isForward = true
            return zoomTransitionAnimator
        case .pop:
            zoomTransitionAnimator.isForward = false
            return zoomTransitionAnimator
        default:
            break
        }
        return nil
    }
}
