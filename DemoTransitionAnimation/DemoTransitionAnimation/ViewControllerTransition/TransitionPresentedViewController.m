//
//  TransitionPresentedViewController.m
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/15.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "TransitionPresentedViewController.h"
#import "Masonry.h"

@interface TransitionPresentedViewController ()

@property(nonatomic, strong) UILabel *textLabel;

@property(nonatomic, strong) UIButton *dismissButton;

@end

@implementation TransitionPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];

    self.textLabel = [[UILabel alloc] init];
    self.textLabel.text = self.text ?: @"Child";
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont systemFontOfSize:26];
    [self.view addSubview:self.textLabel];
    [self.textLabel sizeToFit];
    self.textLabel.center = self.view.center;
    
    self.dismissButton = [[UIButton alloc] init];
    [self.dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [self.view addSubview:self.dismissButton];
    [self.dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self.dismissButton addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.dismissButton];
    
    [self.dismissButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_equalTo(-100);
    }];
    
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text ?: @"Child";
    [self.textLabel sizeToFit];
    self.textLabel.center = self.view.center;
}

- (void)dismissAction {
    if (self.dismissHandler) {
        self.dismissHandler();
    }
}

- (void)setShouldShowDismissButton:(BOOL)shouldShowDismissButton {
    self.dismissButton.hidden = !shouldShowDismissButton;
}

@end
