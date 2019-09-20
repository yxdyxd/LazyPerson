//
//  YLButton.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/27.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "YLButton.h"

@implementation YLButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    // 判断视图不为空并且不是零大小（即frame(0,0,0,0)）
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [super titleRectForContentRect:contentRect];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [super imageRectForContentRect:contentRect];
}

@end
