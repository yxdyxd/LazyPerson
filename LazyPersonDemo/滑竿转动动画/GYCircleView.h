//
//  GYCircleView.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/18.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYCircleView : UIView

@property (nonatomic, assign, readonly) CGFloat currentValue;

// 线宽
- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth;

// 改变圆环颜色
- (void)changeColor:(UIColor *)color step:(NSInteger)step;

// 添加动画
- (void)addRatateAnimation;

// 改变旋转速度 0~1
- (void)changeSpeed:(CGFloat)value;



@end

NS_ASSUME_NONNULL_END
