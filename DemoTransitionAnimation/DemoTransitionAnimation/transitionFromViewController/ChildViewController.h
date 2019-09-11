//
//  ChildViewController.h
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/14.
//  Copyright © 2019 lijian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChildViewController : UIViewController

@property(nonatomic, copy) NSString *text;

@property(nonatomic, assign) BOOL shouldShowDismissButton;

@property(nonatomic, copy) void (^dismissHandler)(void);

@end

NS_ASSUME_NONNULL_END
