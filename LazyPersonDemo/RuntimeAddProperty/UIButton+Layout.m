//
//  UIButton+Layout.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/26.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "UIButton+Layout.h"
#import <objc/runtime.h>

@implementation UIButton (Layout)

#pragma mark -  通过运行时动态添加关联
// 定义关联的key
static const char *titleRectKey = "yl_titleRectKey";

- (CGRect)titleRect{
    return [objc_getAssociatedObject(self, titleRectKey)CGRectValue];
}

- (void)setTitleRect:(CGRect)titleRect{
    
    /*
     objc_setAssociatedObject中的四个参数
     1、表示当前的被关联的对象，即源对象（一般用self）
     2、要关联对象的键值，一般设置为静态的，用于获取关联对象的值
     3、关联的对象，可以通过设置nil来清除关联
     4、关联时采用的协议，有assign, retain, copy等。
     */
    objc_setAssociatedObject(self, titleRectKey, [NSValue valueWithCGRect:titleRect], OBJC_ASSOCIATION_RETAIN);
}

// 定义关联的key
static const char *imageRectKey = "yl_imageRectKey";
- (CGRect)imageRect {
    NSValue *rectValue = objc_getAssociatedObject(self, imageRectKey);
    return [rectValue CGRectValue];
}

- (void)setImageRect:(CGRect)imageRect {
    objc_setAssociatedObject(self, imageRectKey, [NSValue valueWithCGRect:imageRect], OBJC_ASSOCIATION_RETAIN);
}

#pragma mark -  通过运行时动态替换方法
+ (void)load {
    
    MethodSiwzzle(self, @selector(titleRectForContentRect:), @selector(override_titleRectForContentRect:));
    
    MethodSiwzzle(self, @selector(imageRectForContentRect:), @selector(override_imageRectForContentRect:));
}

void MethodSiwzzle(Class c, SEL origSEL, SEL overrideSEL) {
    // class_getInstanceMethod: 得到类的实例方法
    // class_getClassMethod: 得到类的类方法
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method overrideMethod = class_getInstanceMethod(c, overrideSEL);
    
    // 运行时函数class_method如果发现方法已经存在
    // 会返回失败，也可以用来做检查
    if (class_addMethod(c, origSEL, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        // 如果添加成功（在父类中重写的方法）
        // 再把目标类中的方法替换为旧有的实现
        // method_getImplementation：寻找方法
        // method_getTypeEncoding：获取的是一串值
        class_replaceMethod(c, overrideSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else{
        // addMethod会让目标类的方法指向新的实现
        // 使用replaceMethod再将新的方法指向原先实现
        // 这样就完成了交换操作
        method_exchangeImplementations(origMethod, overrideMethod);
    }
}

-(CGRect)override_titleRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [self override_titleRectForContentRect:contentRect];
}

-(CGRect)override_imageRectForContentRect:(CGRect)contentRect {
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [self override_imageRectForContentRect:contentRect];
}



@end
