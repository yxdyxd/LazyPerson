//
//  BIgImageCollectionViewCell.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/10.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "BIgImageCollectionViewCell.h"

@implementation BIgImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCellUI];
    }
    return self;
}

- (void)createCellUI{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    _imageView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, screenWidth, screenHeight))];
    // self.contentView：上边的子视图会跟随contentView移动而移动
    [self.contentView addSubview:_imageView];
}

- (void)getBigImageWithAsset:(PHAsset *)asset{
    // PHImageRequestOptions:
    // 能够影响通过图片管理器获得的资源的静态图像的一组选项
    PHImageRequestOptions *reques = [[PHImageRequestOptions alloc]init];
    // synchronous: 控制是否为同步请求
    reques.synchronous = NO;
    // networkAccessAllowed: 参数控制是否允许网络请求
    reques.networkAccessAllowed = NO;
    // resizeMode: 属性控制图像的剪裁
    // PHImageRequestOptionsResizeModeExact:
    // 返回图像必须和目标大小相匹配，并且图像质量也为高质量图像
    reques.resizeMode = PHImageRequestOptionsResizeModeExact;
    // deliveryMode: 则用于控制请求的图片质量
    // PHImageRequestOptionsDeliveryModeOpportunistic:
    // 客户端可能在调用异步时得到多个图像结果，或者在调用同步时得到一个结果
    reques.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    // PHImageManager:
    // 提供获取或生成预览缩略图和全尺寸图片，或者视频数据的方法。
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:(CGSizeMake(screenWidth/4, screenHeight/4)) contentMode:(PHImageContentModeAspectFit) options:reques resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        if (result) {
            _imageView.image = result;
        }else{
            _imageView.image = [UIImage imageNamed:@"noimage"];
        }
        
        /*
         //图片拉伸填充至整个UIImageView(图片可能会变形),这也是默认的属性,
         如果什么都不设置就是它在起作用
         UIViewContentModeScaleToFill
         
         //图片拉伸至完全显示在UIImageView里面为止(图片不会变形)
         UIViewContentModeScaleAspectFit
         
         //图片拉伸至图片的的宽度或者高度等于
          UIImageView的宽度或者高度为止
         
         看图片的宽高哪一边最接近UIImageView的宽
         高,一个属性相等后另一个就停止拉伸.
         UIViewContentModeScaleAspectFill
         */
        //图片拉伸至完全显示在UIImageView里面为止(图片不会变形)
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = YES;
        _imageView.userInteractionEnabled = YES;
    }];
}





























@end
