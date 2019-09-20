//
//  GYCircleView.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/18.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "GYCircleView.h"

@interface GYCircleView ()

{
    CAShapeLayer *_trackLayer;
    CALayer *_gradientLayer;
    // CAGradientLayer：颜色渐变
    CAGradientLayer *_gradientLayer1;
    CAGradientLayer *_gradientLayer2;
    CAGradientLayer *_gradientLayer3;
    CAGradientLayer *_gradientLayer4;
    CAShapeLayer *_progressLayer;
    CABasicAnimation *_animation;
    CGFloat _lineWidth;
    UIColor *cor1;
    UIColor *cor2;
    UIColor *cor3;
    UIColor *cor4;
}

@end

@implementation GYCircleView

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setDefault];
        _lineWidth = lineWidth;
        
        [self drawRing];
    }
    return self;
}

- (void)setDefault{
    _lineWidth = 30;
    cor1 = [UIColor redColor];
    cor2 = [UIColor yellowColor];
    cor3 = [UIColor greenColor];
    cor4 = [UIColor blueColor];
}

- (void)drawRing{
    
    CGFloat w = self.frame.size.width/2.0;
    CGFloat h = self.frame.size.height/2.0;
    
    CGFloat scale = _lineWidth/w;
    
    _trackLayer = [CAShapeLayer layer];
    _trackLayer.frame = self.bounds;
    _trackLayer.fillColor = [UIColor clearColor].CGColor;
    _trackLayer.strokeColor = [UIColor redColor].CGColor;
    _trackLayer.lineWidth = _lineWidth;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0) radius:w-_lineWidth/2.0 startAngle:-M_PI_2 endAngle:-M_PI_2+M_PI*2 clockwise:YES];
    _trackLayer.path = path.CGPath;
    [self.layer addSublayer:_trackLayer];
    
    _gradientLayer = [CALayer layer];
    _gradientLayer.frame = self.bounds;
    
    // CAGradientLayer：可以实现颜色渐变
    _gradientLayer1 = [CAGradientLayer layer];
    _gradientLayer1.frame = CGRectMake(0.0, 0.0, w, h);
    _gradientLayer1.colors = @[(__bridge id)cor1.CGColor,(__bridge id)cor2.CGColor];
    // 颜色起始点
    _gradientLayer1.startPoint = CGPointMake(scale, 1);
    // 颜色终结点
    _gradientLayer1.endPoint = CGPointMake(1, scale);
    [_gradientLayer addSublayer:_gradientLayer1];
    
    _gradientLayer2 = [CAGradientLayer layer];
    _gradientLayer2.frame = CGRectMake(w, 0, w, h);
    _gradientLayer2.colors = @[(__bridge id)cor2.CGColor,(__bridge id)cor3.CGColor];
    _gradientLayer2.startPoint = CGPointMake(0, scale);
    _gradientLayer2.endPoint = CGPointMake(1-scale, 1);
    [_gradientLayer addSublayer:_gradientLayer2];
    
    _gradientLayer3 = [CAGradientLayer layer];
    _gradientLayer3.frame = CGRectMake(w, h, w, h);
    _gradientLayer3.colors = @[(__bridge id)cor3.CGColor,(__bridge id)cor4.CGColor];
    _gradientLayer3.startPoint = CGPointMake(1-scale, 0);
    _gradientLayer3.endPoint = CGPointMake(0, 1-scale);
    [_gradientLayer addSublayer:_gradientLayer3];
    
    _gradientLayer4 = [CAGradientLayer layer];
    _gradientLayer4.frame = CGRectMake(0, h, w, h);
    _gradientLayer4.colors = @[(__bridge id)cor4.CGColor,(__bridge id)cor1.CGColor];
    _gradientLayer4.startPoint = CGPointMake(1, 1-scale);
    _gradientLayer4.endPoint = CGPointMake(scale, 0);
    [_gradientLayer addSublayer:_gradientLayer4];
    
    [self.layer addSublayer:_gradientLayer];
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.lineWidth = _lineWidth;
    _progressLayer.strokeColor = [UIColor colorWithRed:170/255 green:210/255 blue:254/255 alpha:1].CGColor;
    
    _progressLayer.path = path.CGPath;
    _gradientLayer.mask = _progressLayer;
}

- (void)changeColor:(UIColor *)color step:(NSInteger)step{
    switch (step) {
        case 0:
            cor1 = color;
            break;
            
        case 1:
            cor2 = color;
            break;
            
        case 2:
            cor3 = color;
            break;
            
        default:
            cor4 = color;
            break;
    }
    [self changeColor];
}

- (void)changeColor{
    // CF和OC对象转化时只涉及对象类型不涉及对象所有权的转化
    // 转化当前对象的类型
    _gradientLayer1.colors = @[(__bridge id)cor1.CGColor,(__bridge id)cor2.CGColor];
    _gradientLayer2.colors = @[(__bridge id)cor2.CGColor,(__bridge id)cor3.CGColor];
    _gradientLayer3.colors = @[(__bridge id)cor3.CGColor,(__bridge id)cor4.CGColor];
    _gradientLayer4.colors = @[(__bridge id)cor4.CGColor,(__bridge id)cor1.CGColor];
}

- (void)addRatateAnimation{
    _animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    _animation.fromValue = [NSNumber numberWithFloat:0.0f];
    _animation.toValue = [NSNumber numberWithFloat:2*M_PI];
    _animation.duration = 2;
    _currentValue = 2/3.0;
    _animation.autoreverses = NO;
    _animation.fillMode = kCAFillModeForwards;
    _animation.repeatCount = 1000;
    [self.layer addAnimation:_animation forKey:nil];
}

- (void)changeSpeed:(CGFloat)value{
    _currentValue = value;
    _animation.duration = value*3;
    [self.layer addAnimation:_animation forKey:nil];
}

@end




























