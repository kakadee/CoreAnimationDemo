//
//  UIViewAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/18.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "UIViewAnimationViewController.h"
#import "DemoViewController.h"

@interface UIViewAnimationViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray<NSString *> *dataArray;

@property (nonatomic, strong) UIViewController *demoVC;

@end

@implementation UIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"Block基础动画",@"Block弹簧动画",@"Block过度动画",@"Block关键帧动画",@"Block系统动画",@"动画块"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)pushDemoVCWithView:(UIView *)view {
    [self.demoVC.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.demoVC.view addSubview:view];
    [self.navigationController pushViewController:self.demoVC animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
    }
}

#pragma mark - getter & setter
- (UIViewController *)demoVC {
    if (!_demoVC) {
        _demoVC = [[UIViewController alloc] init];
    }
    return _demoVC;
}
@end
