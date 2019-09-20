//
//  UIFont+runtime.m
//  字体大小适配-runtime
//
//  Created by 刘龙 on 2017/3/23.
//  Copyright © 2017年 xixhome. All rights reserved.
//

#import "UIFont+runtime.h"
#import <objc/runtime.h>

@implementation UIFont (runtime)

// 在加载文件时，就会执行的方法
// load方法调用在main函数之前，自身的和分类的load方法都会被调用
+ (void)load{
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 最后交换类方法
    method_exchangeImplementations(newMethod, method);
}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;
    
    // 根据手机屏幕的大小调整字体的大小（相当于字体调节，屏幕大小的倍数）
    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width/YourUIScreen];
    
    return newFont;
}

@end
