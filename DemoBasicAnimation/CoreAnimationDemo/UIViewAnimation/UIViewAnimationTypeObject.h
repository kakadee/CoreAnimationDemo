//
//  UIViewAnimationTypeObject.h
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/18.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, UIViewAnimationType) {
    UIViewAnimationTypeBasic, // 基础动画
    UIViewAnimationTypeSpring, // 弹簧动画
    UIViewAnimationTypeTransition, // 过渡动画
    UIViewAnimationTypeKeyFrame, // 关键帧动画
    UIViewAnimationTypeSystem, // 系统动画
    UIViewAnimationTypeWithOutBlock, // 动画块动画（非block动画）
};


@interface UIViewAnimationTypeObject : NSObject

@property (nonatomic, assign) UIViewAnimationType type;

@property (nonatomic, copy, readonly) NSString *name;

- (instancetype)initWithType:(UIViewAnimationType)type;

- (NSArray<NSString *> *)getAllName;

@end

NS_ASSUME_NONNULL_END
