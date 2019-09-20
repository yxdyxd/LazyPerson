//
//  RuntimeAddProViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/27.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "RuntimeAddProViewController.h"
#import "YLButton.h"
#import "UIButton+Layout.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface RuntimeAddProViewController ()

@property (nonatomic, strong) YLButton *xibBtn;
@property (nonatomic, strong) YLButton *titleInsideImage;
@property (nonatomic, strong) UIButton *orignalBtn;

@end

@implementation RuntimeAddProViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        _xibBtn = [YLButton buttonWithType:(UIButtonTypeCustom)];
        _xibBtn.frame = CGRectMake(50, 100, 100, 120);
        [_xibBtn setImage:[UIImage imageNamed:@"175x175"] forState:(UIControlStateNormal)];
        [_xibBtn addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
        _xibBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:242/255.0 blue:210/255.0 alpha:1];
        [_xibBtn setTitle:@"文上图下" forState:(UIControlStateNormal)];
        [_xibBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [self.view addSubview:_xibBtn];
        _xibBtn.imageRect = CGRectMake(10, 10, 80, 80);
        _xibBtn.titleRect = CGRectMake(0, 90, 100, 20);
        _xibBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    {
        _orignalBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _orignalBtn.frame = CGRectMake(SCREEN_WIDTH - 150, 100, 100, 120);
        [_orignalBtn setImage:[UIImage imageNamed:@"175x175"] forState:(UIControlStateNormal)];
        [_orignalBtn addTarget:self action:@selector(orignalBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        _orignalBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:242/255.0 blue:210/255.0 alpha:1];
        _orignalBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _orignalBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_orignalBtn setTitle:@"原始文上图下" forState:(UIControlStateNormal)];
        [_orignalBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        // 动态添加btn的属性，布局image和label的位置
        _orignalBtn.imageRect = CGRectMake(10, 30, 80, 80);
        _orignalBtn.titleRect = CGRectMake(0, 10, 100, 20);
        [self.view addSubview:_orignalBtn];
    }
    
    {
        _titleInsideImage.imageRect = _titleInsideImage.bounds;
        _titleInsideImage.titleRect = CGRectMake(0, 50, 120, 20);
        _titleInsideImage.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    {
        YLButton *searchBtn = [YLButton buttonWithType:(UIButtonTypeCustom)];
        [searchBtn setImage:[UIImage imageNamed:@"search"] forState:(UIControlStateNormal)];
        [searchBtn setTitle:@"搜索按钮图片在左边" forState:(UIControlStateNormal)];
        searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [searchBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [searchBtn setTitleColor:[UIColor orangeColor] forState:(UIControlStateHighlighted)];
        searchBtn.imageRect = CGRectMake(10, 10, 20, 20);
        searchBtn.titleRect = CGRectMake(35, 10, 120, 20);
        [self.view addSubview:searchBtn];
        searchBtn.frame = CGRectMake(SCREEN_WIDTH * 0.5 - 80, 250, 160, 40);
        searchBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:242/255.0 blue:210/255.0 alpha:1];
    }
    
    // 左右结构，图片在左边，文字在右边
    {
        YLButton *cancleBtn = [YLButton buttonWithType:(UIButtonTypeCustom)];
        [cancleBtn setImage:[UIImage imageNamed:@"cancel"] forState:(UIControlStateNormal)];
        [cancleBtn setTitle:@"取消按钮在图片右边" forState:(UIControlStateNormal)];
        cancleBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [cancleBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [cancleBtn setTitleColor:[UIColor orangeColor] forState:(UIControlStateHighlighted)];
        cancleBtn.titleRect = CGRectMake(10, 10, 120, 20);
        cancleBtn.imageRect = CGRectMake(135, 10, 20, 20);
        [self.view addSubview:cancleBtn];
        cancleBtn.frame = CGRectMake(SCREEN_WIDTH * 0.5 - 80, 350, 160, 40);
        cancleBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:242/255.0 blue:210/255.0 alpha:1];
    }
}

- (void)click:(UIButton *)sender{
    if ([sender.currentTitle isEqualToString:@"文下图上"]) {
        _xibBtn.imageRect = CGRectMake(10, 30, 80, 80);
        _xibBtn.titleRect = CGRectMake(0, 10, 100, 20);
        [_xibBtn setTitle:@"文上图下" forState:(UIControlStateNormal)];
    }else{
        _xibBtn.imageRect = CGRectMake(10, 10, 80, 80);
        _xibBtn.titleRect = CGRectMake(0, 90, 100, 20);
        [_xibBtn setTitle:@"文下图上" forState:(UIControlStateNormal)];
    }
}

- (void)orignalBtnClick:(UIButton *)sender{
    if ([sender.currentTitle isEqualToString:@"原始文下图上"]) {
        _orignalBtn.imageRect = CGRectMake(10, 30, 80, 80);
        _orignalBtn.titleRect = CGRectMake(0, 10, 100, 20);
        [_orignalBtn setTitle:@"原始文上图下" forState:(UIControlStateNormal)];
    }else{
        _orignalBtn.imageRect = CGRectMake(10, 10, 80, 80);
        _orignalBtn.titleRect = CGRectMake(0, 90, 100, 20);
        [_orignalBtn setTitle:@"原始文下图上" forState:(UIControlStateNormal)];
    }
}


@end
