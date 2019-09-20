//
//  BaseViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/3.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIButton *playerButton;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerButton.center = self.view.center;
    self.playerButton.bounds = CGRectMake(0, 0, 100*ScaleSize, 44*ScaleSize);
}

- (void)playerButtonClick:(UIButton *)playButton
{
    
}

- (UIButton *)playerButton{
    if (_playerButton == nil) {
        _playerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_playerButton setTitle:@"播放" forState:(UIControlStateNormal)];
        [_playerButton setTitle:@"停止" forState:(UIControlStateSelected)];
        [_playerButton addTarget:self action:@selector(playerButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_playerButton];
        _playerButton.backgroundColor = [UIColor blackColor];
        [_playerButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    }
    return _playerButton;
}

@end
