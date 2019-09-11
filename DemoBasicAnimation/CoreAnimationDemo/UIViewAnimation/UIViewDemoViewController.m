//
//  UIViewDemoViewController.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/18.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "UIViewDemoViewController.h"
#import "Masonry.h"

@interface UIViewDemoViewController ()

@property (nonatomic, strong) UIViewAnimationTypeObject *typeObject;

@property (nonatomic, strong) UIView *basicView;

@property (nonatomic, strong) UIButton *startAnimationButton;

@property(nonatomic, strong) UIView *transitionView1;

@property(nonatomic, strong) UIView *transitionView2;

@end

@implementation UIViewDemoViewController

- (instancetype)initWithAnimationType:(UIViewAnimationType)type {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.typeObject = [[UIViewAnimationTypeObject alloc] initWithType:type];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self initWithAnimationType:UIViewAnimationTypeBasic];
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark - UI
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.basicView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.basicView.center = self.view.center;
    self.basicView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.basicView];
    
    self.startAnimationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.startAnimationButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [self.startAnimationButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.startAnimationButton];
    
    [self.startAnimationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-30);
        make.centerX.equalTo(self.view);
    }];
    
    [self.startAnimationButton addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Action
- (void)startAnimation {
    switch (self.typeObject.type) {
        case UIViewAnimationTypeBasic:
            [self startBasicAnimation];
            break;
        case UIViewAnimationTypeSpring:
            [self startSpringAnimation];
            break;
        case UIViewAnimationTypeWithOutBlock:
            [self startDemoAnimation];
        default:
            break;
    }
}

- (void)startBasicAnimation {
    [UIView animateWithDuration:0.3 animations:^{
        self.basicView.backgroundColor = [UIColor yellowColor];
        self.basicView.center = CGPointMake(self.basicView.center.x + 30, self.basicView.center.y + 30);
        self.basicView.transform = CGAffineTransformMakeScale(2, 1);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)startSpringAnimation {
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.basicView.center = CGPointMake(self.basicView.center.x, self.basicView.center.y + 50);
    } completion:^(BOOL finished) {
        self.basicView.center = self.view.center;
    }];
}

// 在viewblock 里执行CABasicAnimation动画
// 在animation Block 里改变的属性会一直改变，CABasicAnimation改变的属性会复原
- (void)startDemoAnimation {
    CGPoint myNewPosition = CGPointMake(100, 200);
    [UIView animateWithDuration:1.0 animations:^{
        // Change the opacity implicitly.
        self.basicView.layer.opacity = 0.5;
        //        self.basicView.backgroundColor = [UIColor greenColor];
        
        
        // Change the position explicitly.
        CABasicAnimation* theAnim = [CABasicAnimation animationWithKeyPath:@"position"];
        theAnim.fromValue = [NSValue valueWithCGPoint:self.basicView.layer.position];
        theAnim.toValue = [NSValue valueWithCGPoint:myNewPosition];
        theAnim.duration = 5.0;
        theAnim.speed = 5.0;
        theAnim.repeatCount = 2;
        [self.basicView.layer addAnimation:theAnim forKey:@"AnimateFrame"];
    }];
    
}
@end
