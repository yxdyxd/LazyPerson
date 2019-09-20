//
//  BIgImageCollectionViewCell.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/10.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface BIgImageCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

- (void)getBigImageWithAsset:(PHAsset *)asset;

@end

NS_ASSUME_NONNULL_END
