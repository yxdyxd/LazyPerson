//
//  CusLayerView.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/2.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "CusLayerView.h"

#define MIN_HEIGHT    100

@interface CusLayerView ()

@property (nonatomic, assign) CGFloat mHeight;
// 红色点坐标x值
@property (nonatomic, assign) CGFloat curveX;
// 红色点坐标Y值
@property (nonatomic, assign) CGFloat curveY;
// 红色点对应视图
@property (nonatomic, strong) UIView *curveView;
// 形状对应的layer
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
// 使shapeLayer多次运行
@property (nonatomic, strong) CADisplayLink *displayLink;
// 检测是否运行
@property (nonatomic, assign) BOOL isAnimating;

@end

@implementation CusLayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化shapeLayer
        /*
         CAShapeLayer属于QuartzCore框架，继承自CALayer。
         CAShapeLayer是在坐标系内绘制贝塞尔曲线的，
         通过绘制贝塞尔曲线，设置shape(形状)的path(路径)，
         从而绘制各种各样的图形以及不规则图形。
         因此，使用CAShapeLayer需要与UIBezierPath一起使用。
         */
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = [UIColor blueColor].CGColor;
        [self.layer addSublayer:_shapeLayer];
        
        // _curveView就是r5点
        _curveX = screenWidth/2.0;
        _curveY = MIN_HEIGHT;
        _curveView = [[UIView alloc]initWithFrame:(CGRectMake(_curveX, _curveY, 3, 3))];
        _curveView.backgroundColor = [UIColor redColor];
        [self addSubview:_curveView];
        
        // 手势移动时相对高度
        _mHeight = 100;
        // 是否处于动效状态
        _isAnimating = NO;
        
        // 手势
        /*
         六种常用的手势：
         1.点击：[UITapGestureRecognizer]
         2.捏合：[UIPinchGestureRecognizer]
         3.旋转：[UIRotationGestureRecognizer]
         4.滑动、快移动：[UISwipeGestureRecognizer]
         5.长按：[UILongPressGestureRecognizer]
         6.平移、慢速移动：[UIPanGestureRecognizer]
         */
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanAction:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:pan];
        
        /*
         CADisplayLink是用于同步屏幕刷新频率的计时器
         CADisplayLink默认每秒运行60次calculatePath是算出在运行期间
         _curveView的坐标，从而确定_shapeLayer的形状
         注意：CADisplayLink是不能被继承的.
         */
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(calculatePath)];
        /*
         DefaultRunLoopMode:当我们执行其他滚动事件时，
         timer会默认暂时不监听，当滚动结束的时候会，继续监听。
         
         NSRunLoopCommonModes：始终监听滚动事件（不会因为触摸事件而暂停）
         */
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        _displayLink.paused = YES;
    }
    
    // 更新曲线形状
    [self updateShapeLayerPath];
    
    return self;
}

#pragma mark -  手势操控
/*
 当进行手势操控是，由于runloop的模式是NSDefaultRunLoopMode，所以会停止
 CADisplayLink的运行，即此处使用translationInView来进行坐标的计算
 */
- (void)handlePanAction:(UIPanGestureRecognizer *)pan{
    if (!_isAnimating) {
        if (pan.state == UIGestureRecognizerStateChanged) {
            // 手势移动
            // locationInView:获取到的是手指点击屏幕实时的坐标点；
            //translationInView：获取到的是手指移动后，在相对坐标中的偏移量
            CGPoint point = [pan translationInView:self];
            
            // 此处设置r5红点跟着手势走
            _mHeight = point.y*0.7 + MIN_HEIGHT;
            _curveX = screenWidth/2.0 + point.x;
            _curveY = _mHeight > MIN_HEIGHT ? _mHeight : MIN_HEIGHT;
            _curveView.frame = CGRectMake(_curveX, _curveY, _curveView.frame.size.width, _curveView.frame.size.height);
            
            // 根据r5的坐标，更新_shapelayer形状
            [self updateShapeLayerPath];
        }else if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateFailed){
            
            // 手势结束时，_shapeLayer返回原状并产生弹簧动效
            _isAnimating = YES;
            // 这个对象开始执行，calculatePath被多次调用
            _displayLink.paused = NO;
            // 弹簧动效
            [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
                // 曲线点（r5点）是一个view，所以在block中有弹簧效果
                // 然后根据动效路径，在calculate中计算弹性图形的形状
                self.curveView.frame = CGRectMake(screenWidth/2.0, MIN_HEIGHT, 3, 3);
            } completion:^(BOOL finished) {
                if (finished) {
                    self.displayLink.paused = YES;
                    self.isAnimating = NO;
                }
            }];
        }
    }
}

- (void)calculatePath{
    // 手势结束，r5执行了一个UIView的y弹簧动画
    // 把这个过程的坐标记录下来，并相应的画出_shapeLayer形状
    // 在layer层中可以获取当前图形的位置值
    CALayer *layer = _curveView.layer.presentationLayer;
    _curveX = layer.position.x;
    _curveY = layer.position.y;
    [self updateShapeLayerPath];
}

#pragma mark -  每次更新的时候，都初始化一个Path，然后重新绘制shapeLayer
- (void)updateShapeLayerPath
{
    // 更新_shapelayer形状
    /*
     UIBezierPath用于定义一个直线/曲线组合而成的路径，
     并且可以在自定义视图中渲染该路径。
     */
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    // r1点
    [tPath moveToPoint:(CGPointMake(0, 0))];
    // r2点
    [tPath addLineToPoint:(CGPointMake(screenWidth, 0))];
    // r4点
    [tPath addLineToPoint:(CGPointMake(screenWidth, MIN_HEIGHT))];
    // r3, r4, r5确定一个弧线
    [tPath addQuadCurveToPoint:(CGPointMake(0, MIN_HEIGHT)) controlPoint:(CGPointMake(_curveX, _curveY))];
    [tPath closePath];
    _shapeLayer.path = tPath.CGPath;
}

@end
