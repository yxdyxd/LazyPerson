//
//  CusLayerView.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/2.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 总结：
 1.在iOS中CALayer是定义在QuartzCore框架中，此框架可以在iOS和MacOSX上使用
 是跨平台的，所以在layer层上的操作通常为，CGImageRef、CGColorRef。但是在使用
 中UIView可以处理触摸事件，而CALayer不能处理。（UIView绘制到CALayer上，CALayer绘制到屏幕上）
   layer中的三种图层：
   ① model layer tree(模型图层树) 、presentation layer tree（表示图层树） 、render layer tree（渲染图层树）
    模型图层树： 中的对象是应用程序与之交互的对象。此树中的对象是存储任何动画的目标值的模型对象。每当更改图层的属性时，都使用其中一个对象。
    表示图层树： "表现图层" 就是当前显示在屏幕上的图层。屏幕刷新时，就会调用presentationLayer。在core animation 动画中，可以通过这个属性，获取动画过程中每个时刻动画图层的数据，这样如果在动画过程中需要做什么处理，就可以动态的获取layer上相关的数据了。这个值只能获取而不能被改变
    渲染图层树：
        中的对象执行实际动画，并且是Core Animation的私有动画。
 2.设计运动路程是通过运行CADisplayLink，来确定_curveView在运行过程中的坐标值
   在CALayer层中可以通过获取presentationLayer，来获取坐标值
 3.通过获取到每秒的坐标值，来实时更新UIBezierPath路径，绘制贝塞尔曲线
 4.在触摸手势结束时，运用弹簧动效（弹簧动画效果）回复原样
 */

NS_ASSUME_NONNULL_BEGIN

@interface CusLayerView : UIView

@end

NS_ASSUME_NONNULL_END
