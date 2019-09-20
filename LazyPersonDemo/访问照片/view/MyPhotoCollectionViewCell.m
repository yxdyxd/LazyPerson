//
//  MyPhotoCollectionViewCell.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/16.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "MyPhotoCollectionViewCell.h"

#define allScreen [UIScreen mainScreen].bounds.size

@implementation MyPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建布局选择照片的UI图形
        [self createCellUI];
    }
    return self;
}

-(void)createCellUI{
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (allScreen.width - 25) / 4, (allScreen.width - 25) / 4)];
    
    _selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(_imageView.frame.size.width - 25, 0, 25, 25)];
    [_selectBtn setBackgroundImage:[UIImage imageNamed:@"ico_check_nomal"] forState:UIControlStateNormal];
    [_selectBtn setBackgroundImage:[UIImage imageNamed:@"ico_check_select"] forState:UIControlStateSelected];
    [_selectBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:_selectBtn];
    
    [self.contentView addSubview:_imageView];
}


-(void)getPhotoWithAsset:(PHAsset *)myAsset andWhichOne:(NSInteger)which{
    self.which = which;
    
    _selectBtn.tag = which;
    
    // PHImageRequestOptions：通过影响图片管理器，获取图片的一组选项
    PHImageRequestOptions *reques = [[PHImageRequestOptions alloc]init];
    reques.synchronous = NO;
    reques.networkAccessAllowed = NO;
    // PHImageRequestOptionsResizeModeExact
    // 保证与给定大小相等
    // 如果使用normalizedCropRect属性，则必须指定为该模式。
    reques.resizeMode = PHImageRequestOptionsResizeModeExact;
    reques.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    [[PHImageManager defaultManager] requestImageForAsset:myAsset targetSize:CGSizeMake(allScreen.width/4, allScreen.height/4) contentMode:PHImageContentModeAspectFill options:reques resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        
        if (result) {
            _imageView.image = result;
        }else{
            _imageView.image = [UIImage imageNamed:@"noimage"];
            
        }
        // 图片拉伸至图片的的宽度或者高度等于UIImageView的宽度或者高度为止
        // 看图片的宽高哪一边最接近UIImageView的宽高,
        // 一个属性相等后另一个就停止拉伸.
        // 简单来说，就是宽高其中的一个属性充满屏幕，就不再拉伸
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        // clipsToBounds：子视图的显示范围
        // YES：表示超出范围裁剪，NO：表示超出范围不裁剪
        _imageView.clipsToBounds = YES;
        // userInteractionEnabled: 当前视图是否能交互
        // 用户的触摸事件和键盘弹出等交互
        _imageView.userInteractionEnabled = YES;
    }];
}

// 把当前事件的btn传递出去
-(void)pressBtn:(UIButton *)button{
    if ([_delegate respondsToSelector:@selector(selectBtn:)]) {
        [_delegate selectBtn:button];
    }
}

@end
