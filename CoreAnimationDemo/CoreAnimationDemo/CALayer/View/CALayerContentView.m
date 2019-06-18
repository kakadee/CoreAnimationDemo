//
//  CALayerContentView.m
//  CoreAnimationDemo
//
//  Created by lijian on 2019/6/13.
//  Copyright © 2019 com.yaymedialabs. All rights reserved.
//

#import "CALayerContentView.h"

@interface CALayerContentView ()

@property (nonatomic, strong) UIView *layerContentsDemoView;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CALayerContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.layerContentsDemoView];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(0.0f, 0.0f, 100.0f, 100.0f);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.delegate = self;
    
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    //    [self.layer addSublayer:blueLayer];
    
    //force layer to redraw， don't recommand
    //    [blueLayer display];
    //    [blueLayer setNeedsDisplay];
    [blueLayer displayIfNeeded];
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

#pragma mark - getter
- (UIView *)layerContentsDemoView {
    if (!_layerContentsDemoView) {
        _layerContentsDemoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200,200)];
        _layerContentsDemoView.center = self.center;
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
@end
