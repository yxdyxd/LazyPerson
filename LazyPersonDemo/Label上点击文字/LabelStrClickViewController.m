//
//  LabelStrClickViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/5.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "LabelStrClickViewController.h"
#import "PCBClickLabel.h"

@interface LabelStrClickViewController ()

@end

@implementation LabelStrClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PCBClickLabel *label = [[PCBClickLabel alloc]initLabelViewWithLab:@"我是label上的点击文字" clickTextRange:NSMakeRange(9, 2) clickAtion:^{
        NSLog(@"点击了");
    }];
    [self.view addSubview:label];
}

@end
