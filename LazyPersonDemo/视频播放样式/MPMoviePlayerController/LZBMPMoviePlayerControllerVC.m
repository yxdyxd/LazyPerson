//
//  LZBMPMoviePlayerControllerVC.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/4.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "LZBMPMoviePlayerControllerVC.h"
#import <MediaPlayer/MediaPlayer.h>

@interface LZBMPMoviePlayerControllerVC ()

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//这里是弃用的属性
@property (nonatomic, strong) MPMoviePlayerController *player;
#pragma clang diagnostic pop


@end

@implementation LZBMPMoviePlayerControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)playerButtonClick:(UIButton *)playButton{
    // 三部曲
    playButton.selected = !playButton;
    
    if (playButton.isSelected) {
        // 准备播放
        [self.player prepareToPlay];
        if ([self.player isPreparedToPlay]) {
            [self.player play];
        }
    }else{
        [self.player stop];
    }
}

- (void)loadStateDidChange:(NSNotification *)sender{
    switch (self.player.loadState) {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        case MPMovieLoadStatePlayable:
        {NSLog(@"加载完成，可以播放");}
            break;
            
        case MPMovieLoadStatePlaythroughOK:
        {NSLog(@"缓冲完成，可以连续播放");}
            break;
            
        case MPMovieLoadStateStalled:
        {NSLog(@"缓冲中...");}
            break;
            
        case MPMovieLoadStateUnknown:
        {NSLog(@"未知状态");}
            break;
        default:
            break;
#pragma clang diagnostic pop
        
    }
}

#pragma mark -  lazy
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//这里是弃用的属性
- (MPMoviePlayerController *)player{
    if (_player == nil) {
        // 1.创建播放器
        NSURL *url = [NSURL URLWithString:self.videoPath];
        _player = [[MPMoviePlayerController alloc]initWithContentURL:url];
        
        // 2.给播放器内部的view设置frame
        _player.view.frame = CGRectMake(0, 64, screenWidth, screenWidth * 9 / 16);
        
        // 3.添加到控制器view中
        [self.view addSubview:_player.view];
        
        // 监听当前视频播放状态
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStateDidChange:) name:MPMoviePlayerNowPlayingMovieDidChangeNotification object:nil];
        
        // 4.设置控制面板
        //        _player.controlStyle = MPMovieControlStyleFullscreen;
        
    }
    return _player;
}
#pragma clang diagnostic pop

@end
