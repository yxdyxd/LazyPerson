//
//  RuntimeTextFontViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/9/13.
//  Copyright © 2019 火眼征信. All rights reserved.
//

#import "RuntimeTextFontViewController.h"

@interface RuntimeTextFontViewController ()

@end

@implementation RuntimeTextFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:(CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100))];
    
    label.text = @"我我我我我我我我我我我我我我我我我我我我我";
    label.backgroundColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
}

@end
