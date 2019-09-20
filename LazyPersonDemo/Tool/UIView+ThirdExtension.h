//
//  UIView+ThirdExtension.h
//  ThirdPartUnit
//
//  Created by 费城 on 2019/5/30.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

CGPoint ThirdCGRectGetCenter(CGRect rect);
CGRect  ThirdCGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ThirdExtension)

/* 在分类中声明属性，只会生成方法的声明，不会生成方法的实现和带有_下划线的成员变量，通过手动添加setter、getter可以实现点语法，但是调用下划线，依然会报错 */


@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat x;
@property CGFloat y;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

//获取UIView 所在的视图控制器
- (UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
