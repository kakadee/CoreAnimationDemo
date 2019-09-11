//
//  UIViewAnimationTypeObject.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/18.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "UIViewAnimationTypeObject.h"

@implementation UIViewAnimationTypeObject

- (instancetype)initWithType:(UIViewAnimationType)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (instancetype)init {
    return [self initWithType:UIViewAnimationTypeBasic];
}

- (void)setType:(UIViewAnimationType)type {
    _type = type;
    _name = [self getAllName][type];
}

- (NSArray<NSString *> *)getAllName {
    return @[@"Block基础动画",@"Block弹簧动画",@"Block过度动画",@"Block关键帧动画",@"Block系统动画",@"动画块"];
}

@end
