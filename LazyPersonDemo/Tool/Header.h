//
//  Header.h
//  TestFireEyeSDkDemo
//
//  Created by 费城 on 2019/5/10.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "UIView+ThirdExtension.h"

// 宏定义
#define APPDELEGATE     ((AppDelegate*)[[UIApplication sharedApplication] delegate])

// 打包关闭打印信息
//#define NSLog(format, ...) printf("")
// 日常打印信息
#define NSLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);

//适配屏幕
#define ScreenToTop 64
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

//设置放大或者缩小系数
#define ScaleSize [UIScreen mainScreen].bounds.size.width/414.0
#define ScrHScaleSize 736.0/[UIScreen mainScreen].bounds.size.height

//适配iPhone X （状态栏）
#define Statusbar [[UIApplication sharedApplication] statusBarFrame].size.height
#define Navigationbar self.navigationController.navigationBar.frame.size.height
//判断当前是否为iPhoneX
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define CYL_IS_IOS_11  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.f)
#define IS_IPHONE_X (CYL_IS_IOS_11 && CYL_IS_IPHONE && (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 375 && MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 812))

/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

// 使用masonry布局
#import "Masonry.h"

// 动态计算tableview高度的宏定义
#import "UIColor+HexString.h"

/**
 *  屏幕宽高
 */
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

/**
 *  tableView
 */
#define iCodeTableviewBgColor [UIColor colorWithHexString:@"#E2EAF2"]                  //tableview背景颜色
#define iCodeTableViewSectionMargin 25

/**
 *  导航条
 */
#define iCodeNavigationBarColor [UIColor colorWithHexString:@"#47B879"]                  //导航条颜色

/**
 *  tableView
 */
#define iCodeTableviewBgColor [UIColor colorWithHexString:@"#E2EAF2"]                  //tableview背景颜色
#define iCodeTableViewSectionMargin 25                                                 //section间距

/**
 *  头像cell高度
 */
#define iconRowHeight 74

/**
 *  普通cell高度
 */
#define nomalRowHeight 44

/**
 *  Code圈
 */
#define circleCellMargin 15  //间距
#define circleCelliconWH 40  //头像高度、宽度
#define circleCellWidth [UIScreen mainScreen].bounds.size.width - 2 * circleCellMargin  //cell的宽度
#define circleCellNameattributes @{NSFontAttributeName : [UIFont systemFontOfSize:16]}  //昵称att
#define circleCellNameFont [UIFont systemFontOfSize:16]                                 //昵称字号
#define circleCellTimeattributes @{NSFontAttributeName : [UIFont systemFontOfSize:13]}  //时间att
#define circleCellTimeFont [UIFont systemFontOfSize:13]                                 //时间字号
#define circleCellTextattributes @{NSFontAttributeName : [UIFont systemFontOfSize:17]}  //正文att
#define circleCellTextFont [UIFont systemFontOfSize:17]                                 //正文字号
#define circleCellPhotosWH (circleCellWidth - 2 * (circleCellMargin + circleCellPhotosMargin)) / 3                                                                                   //图片的宽高
#define circleCellPhotosMargin 5                                                        //图片间距
#define circleCellToolBarHeight 35                                                      //cell工具条高度
#define circleCellToolBarTintColor [UIColor colorWithHexString:@"#ffffff"]              //工具条图标、字体颜色
#define circleCellToolBarTittleFont [UIFont systemFontOfSize:14]                        //工具条btn字号


#endif /* Header_h */
