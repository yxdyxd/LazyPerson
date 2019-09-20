//
//  TableSectionView.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/9/5.
//  Copyright © 2019 火眼征信. All rights reserved.
//

#import "TableSectionView.h"

@implementation TableSectionView
{
    NSMutableArray *selectedBtnCenter;
    UIView *followLab;
    UIButton *selectedBtn;
}

- (instancetype)initWithTitleArr:(NSArray<NSString *> *)titleArr sectionHeight:(CGFloat)sectionHeight {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(trackAction:) name:@"SCROLLEDNOTIFICATION" object:nil];
        
        CGFloat btnWidth = screenWidth / titleArr.count;
        // 创建一个数组长度为0的数组，假如为5，即5个5个的控件开辟
        selectedBtnCenter = [NSMutableArray arrayWithCapacity:0];
        UILabel *topLab = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, screenWidth, 0.6))];
        topLab.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        for (int i = 0; i < titleArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(i * btnWidth, 1, btnWidth, sectionHeight - 2);
            [btn setTitle:titleArr[i] forState:(UIControlStateNormal)];
            [btn setTitleColor:[UIColor colorWithRed:231/255.0 green:129/255.0 blue:112/255.0 alpha:1] forState:(UIControlStateSelected)];
            [btn setTitleColor:[UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1] forState:(UIControlStateNormal)];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.tag = 100 + i;
            [btn addTarget:self action:@selector(clickEvent:) forControlEvents:(UIControlEventTouchUpInside)];
            
            [self addSubview:btn];
            [selectedBtnCenter addObject:[NSValue valueWithCGPoint:btn.center]];
            
            if (i == 0) {
                btn.selected = YES;
                selectedBtn = btn;
            }
        }
        UILabel *bottomLab = [[UILabel alloc]initWithFrame:(CGRectMake(0, sectionHeight - 1, screenWidth, 0.6))];
        bottomLab.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        [self addSubview:bottomLab];
        [self addSubview:topLab];
        
        CGFloat followWidth = [titleArr.firstObject boundingRectWithSize:(CGSizeMake(screenWidth, sectionHeight)) options:(NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width;
        followLab = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, followWidth, 2))];
        followLab.backgroundColor = [UIColor colorWithRed:231/255.0 green:129/255.0 blue:112/255.0 alpha:1];
        followLab.center = CGPointMake([selectedBtnCenter.firstObject CGPointValue].x, sectionHeight - 1);
        [self addSubview:followLab];
    }
    return self;
}

- (void)clickEvent:(UIButton *)btn {
    selectedBtn.selected = !selectedBtn.selected;
    btn.selected = !btn.selected;
    selectedBtn = btn;
    [UIView animateWithDuration:.23f animations:^{
        followLab.center = CGPointMake([selectedBtnCenter[btn.tag - 100]CGPointValue].x, btn.frame.size.height + 1);
    }completion:^(BOOL finished) {
        self.clickBlock(btn.tag);
    }];
}

- (void)trackAction:(id)sender {
    UIButton *btn = [self viewWithTag:(int)[[sender object] contentOffset].x / screenWidth + 100];
    [self clickEvent:btn];
}

@end
