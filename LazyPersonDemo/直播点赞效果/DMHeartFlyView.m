//
//  DMHeartFlyView.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/9.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#define DMRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define DMRGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define DMRandColor DMRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#import "DMHeartFlyView.h"

@interface DMHeartFlyView ()
// 线条边边颜色
@property (nonatomic, strong) UIColor *strokeColor;
// 填充颜色
@property (nonatomic, strong) UIColor *fillColor;

@end

@implementation DMHeartFlyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _strokeColor = [UIColor whiteColor];
        _fillColor = DMRandColor;
        self.backgroundColor = [UIColor clearColor];
        // anchorPoint: 锚点，围绕这个点进行转动
        self.layer.anchorPoint = CGPointMake(0.5, 1);
    }
    return self;
}

// M_PI: 旋转的弧度，此处代表180°角
static CGFloat PI = M_PI;
- (void)animateInView:(UIView *)view{
    // 动画持续的时间
    NSTimeInterval totalAnimationDuration = 6;
    // 相对画布的大小
    CGFloat heartSize = CGRectGetWidth(self.bounds);
    // 画布的中轴线
    CGFloat heartCenterX = self.center.x;
    CGFloat viewHeight = CGRectGetHeight(view.bounds);
    
    // Pre-Animation setup
    // CGAffineTransformMakeScale：两个参数分别代表，x,y的缩放倍数
    self.transform = CGAffineTransformMakeScale(0, 0);
    self.alpha = 0;
    
    // Bloom
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
        // CGAffineTransformIdentity: 和原图一样的transform
        // transform：转变转化，对图像的操作
        self.transform = CGAffineTransformIdentity;
        self.alpha = 0.9;
    } completion:NULL];
    
    // 表示0，1两个随机数，参数表示0~（i-1）的随机数
    NSInteger i = arc4random_uniform(2);
    // 1或者-1
    NSInteger rotationDirection = 1 - (2*i); //-1 OR 1
    // 0-9的随机数
    NSInteger rotationFraction = arc4random_uniform(10);
    [UIView animateWithDuration:totalAnimationDuration animations:^{
        // CGAffineTransformMakeRotation实现以初始位置为基准
        // 将坐标系统逆时针旋转angle弧度
        // (弧度=π/180×角度,M_PI弧度代表180角度)
        // 上升到一定高度，有个倾斜的角度
        self.transform = CGAffineTransformMakeRotation(rotationDirection * PI/(16 + rotationFraction*0.2));
    }];
    
    UIBezierPath *heartTravelPath = [UIBezierPath bezierPath];
    [heartTravelPath moveToPoint:self.center];
    
    // random end point
    // 随机结束的点
    CGPoint endPoint = CGPointMake(heartCenterX + (rotationDirection) * arc4random_uniform(2*heartSize), viewHeight/6.0 + arc4random_uniform(viewHeight/4.0));
    
    // random Comtrol Points
    NSInteger j = arc4random_uniform(2);
    NSInteger travelDirection = 1- (2*j);
    
    // randomize x and y for control points
    CGFloat xDelta = (heartSize/2.0 + arc4random_uniform(2*heartSize)) *travelDirection;
    CGFloat yDelta = MAX(endPoint.y, MAX(arc4random_uniform(8*heartSize), heartSize));
    CGPoint controlPoint1 = CGPointMake(heartCenterX + xDelta, viewHeight - yDelta);
    CGPoint controlPoint2 = CGPointMake(heartCenterX - 2*xDelta, yDelta);
    
    // addCurveToPoint：绘制三次贝塞尔曲线（从上一个点到endPoint）
    [heartTravelPath addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    /*
     CAKeyframeAnimation：提供关键帧数据的数组，
     数组中的每一个值都对应一个关键帧
     根据动画类型(keyPath)的不同 ，值的类型不同
     */
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.path = heartTravelPath.CGPath;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyFrameAnimation.duration = totalAnimationDuration + endPoint.y/viewHeight;
    // addAnimation: 给图层添加动画
    [self.layer addAnimation:keyFrameAnimation forKey:@"positionOnPath"];
    
    // Alpha & remove from superview
    // 动画效果执行完毕，移除视图
    [UIView animateWithDuration:totalAnimationDuration animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

- (void)drawRect:(CGRect)rect{
    [self drawHeartInRect:rect];
}

- (void)drawHeartInRect:(CGRect)rect{
    
    // 填充线条的颜色
    [_strokeColor setStroke];
    // 填充整个view内部的颜色
    [_fillColor setFill];
    
    CGFloat drawingPadding = 4.0;
    CGFloat curveRadius = floor((CGRectGetWidth(rect) - 2*drawingPadding)/4.0);
    
    // Create path
    UIBezierPath *heartPath = [UIBezierPath bezierPath];
    
    // Start at bottom heart tip
    // floor函数：如果参数是小数，则求最大的整数但不大于本身.
    CGPoint tipLocation = CGPointMake(floor(CGRectGetWidth(rect) / 2.0), CGRectGetHeight(rect) - drawingPadding);
    [heartPath moveToPoint:tipLocation];
    
    // move to top left start of curve
    CGPoint topLeftCurveStart = CGPointMake(drawingPadding, floor(CGRectGetHeight(rect)/2.4));
    [heartPath addQuadCurveToPoint:topLeftCurveStart controlPoint:CGPointMake(topLeftCurveStart.x, topLeftCurveStart.y + curveRadius)];
    
    // create top left curve
    [heartPath addArcWithCenter:CGPointMake(topLeftCurveStart.x + curveRadius, topLeftCurveStart.y) radius:curveRadius startAngle:PI endAngle:0 clockwise:YES];
    
    // create top right curve
    CGPoint topRightCurveStart = CGPointMake(topLeftCurveStart.x + 2*curveRadius, topLeftCurveStart.y);
    [heartPath addArcWithCenter:CGPointMake(topRightCurveStart.x + curveRadius, topRightCurveStart.y) radius:curveRadius startAngle:PI endAngle:0 clockwise:YES];
    
    // Final curve to bottom heart tip
    CGPoint topRightCurveEnd = CGPointMake(topLeftCurveStart.x + 4*curveRadius, topRightCurveStart.y);
    [heartPath addQuadCurveToPoint:tipLocation controlPoint:CGPointMake(topRightCurveEnd.x, topRightCurveEnd.y + curveRadius)];
    
    [heartPath fill];
    
    heartPath.lineWidth = 1;
    /*
     lineCapStyle: 这个线段起点是终点的样式，这个样式有三种：
     kCGLineCapButt   无端点
     kCGLineCapRound  圆形端点
     kCGLineCapSquare 方形端点
     （样式上和kCGLineCapButt是一样的，但是比kCGLineCapButt长一点）
     */
    heartPath.lineCapStyle = kCGLineCapRound;
    /*
     lineJoinStyle: 这个属性是用来设置两条线连结点的样式
     kCGLineJoinMiter 直接连接
     kCGLineJoinRound 圆滑衔接
     kCGLineJoinBevel 斜角连接
     */
    // 设置拐点样式
    heartPath.lineJoinStyle = kCGLineCapRound;
    [heartPath stroke];
}

@end
