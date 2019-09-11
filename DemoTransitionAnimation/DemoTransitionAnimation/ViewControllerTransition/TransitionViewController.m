//
//  TransitionViewController.m
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/15.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "TransitionViewController.h"
#import "TransitionPresentedViewController.h"
#import "TransitionAnimator.h"
#import "Masonry.h"

@interface TransitionViewController () <UIViewControllerTransitioningDelegate>

@property(nonatomic, strong) UILabel *textLabel;
@property(nonatomic, strong) UIButton *transButton;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.text = @"PresentingVC";
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.font = [UIFont systemFontOfSize:26];
    [self.view addSubview:self.textLabel];
    [self.textLabel sizeToFit];
    self.textLabel.center = self.view.center;
    
    self.transButton = [[UIButton alloc] init];
    [self.transButton setTitle:@"next" forState:UIControlStateNormal];
    [self.transButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.transButton];
    [self.transButton addTarget:self action:@selector(transAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.transButton];
    
    [self.transButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_equalTo(-100);
    }];
}

- (void)transAction {
    TransitionPresentedViewController *presentedVC = [[TransitionPresentedViewController alloc] init];
    presentedVC.text = @"Presented VC";
    __weak __typeof(self)weakSelf = self;
    presentedVC.dismissHandler = ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    // 设置transitioningDelegate, 然后在其中实现协议方法即可.
    presentedVC.transitioningDelegate = self;
    [self presentViewController:presentedVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
// 当present 一个VC 的时候，UIKit会向代理请求一个遵守<UIViewControllerAnimatedTransitioning>协议的对象，其实就是一个 transition animator object，
// presented: 将要展现在屏幕上的VC （A -> B), 那么 presented 就是B
// presenting: 同理，（A -> B), 那么 presenting 就是A（这里其实是A.navigationController）
// source: 谁执行的 presentViewController:animated:completion:，那么source就是谁。

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    NSLog(@"test---presented:%@\n",presented.description);
    NSLog(@"test---presenting:%@\n",presenting.description);
    NSLog(@"test---source:%@\n",source.description);
    
    TransitionAnimator *animator = [[TransitionAnimator alloc] init];
    
    return animator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    TransitionAnimator *animator = [[TransitionAnimator alloc] init];
    return animator;
}

@end
