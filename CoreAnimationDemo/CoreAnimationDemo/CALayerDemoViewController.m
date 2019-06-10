//
//  CALayerDemoViewController.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/5.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "CALayerDemoViewController.h"

@interface CALayerDemoViewController () <CALayerDelegate>

@property (nonatomic, strong) UIView *layerContentsDemoView;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CALayerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerContentsDemoView];

    //create sublayer
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0f, 100.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    //set controller as layer delegate
    blueLayer.delegate = self;
    
    //ensure that layer backing image uses correct scale
    blueLayer.contentsScale = [UIScreen mainScreen].scale; //add layer to our view
//    [self.view.layer addSublayer:blueLayer];
    
    //force layer to redraw， don't recommand
//    [blueLayer display];
//    [blueLayer setNeedsDisplay];
    [blueLayer displayIfNeeded];
}

- (UIView *)layerContentsDemoView {
    if (!_layerContentsDemoView) {
        _layerContentsDemoView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200,200)];
        _layerContentsDemoView.center = self.view.center;
        _layerContentsDemoView.backgroundColor = [UIColor redColor];
        CALayer *layer = [[CALayer alloc] init];
        layer.frame = CGRectMake(10, 10, 200, 200);
        layer.backgroundColor = [UIColor yellowColor].CGColor;
        UIImage *image = [UIImage imageNamed:@"coin"];
        layer.contents = (__bridge id)image.CGImage;
        layer.contentsGravity = kCAGravityTopLeft;
        layer.contentsScale = 2;
        layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
        [_layerContentsDemoView.layer addSublayer:layer];
    }
    return _layerContentsDemoView;
}

#pragma mark - CALayerDelegate

//- (void)displayLayer:(CALayer *)layer {
//    NSLog(@"test---%@,%@",@(__func__),@(__LINE__));
//}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    //draw a thick red circle
    NSLog(@"test---%@,%@",@(__func__),@(__LINE__));
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}
@end
