//
//  TableSectionView.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/9/5.
//  Copyright © 2019 火眼征信. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 分区头
@interface TableSectionView : UIView
@property (nonatomic, copy) void(^clickBlock)(NSInteger btnTag);

- (instancetype)initWithTitleArr:(NSArray<NSString *> *)titleArr sectionHeight:(CGFloat)sectionHeight;
@end

NS_ASSUME_NONNULL_END
