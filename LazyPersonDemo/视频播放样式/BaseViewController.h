//
//  BaseViewController.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/3.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong) NSString *videoPath;

- (void)playerButtonClick:(UIButton *)playButton;

@end

NS_ASSUME_NONNULL_END
