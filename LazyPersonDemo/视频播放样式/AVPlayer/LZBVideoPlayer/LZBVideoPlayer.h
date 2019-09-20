//
//  LZBVideoPlayer.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/3.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

// 可以直接拿来用的视频封装工具
/*
 总结：
 功能介绍：
 1.可以通过URL来播放视频，也可以播放本地视频
 2.本封装工具中包含了对视频的播放，暂停和结束
 3.对视频的操作有，视频缓存、返回视频剩余时间、提供加载动画
 4.监听app当前状态（是否后台挂起、是否回到播放界面）
 
 技术点：
 1.respondsToSelector：检查是否包含某个方法，防止程序异常报错
 2.performSelector：调用方法，一般在1中的方法检测后调用
 3.keypath，通过不同的标识符来访问不同的资源
 4.判断app当前所处的状态，系统API提供了相应的调用
 */

// 封装视频工具类，可以播放本地视频也可以播放网络视频
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol LZBVideoPlayerLoadingDelegate <NSObject>

@required
- (void)startAnimating;
- (void)stopAnimating;

@end

@interface LZBVideoPlayer : NSObject

// 单例初始化播放器
+ (instancetype)shareInstance;

/**
 自动播放视频

 @param url 播放URL
 @param superView 播放视频的父控件
 */
- (void)playVideoUrl:(NSURL *)url showInSuperView:(UIView *)superView;

/**
 可设置背景图的播放器

 @param url 自动播放的URL
 @param coverUrl 加载默认背景图
 @param superView 传入视频播放层的父控件
 */
- (void)playVideoUrl:(NSURL *)url coverImageurl:(NSString *)coverUrl showInsuperView:(UIView *)superView;

/**
 返回剩余时间
 */
@property (nonatomic, copy)void(^playerTimeProgressBlock)(long residuTime);
- (void)setPlayerTimeProgressBlock:(void (^)(long residueTime))playerTimeProgressBlock;

/**
 播放与重播
 */
- (void)playWithResume;

/**
 暂停
 */
- (void)pause;

/**
 停止
 */
- (void)stop;

#pragma mark -  config属性

/**
 视频加载视图，默认为系统UIActivityIndicatorView
 */
@property (nonatomic, strong) UIView<LZBVideoPlayerLoadingDelegate> *loadingView;

/**
 默认YES，当APP加载视频是否显示加载动画
 */
@property (nonatomic, assign) BOOL showActivityWhenLoading;

/**
 默认YES，当APP进入后台是否停止播放
 */
@property (nonatomic, assign) BOOL stopWhenAppDidEnterBackground;

/**
 默认NO，当播放时是否打开声音
 */
@property (nonatomic, assign) BOOL openSoundWhenPlaying;

@end


