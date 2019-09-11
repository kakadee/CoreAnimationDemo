//
//  ParentViewController.m
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/14.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "ParentViewController.h"
#import "ChildViewController.h"
#import "Masonry.h"

@interface ParentViewController ()

@property(nonatomic, strong) UILabel *textLabel;
@property(nonatomic, strong) UIButton *transButton;
@property(nonatomic, strong) ChildViewController *childA;
@property(nonatomic, strong) ChildViewController *childB;
@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.text = @"Parent";
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.font = [UIFont systemFontOfSize:26];
    [self.view addSubview:self.textLabel];
    [self.textLabel sizeToFit];
    self.textLabel.center = self.view.center;
    
    ChildViewController *a = [[ChildViewController alloc] init];
    a.view.backgroundColor = [UIColor blueColor];
    a.text = @"Child - A";
    a.shouldShowDismissButton = NO;
    [self addChildViewController:a];
    [self.view addSubview:a.view];
    _childA = a;
    
    ChildViewController *b = [[ChildViewController alloc] init];
    b.view.backgroundColor = [UIColor redColor];
    b.text = @"Child - B";
    [self addChildViewController:b];
    _childB = b;
    __weak __typeof(self)weakSelf = self;
    b.dismissHandler = ^{
        [weakSelf transitionFromViewController:weakSelf.childB toViewController:weakSelf.childA duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [weakSelf.view bringSubviewToFront:weakSelf.transButton];
        } completion:^(BOOL finished) {

        }];
    };
    
    self.transButton = [[UIButton alloc] init];
    [self.transButton setTitle:@"from A to B" forState:UIControlStateNormal];
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
    [self transitionFromViewController:self.childA toViewController:self.childB duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}
@end
