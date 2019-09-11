//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/4.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, copy) NSArray<NSString *> *dataArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[@"CALayer",@"UIViewAnimation",@"3"];
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.navigationController.delegate = self;
    
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
        CALayerTableViewController *layerTableVC = [[CALayerTableViewController alloc] init];
        [self.navigationController pushViewController:layerTableVC animated:YES];
    } else if (indexPath.row == 1) {
        UIViewAnimationViewController *viewAnimationVC = [[UIViewAnimationViewController alloc] init];
        [self.navigationController pushViewController:viewAnimationVC animated:YES];
    }
}

#pragma mark - UINavigationControllerDelegate

@end
