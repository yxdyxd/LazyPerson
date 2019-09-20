//
//  ExerciseBezierDraw.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/9.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "ExerciseBezierDraw.h"

@implementation ExerciseBezierDraw

// 重写drawRect
- (void)drawRect:(CGRect)rect{
    // 画多边形
//    [self drawPolygon];
    // 画矩形
//    [self drawRectangle];
    // 画圆形
//    [self drawCircle];
    // 画圆弧
//    [self drawArc];
    // 画两次曲线
//    [self drawSecondCurve];
    // 画三次曲线
//    [self drawThirdCurve];
    // 绘制扇形
    [self drawFanShape];
}

// 画多边形
- (void)drawPolygon{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 15.0;
    // 设置终点起点的样式
    aPath.lineCapStyle = kCGLineCapButt;
    // 设置拐点的样式
    aPath.lineJoinStyle = kCGLineJoinBevel;
    // 设置起始点
    [aPath moveToPoint:(CGPointMake(250, 130))];
    // 设置途经点
    [aPath addLineToPoint:(CGPointMake(350, 170))];
    [aPath addLineToPoint:(CGPointMake(310, 270))];
    [aPath addLineToPoint:(CGPointMake(190, 270))];
    [aPath addLineToPoint:(CGPointMake(150, 170))];
    // 通过调用closePath方法得到最后一条线
    [aPath closePath];
    
    // 设置边框线条的颜色
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    [aPath stroke];
    // 设置里边的填充色
    UIColor *fillColor = [UIColor blueColor];
    [fillColor set];
    [aPath fill];
}

- (void)drawRectangle{
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:(CGRectMake(100, 100, 100, 100))];
    
    // 设置边框线条的颜色
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    [aPath stroke];
    // 设置里边的填充色
    UIColor *fillColor = [UIColor blueColor];
    [fillColor set];
    [aPath fill];
}

- (void)drawCircle{
    // 若要画椭圆，宽高设置不一样即可
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:(CGRectMake(100, 100, 200, 200))];
    aPath.lineWidth = 5.0;
    // 设置线条拐角
    aPath.lineCapStyle = kCGLineCapRound;
    // 设置终点
    aPath.lineJoinStyle = kCGLineCapRound;
    UIColor *color = [UIColor redColor];
    [color set];
    [aPath stroke];
}

- (void)drawArc{
    /*
     ArcCenter: 原点
     radius：半径
     startAngle：开始角度
     clockwise：是否顺时针方向
     */
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:(CGPointMake(200, 300)) radius:80 startAngle:0 endAngle:M_PI clockwise:YES];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; // 拐角
    aPath.lineJoinStyle = kCGLineCapRound; // 终点
    
    UIColor *color = [UIColor redColor];
    [color set];
    [aPath stroke];
}

// 画两次曲线
- (void)drawSecondCurve{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineCapRound;
    // 设置初始点
    [aPath moveToPoint:(CGPointMake(100, 200))];
    // 终点 controlpoint：切点
    // 根据起始点、终点、control点构成三角形，三角形的边组成切线，来画弧线
    // 具体图形参考：https://www.jianshu.com/p/6c9aa9c5dd68
    [aPath addQuadCurveToPoint:(CGPointMake(200, 200)) controlPoint:(CGPointMake(150, 150))];
    UIColor *color = [UIColor redColor];
    [color set];
    [aPath stroke];
}

// 画三次曲线
- (void)drawThirdCurve{
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineJoinRound;
    [aPath moveToPoint:(CGPointMake(20, 120))];
    // 此处设置两个切点
    [aPath addCurveToPoint:(CGPointMake(120, 120)) controlPoint1:(CGPointMake(45, 70)) controlPoint2:(CGPointMake(95, 170))];
    UIColor *color = [UIColor redColor];
    [color set];
    [aPath stroke];
}

// 绘制扇形
- (void)drawFanShape{
    [[UIColor redColor] set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:(CGPointMake(100, 200))];// 起始点
    [path addArcWithCenter:(CGPointMake(100, 200)) radius:75 startAngle:-5 endAngle:3.14159/2 - 5 clockwise:NO];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path closePath]; //最后处理，形成闭环
    [path stroke];
    
}




@end
