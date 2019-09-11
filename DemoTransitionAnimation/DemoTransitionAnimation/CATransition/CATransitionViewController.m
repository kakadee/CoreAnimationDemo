//
//  CATransitionViewController.m
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/14.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "CATransitionViewController.h"
#import "ChildViewController.h"
#import "Masonry.h"

@interface CATransitionViewController ()

@property(nonatomic, strong) UIButton *transButton;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.transButton = [[UIButton alloc] init];
    [self.transButton setTitle:@"CATransition" forState:UIControlStateNormal];
    [self.transButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.transButton];
    [self.transButton addTarget:self action:@selector(transAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.transButton];
    
    [self.transButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.height.mas_equalTo(200);
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_equalTo(-100);
    }];
}

- (void)transAction {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromTop;
    [self.view.window.layer addAnimation:animation forKey:@"kTransitionAnimation"];
    
    ChildViewController *presentedVC = [[ChildViewController alloc] init];
    presentedVC.view.backgroundColor = UIColor.greenColor;
    __weak __typeof(self)weakSelf = self;
    presentedVC.dismissHandler = ^{
        [weakSelf dismissViewControllerAnimated:NO completion:nil];
    };
    [self presentViewController:presentedVC animated:NO completion:nil];
}

@end
