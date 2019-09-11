//
//  ViewController.m
//  DemoTransitionAnimation
//
//  Created by lijian on 2019/8/14.
//  Copyright © 2019 lijian. All rights reserved.
//

#import "ViewController.h"
#import "ParentViewController.h"
#import "CATransitionViewController.h"
#import "TransitionViewController.h"

static NSString * const kTableCellID = @"kTableCellID";
@interface ViewController ()

@property(nonatomic, copy) NSArray *demoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"TransitionAnimation";
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableCellID];
    
    self.demoArray = @[@"transitionFromViewController",
                       @"CATransition",
                       @"ViewControllerTransition",
                       ];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableCellID forIndexPath:indexPath];
    cell.textLabel.text = self.demoArray[indexPath.row];
    return cell;
}

#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            ParentViewController *vc = [[ParentViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            CATransitionViewController *vc = [[CATransitionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            TransitionViewController *vc = [[TransitionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
            break;
        }
        default:
            break;
    }
    
}
@end
