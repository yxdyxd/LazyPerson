//
//  ClickHeartViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/9.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "ClickHeartViewController.h"
#import "DMHeartFlyView.h"
#import "ExerciseBezierDraw.h"

@interface ClickHeartViewController ()
{
    CGFloat _heartSize;
    NSTimer *_burstTimer;
}
@end

@implementation ClickHeartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _heartSize = 36;
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showTheLove)];
    [self.view addGestureRecognizer:tapGesture];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    // 长按时间
    longPressGesture.minimumPressDuration = 0.2;
    [self.view addGestureRecognizer:longPressGesture];
    
    ExerciseBezierDraw *bezierView = [[ExerciseBezierDraw alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:bezierView];
}

- (void)showTheLove{
    DMHeartFlyView *heart = [[DMHeartFlyView alloc]initWithFrame:(CGRectMake(0, 0, _heartSize, _heartSize))];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(20 + _heartSize/2.0, self.view.bounds.size.height - _heartSize/2.0 - 10);
    heart.center = fountainSource;
    [heart animateInView:self.view];
}

- (void)longPressGesture:(UILongPressGestureRecognizer *)longPressGesture{
    switch (longPressGesture.state) {
        case UIGestureRecognizerStateBegan:
            _burstTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(showTheLove) userInfo:nil repeats:YES];
            break;
            
        case UIGestureRecognizerStateEnded:
            [_burstTimer invalidate];
            _burstTimer = nil;
            break;
            
        default:
            break;
    }
}

@end
