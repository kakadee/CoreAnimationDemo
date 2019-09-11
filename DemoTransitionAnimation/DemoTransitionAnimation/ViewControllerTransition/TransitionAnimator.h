//
//  TransitionAnimator.h
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/15.
//  Copyright © 2019 lijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 这个协议负责切换的具体内容，也即“切换中应该发生什么”。开发者在做自定义切换效果时大部分代码会是用来实现这个接口。
@interface TransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@end

NS_ASSUME_NONNULL_END
