//
//  CALayerTableViewController.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/13.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "CALayerTableViewController.h"
#import "CALayerDemoViewController.h"
#import "CALayerContentView.h"

@interface CALayerTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray<NSString *> *dataArray;

@property (nonatomic, strong) CALayerDemoViewController *demoVC;

@property (nonatomic, strong) CALayerContentView *layerContentView;

@end

@implementation CALayerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"CALayerContent"];
}

- (void)pushDemoVCWithView:(UIView *)view {
    [self.demoVC.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.demoVC.view addSubview:view];
    [self.navigationController pushViewController:self.demoVC animated:YES];
}

#pragma mark - Table view data source

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

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self pushDemoVCWithView:self.layerContentView];
    }
}

#pragma mark - getter
- (CALayerDemoViewController *)demoVC {
    if (!_demoVC) {
        _demoVC = [[CALayerDemoViewController alloc] init];
    }
    return _demoVC;
}

- (CALayerContentView *)layerContentView {
    if (!_layerContentView) {
        _layerContentView = [[CALayerContentView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    }
    return _layerContentView;
}

@end
