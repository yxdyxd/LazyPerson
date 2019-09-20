//
//  UIAlertController+NewVersion.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/28.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (NewVersion)

+ (void)alertContorllerWithCurrentVersion:(NSString *)version andTitle:(NSString *)title andController:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
