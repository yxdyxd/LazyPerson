//
//  ViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/26.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "ViewController.h"
#import "ImportHeader.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *baseScrollview;
// 动态添加属性
@property (nonatomic, strong) UIButton *runtimeBtn;
// 版本更新
@property (nonatomic, strong) UIButton *versionUpdateBtn;
// 保存信息
@property (nonatomic, strong) UIButton *saveInfoBtn;
// 弹簧动画
@property (nonatomic, strong) UIButton *springBtn;
// 视频播放
@property (nonatomic, strong) UIButton *videoBtn;
// 点击label上文字
@property (nonatomic, strong) UIButton *labelClickBtn;
// 日期选择器
@property (nonatomic, strong) UIButton *dateBtn;
// 直播点赞效果
@property (nonatomic, strong) UIButton *clickHeartBtn;
// 从相册中选择照片
@property (nonatomic, strong) UIButton *showPicBtn;
// 滑竿转动动画
@property (nonatomic, strong) UIButton *sliderBtn;
// 文字轮
@property (nonatomic, strong) UIButton *rollLabelBtn;
// 简仿简书
@property (nonatomic, strong) UIButton *jianBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUI];
}

#pragma mark -  布局UI
- (void)setUI{
    
    // 设置底部的scrollview
    self.baseScrollview = [[UIScrollView alloc]init];
    
    self.baseScrollview.frame = CGRectMake(0, Statusbar+Navigationbar, screenWidth, screenHeight);
    self.baseScrollview.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.baseScrollview];
    
    // runtime动态添加属性
    self.runtimeBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, 20, screenWidth - 100*ScaleSize, 45)) title:@"动态添加属性" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(runtimeClick) alpha:1];
    
    self.versionUpdateBtn = [self addBtnWithframe:CGRectMake(50*ScaleSize, self.runtimeBtn.bottom + 10, screenWidth - 100*ScaleSize, 45) title:@"版本更新提醒" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(updateClick) alpha:1];
    // 复习下masonry的用法
//    [self.versionUpdateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.runtimeBtn.mas_bottom).offset(10);
//        make.left.offset(50*ScaleSize);
//        make.width.mas_equalTo(screenWidth - 100*ScaleSize);
//        make.height.mas_equalTo(45*ScaleSize);
//    }];
    
    self.saveInfoBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.versionUpdateBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"保存个人信息" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(saveInfoClick) alpha:1];
    
    self.springBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.saveInfoBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"果冻弹簧效果" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(springBtnClick) alpha:1];
    
    self.videoBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.springBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"视频播放" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(videoBtnClick) alpha:1];
    
    self.labelClickBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.videoBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"点击Label文字" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(labelBtnClick) alpha:1];
    
    self.dateBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.labelClickBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"日期选择器" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(dateBtnClick) alpha:1];
    
    self.clickHeartBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.dateBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"直播点赞效果" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(heartBtnClick) alpha:1];
    
    self.showPicBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.clickHeartBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"选择照片" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(showPicBtnClick) alpha:1];
    
    self.sliderBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.showPicBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"滑竿转动动画" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(sliderBtnClick) alpha:1];
    
    self.rollLabelBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.sliderBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"文字轮" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(rollBtnClick) alpha:1];
    
    self.jianBtn = [self addBtnWithframe:(CGRectMake(50*ScaleSize, self.rollLabelBtn.bottom + 10, screenWidth - 100*ScaleSize, 45*ScaleSize)) title:@"简仿简书" backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:3 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self.baseScrollview target:self action:@selector(jianBtnClick) alpha:1];
    
    [self updateTheScorllviewFrame];
}

- (void)jianBtnClick {
    JianBookViewController *jianVC = [[JianBookViewController alloc] init];
    [self.navigationController pushViewController:jianVC animated:NO];
}

- (void)rollBtnClick {
    RollViewController *rollVC = [[RollViewController alloc]init];
    [self presentViewController:rollVC animated:NO completion:nil];
}

- (void)sliderBtnClick{
    SliderViewController *sliderVC = [[SliderViewController alloc]init];
    [self.navigationController pushViewController:sliderVC animated:NO];
}

- (void)showPicBtnClick{
    ShowPhotoViewController *picVC = [[ShowPhotoViewController alloc]init];
    [self.navigationController pushViewController:picVC animated:NO];
}

- (void)heartBtnClick{
    ClickHeartViewController *heartVC = [[ClickHeartViewController alloc]init];
    [self.navigationController pushViewController:heartVC animated:NO];
}

- (void)dateBtnClick{
    DatePickerViewController *dateVC = [[DatePickerViewController alloc]init];
    [self.navigationController pushViewController:dateVC animated:NO];
}

- (void)labelBtnClick{
    LabelStrClickViewController *labVC = [[LabelStrClickViewController alloc]init];
    [self.navigationController pushViewController:labVC animated:NO];
}

- (void)videoBtnClick{
    ShowVideoViewController *videoVC = [[ShowVideoViewController alloc]init];
    [self.navigationController pushViewController:videoVC animated:NO];
}

- (void)springBtnClick
{
    SpringViewController *springVC = [[SpringViewController alloc]init];
    [self.navigationController pushViewController:springVC animated:NO];
}

- (void)saveInfoClick{
    SaveInfoViewController *saveVC = [[SaveInfoViewController alloc]init];
    [self.navigationController pushViewController:saveVC animated:NO];
}

- (void)updateClick{
    VersionUpdateViewController *versionVC = [[VersionUpdateViewController alloc]init];
    [self.navigationController pushViewController:versionVC animated:NO];
}

- (void)runtimeClick{
    RuntimeAddProViewController *runVC = [[RuntimeAddProViewController alloc]init];
    [self.navigationController pushViewController:runVC animated:NO];
}

#pragma mark -  重新设置scrollview视图的大小
- (void)updateTheScorllviewFrame{
    
    NSMutableArray *viewArr = [NSMutableArray array];
    for(UIView *subview in self.baseScrollview.subviews)
    {
        [viewArr addObject:subview];
    }
    UIButton *btn1 = [viewArr lastObject];
    // 判断最后一个控件是否超出手机屏幕然后，对scrollview大小重新设置
    if ((btn1.bottom + 20) > screenHeight) {
        self.baseScrollview.frame = CGRectMake(0, Statusbar+Navigationbar, screenWidth, btn1.bottom);
    }
}

#pragma mark - 设置Button
- (UIButton *)addBtnWithframe:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius masksToBounds:(BOOL)masksToBounds titleFont:(CGFloat)titleFont addView:(UIView *)view target:(id)target action:(SEL)action alpha:(CGFloat)alpha
{
    UIButton *btn = [[UIButton alloc] init];
    
    btn.frame = frame;
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    
    btn.backgroundColor = backgroundColor;
    
    btn.alpha = alpha;
    
    btn.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    btn.layer.borderWidth = borderWidth;
    btn.layer.borderColor = borderColor.CGColor;
    btn.layer.cornerRadius = cornerRadius;
    btn.layer.masksToBounds = masksToBounds;
    
    [view addSubview:btn];
    
    return btn;
}

@end
