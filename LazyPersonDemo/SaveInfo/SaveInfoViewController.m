//
//  SaveInfoViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/28.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "SaveInfoViewController.h"
#import "SaveInfoView.h"

@interface SaveInfoViewController ()

@property (nonatomic, strong) SaveInfoView *saveView;

@end

@implementation SaveInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveView = [[SaveInfoView alloc]initWithFrame:(CGRectMake(0, Statusbar+Navigationbar, screenWidth, screenHeight))];
    [self.view addSubview:self.saveView];
}


@end
