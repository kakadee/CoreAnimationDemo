//
//  TransitionAnimator.m
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/15.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "TransitionAnimator.h"

@implementation TransitionAnimator

#pragma mark - UIViewControllerAnimatedTransitioning
// 返回动画的时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

// 在进行切换的时候将调用该方法，我们对于切换时的UIView的设置和动画都在这个方法中完成。
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalRect = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalRect, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
    
    // 所有的动画视图必须放在 transitionContext 的 containerView 里
    [[transitionContext containerView] addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toVC.view.frame = finalRect;
    } completion:^(BOOL finished) {
        // 该步骤是必须的，在动画结束后我们必须向context报告VC切换完成，是否成功。系统在接收到这个消息后，将对VC状态进行维护。
        [transitionContext completeTransition:YES];
    }];
}

@end
