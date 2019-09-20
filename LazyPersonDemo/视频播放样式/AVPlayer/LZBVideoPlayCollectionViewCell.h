//
//  LZBVideoPlayCollectionViewCell.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/4.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LZBVideoPlayCollectionViewCellCloseClickBlock)();

NS_ASSUME_NONNULL_BEGIN

@interface LZBVideoPlayCollectionViewCell : UICollectionViewCell

/**
 videoPath
 */
@property (nonatomic, strong) NSString *videoPath;
@property (nonatomic, strong) NSIndexPath *indexPath;

// 点击关闭按钮
@property (nonatomic, copy) LZBVideoPlayCollectionViewCellCloseClickBlock closeClick;
-(void)setCloseClick:(LZBVideoPlayCollectionViewCellCloseClickBlock)closeClick;

// 刷新时间数据
- (void)reloadTimeLabelWithTime:(NSInteger)time;

@end

NS_ASSUME_NONNULL_END
