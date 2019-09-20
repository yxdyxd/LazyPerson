//
//  PCBClickLabel.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/5.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 1.对label点击和不点击部分分开计算大小，
   需要点击的部分加上点击手势，block回调点击事件
 2.从现有的字符串中，取出需要的字段
   substringFromIndex：取值的起始点
   substringWithRange：取值的长度
   substringToIndex：  取值的截止点
 3.系统API计算宽度：
   NSStringDrawingUsesLineFragmentOrigin：
   整个文本将以每行组成的矩形为单位，计算整个文本的尺寸
   NSStringDrawingUsesFontLeading：
     计算行高时，使用行间距(字体大小+行间距 = 行高)
 */


/**
 点击按钮
 */
typedef void (^clickBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface PCBClickLabel : UIView

- (instancetype)initLabelViewWithLab:(NSString *)text clickTextRange:(NSRange)clickTextRange clickAtion:(clickBlock)clickAtion;

@property (nonatomic, copy) clickBlock clickBlock;

@end

NS_ASSUME_NONNULL_END
