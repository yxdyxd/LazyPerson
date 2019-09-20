//
//  RollViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/8/27.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

/*
 本节：
 1. 定时器的暂停和开始使用：
 开启：_timer.fireDate = [NSDate distantPast];
 暂停：_timer.fireDate = [NSDate distantFuture];
 2. btn的创建可以通过for循环，数组添加标题，根据下标的不同，来赋值不同的btn
 3. 大括号声明的属性不能被外部文件访问，仅仅是有这个属性，下划线加不加都无所谓
    但是，手写setter和getter就可以被访问。
    而@property，则是系统自动的生成了setter和getter方法。
    https://blog.csdn.net/u011010305/article/details/51801845
 4.UIView执行动画（可设置持续时间，完成动画之后的操作等）
 */


#import "RollViewController.h"

@interface RollViewController ()
{
    UIView *_backView;
    NSTimer *_timer;
    NSInteger _seconds;
    UILabel *_descLabel;
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *labelArr;
@end

@implementation RollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _seconds = 0;
    _labelArr = [NSMutableArray new];
    _backView = [[UIView alloc] initWithFrame:(CGRectMake(100, 100, 200, 20))];
    _backView.backgroundColor = [UIColor redColor];
    _backView.clipsToBounds = YES;
    _backView.userInteractionEnabled = YES;
    [self.view addSubview:_backView];
    
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.6 target:weakSelf selector:@selector(timerRepeat) userInfo:nil repeats:YES];
    // fireDate: 当前时间距离下一次要执行定时器方法的时间之间的间隔.
    // 通俗的来讲就是关闭定时器，初始设置为关闭状态
    _timer.fireDate = [NSDate distantFuture];
    
    [self createCicleLabel];
}

- (void)createCicleLabel {
    for (int i = 0; i < 2; i++) {
        UILabel *scrollLabel = [[UILabel alloc]initWithFrame:(CGRectMake(10, 60, 180, 20))];
        scrollLabel.backgroundColor = [UIColor clearColor];
        scrollLabel.textAlignment = NSTextAlignmentCenter;
        [_backView addSubview:scrollLabel];
        // 添加label下标
        scrollLabel.tag = 3000 + i;
        scrollLabel.userInteractionEnabled = YES;
        [_labelArr addObject:scrollLabel];
        
        // 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)];
        [scrollLabel addGestureRecognizer:tap];
        
        UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        clickBtn.frame = CGRectMake(30+(100+30)*i, 200, 100, 40);
        // 确定添加当前的button
        [clickBtn setTitle:@[@"点我开始", @"点我关闭"][i] forState:(UIControlStateNormal)];
        [clickBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        clickBtn.tag = 1000 + i;
        [clickBtn addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:clickBtn];
    }
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:(CGRectMake(30, 300, 100, 40))];
    descLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:descLabel];
    _descLabel = descLabel;
    
    UIButton *closeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    closeBtn.frame = CGRectMake(20, 60, 50, 50);
    [closeBtn setTitle:@"关闭" forState:(UIControlStateNormal)];
    [closeBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [closeBtn addTarget:self action:@selector(closeClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:closeBtn];
}

// 每隔一段时间label字段变化
- (void)timerRepeat {
    UILabel *targetLab = [_labelArr objectAtIndex:_seconds % 2];
    targetLab.text = [NSString stringWithFormat:@"%ld",_seconds];
    // 显示字段的label的背景颜色
    targetLab.backgroundColor = [UIColor whiteColor];
    // 显示label字体的背景颜色，将视图显示在最前边
    [_backView bringSubviewToFront:targetLab];
    /*
     UIView坐标改变实现滑动动画
     1. animateWithDuration：动画执行时间
     2. animations：执行动画
     3. completion：动画结束后执行的操作
     */
    [UIView animateWithDuration:0.3 animations:^{
        targetLab.frame = CGRectMake(10, 0, 180, 20);
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.3 animations:^{
                targetLab.frame = CGRectMake(10, -20, 180, 20);
            } completion:^(BOOL finished) {
                targetLab.frame = CGRectMake(10, 20, 180, 20);
            }];
        });
    }];
    // 实现数字的加一操作
    _seconds++;
}

- (void)buttonClick:(UIButton *)button {
    if (button.tag - 1000 == 0) {
        // 开启定时器
        _timer.fireDate = [NSDate distantPast];
    }
    if (button.tag - 1000 == 1) {
        // 关闭定时器
        _timer.fireDate = [NSDate distantFuture];
    }
}

// 点击显示字段
- (void)labelClick:(UITapGestureRecognizer *)tap {
    UILabel *targetLabel = (UILabel *)tap.view;
    _descLabel.text = [NSString stringWithFormat:@"%ld -- %@",tap.view.tag, targetLabel.text];
}

- (void)closeClick {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
