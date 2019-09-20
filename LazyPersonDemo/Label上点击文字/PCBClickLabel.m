//
//  PCBClickLabel.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/5.
//  Copyright © 2019 BUG联盟. All rights reserved.
//
#define originY 120
#import "PCBClickLabel.h"

@interface PCBClickLabel ()

@property (nonatomic, strong) UILabel *commonLabel;
@property (nonatomic, strong) UILabel *clickLabel;
@property (nonatomic, assign) CGRect commonLabelFrame;
@property (nonatomic, assign) CGRect clickLabelFrame;
@property (nonatomic, strong) NSString *clickLabStr;

@end

@implementation PCBClickLabel

- (instancetype)initLabelViewWithLab:(NSString *)text clickTextRange:(NSRange)clickTextRange clickAtion:(clickBlock)clickAtion{
    self = [super init];
    if (self) {
        // 变量
        NSString *clickText;
        NSString *commonText;
        NSString *commonText2;
        UILabel *commonLabel = [UILabel new];
        UILabel *clickLabel = [UILabel new];
        UILabel *commonLabel2 = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, 0, 0))];
        
        // 如果选择的范围文字是文尾的文字（计算文头，文中，文尾三种情况的宽度）
        // 选择的位置，加上选择的长度，等于整个字符串的长度
        if (clickTextRange.location + clickTextRange.length == text.length) {
            // substringWithRange: 从指定的范围内取字符串
            clickText = [text substringWithRange:clickTextRange];
            commonText = [text substringToIndex:clickTextRange.location];
            // label位置，计算点击label的位置和普通不点击label的位置
            commonLabel.frame = CGRectMake(0, 0, [[self class] calculateRowWidth:commonText], 30);
            clickLabel.frame = CGRectMake(commonLabel.frame.size.width+commonLabel.frame.origin.x, 0, [[self class] calculateRowWidth:clickText], 30);
        }else if (clickTextRange.location == 0){
            // 选择的范围文字是开头的
            // 此处的text长度为总长减去点击的范围
            clickText = [text substringWithRange:clickTextRange];
            commonText = [text substringWithRange:NSMakeRange(clickText.length, text.length-clickText.length)];
            
            // label的位置（计算label的宽度）
            clickLabel.frame = CGRectMake(0, 0, [[self class] calculateRowWidth:clickText], 30);
            commonLabel.frame = CGRectMake(clickLabel.frame.origin.x, 0, [[self class] calculateRowWidth:commonText], 30);
        }else{
            // 可点击文字在整段文字中间
            clickText = [text substringWithRange:clickTextRange];
            commonText = [text substringToIndex:clickTextRange.location];
            commonText2 = [text substringWithRange:NSMakeRange(clickTextRange.length+clickTextRange.location, text.length-clickText.length-commonText.length)];
            commonLabel2 = [UILabel new];
            // label的位置
            commonLabel.frame = CGRectMake(0, 0, [[self class] calculateRowWidth:commonText], 30);
            clickLabel.frame = CGRectMake(commonLabel.frame.size.width+commonLabel.frame.origin.x, 0, [[self class] calculateRowWidth:clickText], 30);
            commonLabel2.frame = CGRectMake(clickLabel.frame.size.width+clickLabel.frame.origin.x, 0, [[self class] calculateRowWidth:commonText2], 30);
            commonLabel2.text = commonText2;
            [self addSubview:commonLabel2];
        }
        
        commonLabel.text = commonText;
        clickLabel.text = clickText;
        clickLabel.textColor = [UIColor redColor];
        self.clickLabStr = clickText;
        clickLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labClick)];
        [clickLabel addGestureRecognizer:tap];
        
        self.backgroundColor = [UIColor yellowColor];
        self.frame = CGRectMake((screenWidth-(clickLabel.width+commonLabel.width+commonLabel2.width))/2, originY, [[self class] calculateRowWidth:text], 30);
        self.clickBlock = clickAtion;
        [self addSubview:commonLabel];
        [self addSubview:clickLabel];
    }
    return self;
}

+ (CGFloat)calculateRowWidth:(NSString *)string{
    // 指定字号
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    // 计算宽度时要确定高度
    CGRect rect = [string boundingRectWithSize:(CGSizeMake(0, 30)) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:dic context:nil];
    return rect.size.width;
}

- (void)labClick{
    NSLog(@"点击了“%@”",self.clickLabStr);
    self.clickBlock();
}

@end
