//
//  CALayer+Additions.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/9/5.
//  Copyright © 2019 火眼征信. All rights reserved.
//

#import "CALayer+Additions.h"

@implementation CALayer (Additions)

- (void)setBorderColorFromUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end
