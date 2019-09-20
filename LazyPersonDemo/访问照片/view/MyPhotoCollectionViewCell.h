//
//  MyPhotoCollectionViewCell.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/16.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@protocol selectDelegate <NSObject>

-(void)selectBtn:(UIButton *)sender;

@end

@interface MyPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *selectBtn;

@property (nonatomic, assign) NSInteger which;

@property (nonatomic, strong) UIImageView *__block imageView;

@property (nonatomic, assign) id<selectDelegate> delegate;

// 获取照片
- (void)getPhotoWithAsset:(PHAsset *)myAsset andWhichOne:(NSInteger)which;

@end

NS_ASSUME_NONNULL_END
