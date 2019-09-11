//
//  ChildViewController.m
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/14.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "ChildViewController.h"
#import "Masonry.h"

@interface ChildViewController ()

@property(nonatomic, strong) UILabel *textLabel;

@property(nonatomic, strong) UIButton *dismissButton;

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
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
    [self.dismissButton addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.dismissButton];
    
    [self.dismissButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_equalTo(-100);
    }];
}

- (void)setText:(NSString *)text {
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
