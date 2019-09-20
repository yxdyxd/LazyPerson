//
//  YLButton.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/27.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 1.判断当前的视图大小是否为空，CGRectIsEmpty
 */

NS_ASSUME_NONNULL_BEGIN

@interface YLButton : UIButton

@property (nonatomic, assign) CGRect titleRect;
@property (nonatomic, assign) CGRect imageRect;

@end

NS_ASSUME_NONNULL_END
