//
//  LZBMPMoviePlayerViewControllerVC.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/4.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "LZBMPMoviePlayerViewControllerVC.h"
#import <MediaPlayer/MediaPlayer.h>
// 消除由于版本过低产生的警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"


@interface LZBMPMoviePlayerViewControllerVC ()

@property (nonatomic, strong) MPMoviePlayerViewController *player;

@end

@implementation LZBMPMoviePlayerViewControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
}

- (void)playerButtonClick:(UIButton *)playButton{
    [self presentMoviePlayerViewControllerAnimated:self.player];
}

#pragma mark -  lazy
- (MPMoviePlayerViewController *)player{
    if (_player == nil) {
        // 创建播放器
        NSURL *url = [NSURL URLWithString:self.videoPath];
        _player = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    }
    return _player;
}

#pragma clang diagnostic pop

@end
