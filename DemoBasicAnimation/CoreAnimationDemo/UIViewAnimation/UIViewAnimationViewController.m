//
//  UIViewAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/18.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "UIViewAnimationViewController.h"
#import "DemoViewController.h"
#import "UIViewAnimationTypeObject.h"
#import "UIViewDemoViewController.h"

@interface UIViewAnimationViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray<NSString *> *dataArray;

@property (nonatomic, strong) UIViewDemoViewController *demoVC;

@property (nonatomic, strong) UIViewAnimationTypeObject *typeObject;
@end

@implementation UIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.typeObject = [[UIViewAnimationTypeObject alloc] init];
    self.dataArray = [self.typeObject getAllName];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)pushDemoVCWithType:(UIViewAnimationType)type {
    self.demoVC = [[UIViewDemoViewController alloc] initWithAnimationType:type];
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
    [self pushDemoVCWithType:indexPath.row];
}

#pragma mark - getter & setter

@end
