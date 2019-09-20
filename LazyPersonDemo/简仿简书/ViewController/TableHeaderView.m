//
//  TableHeaderView.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/9/5.
//  Copyright © 2019 火眼征信. All rights reserved.
//

#import "TableHeaderView.h"

@interface TableHeaderView ()

@end

@implementation TableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"TableHeaderView" owner:nil options:nil].lastObject;
    }
    return self;
}

@end
