//
//  VersionUpdateViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/28.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "VersionUpdateViewController.h"
#import "UIAlertController+NewVersion.h"

@interface VersionUpdateViewController ()

@end

@implementation VersionUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *currentVersion = @"5.0.0";
    NSString *title = @"1.修正了部分单词页面空白的问题\n2.修正了部分单词页面空白的问题\n3.修正了部分单词页面空白的问题";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIAlertController alertContorllerWithCurrentVersion:currentVersion andTitle:title andController:self];
    });
}

@end
