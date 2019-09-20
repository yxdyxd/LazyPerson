//
//  SliderViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/23.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "SliderViewController.h"
#import "GYCircleView.h"

@interface SliderViewController ()

@property (nonatomic, strong) GYCircleView *cview;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cview = [[GYCircleView alloc]initWithFrame:(CGRectMake(10.0, 110, 355, 355)) lineWidth:35];
    [self.cview addRatateAnimation];
    [self.view addSubview:self.cview];
    self.slider.value = self.cview.currentValue;
}

- (IBAction)slider:(UISlider *)sender {
    [self.cview changeSpeed:sender.value];
}

// 此处实现了，三个按钮共用一个点击方法（以下的4个按钮都是）
- (IBAction)b1:(UIButton *)sender {
    [self.cview changeColor:sender.backgroundColor step:0];
}

- (IBAction)b2:(UIButton *)sender {
    [self.cview changeColor:sender.backgroundColor step:1];
}

- (IBAction)b3:(UIButton *)sender {
    [self.cview changeColor:sender.backgroundColor step:2];
}

- (IBAction)b4:(UIButton *)sender {
    [self.cview changeColor:sender.backgroundColor step:3];
}

@end



























