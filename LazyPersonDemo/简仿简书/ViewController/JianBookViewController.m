//
//  JianBookViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/9/5.
//  Copyright © 2019 火眼征信. All rights reserved.
//

#import "JianBookViewController.h"
#import "TableHeaderView.h"
#import "TableSectionView.h"
#import "FirstTableView.h"
#import "SecondTableView.h"
#import "ThirdTableView.h"
#define kHeaderImgWidth 60

#define kSectionHeight 30

@interface JianBookViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *headerView;
@property (nonatomic, strong) UIScrollView *contentView;
@property (nonatomic, strong) NSArray *titleArr;

@end
static NSString * const CELLINENTIFIER = @"CELLINENTIFIER";
@implementation JianBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.titleArr = @[@"动态", @"文章", @"更多"];
    
    UITableView *bTableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, screenWidth, screenHeight)) style:(UITableViewStylePlain)];
    bTableV.tableHeaderView = [[TableHeaderView alloc]initWithFrame:(CGRectMake(0, 0, screenWidth, 180))];
    bTableV.dataSource = self;
    bTableV.delegate = self;
    
    [self.view addSubview:bTableV];
    
    _contentView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    _contentView.contentSize = CGSizeMake(screenWidth * 3, 0);
    // contentOffset:是frame顶点相对于scrollview当前显示区域顶点的偏移量
    _contentView.contentOffset = CGPointMake(0, 0);
    // pagingEnabled移动指定偏移
    _contentView.pagingEnabled = YES;
    _contentView.delegate = self;
    
    [self layoutTableViews];
    [self configNavigatonTitleView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableSectionView *sectionView = [[TableSectionView alloc]initWithTitleArr:_titleArr sectionHeight:kSectionHeight];
    sectionView.clickBlock = ^(NSInteger btnTag) {
        [self.contentView setContentOffset:(CGPointMake((btnTag - 100)*screenWidth, 0)) animated:YES];
    };
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return screenHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kSectionHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLINENTIFIER];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CELLINENTIFIER];
        [cell.contentView addSubview:self.contentView];
    }
    return cell;
}

#pragma mark -  UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.contentView) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SCROLLEDNOTIFICATION" object:scrollView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.contentView) {
        
    }else if ([scrollView isKindOfClass:[UITableView class]]){
        float temp = scrollView.contentOffset.y;
        float scale_t = 1.f;
        if (temp >= -64.f && temp <= -30.f) {
            
        }else if (temp < -64.f){
            temp = -64.f;
        }else{
            temp = -30.f;
        }
        // fabsf: 取绝对值
        scale_t = fabsf(temp / 64);
        [self scaleAcimationWithScale:scale_t translate:(-temp-64) / 64 * 60];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    [self scaleAcimationWithScale:1.f translate:0];
}

- (void)layoutTableViews {
    for (int i = 0; i < _titleArr.count; i++) {
        UITableView *tableView;
        switch (i) {
            case 0:{
                tableView = [[FirstTableView alloc]initWithFrame:(CGRectMake(i * screenWidth, 0, screenWidth, screenHeight))];
            }
                break;
                
            case 1:{
                tableView = [[SecondTableView alloc]initWithFrame:(CGRectMake(i * screenWidth, 0, screenWidth, screenHeight))];
            }
                break;
                
            case 2:{
                tableView = [[ThirdTableView alloc]initWithFrame:(CGRectMake(i * screenWidth, 0, screenWidth, screenHeight))];
            }
                break;
                
            default:{
                tableView = [UITableView new];
            }
                break;
        }
        [_contentView addSubview:tableView];
    }
}

- (void)configNavigatonTitleView {
    UIView *titleBackV = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, kHeaderImgWidth, 64+kHeaderImgWidth/2.f))];
    
    self.headerView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, titleBackV.frame.size.height-kHeaderImgWidth, kHeaderImgWidth, kHeaderImgWidth))];
    _headerView.image = [UIImage imageNamed:@"header.JPG"];
    _headerView.layer.cornerRadius = kHeaderImgWidth/2.f;
    _headerView.layer.masksToBounds = YES;
    [titleBackV addSubview:_headerView];
    
    self.navigationItem.titleView = titleBackV;
}

- (void)scaleAcimationWithScale:(CGFloat)scale_t translate:(CGFloat)translate {
    CGAffineTransform t = CGAffineTransformMakeScale(scale_t, scale_t);
    t = CGAffineTransformTranslate(t, 0, translate);
    self.headerView.transform = t;
}


@end
