//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/4.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *demoView;

@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.demoView];
    [self.view addSubview:self.imageView];
}

- (UIView *)demoView {
    if (!_demoView) {
        _demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _demoView.center = self.view.center;
        _demoView.backgroundColor = [UIColor redColor];
        CALayer *layer = [[CALayer alloc] init];
        layer.frame = CGRectMake(0, 0, 100, 100);
        layer.backgroundColor = [UIColor yellowColor].CGColor;
        UIImage *image = [UIImage imageNamed:@"cat"];
        layer.contents = (__bridge id)image.CGImage;
        layer.contentsGravity = kCAGravityTopLeft;
        layer.contentsScale = image.scale;
        NSLog(@"test---imageScale:%@",@(image.scale));
        
//        _demoView.clipsToBounds = YES;
        [_demoView.layer addSublayer:layer];
    }
    return _demoView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat"]];
//        _imageView.frame = CGRectMake(0, 0, 50, 50);
        
    }
    return _imageView;
}
@end
