//
//  UIAlertController+NewVersion.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/28.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "UIAlertController+NewVersion.h"
#define OLDVERSION [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"]
#define APPID  @"111111111"

@implementation UIAlertController (NewVersion)

+ (BOOL)checkVersionUpdateOldVersion:(NSString *)oldVersion andCurrentOldVersion:(NSString *)currentoldVersion{
    
    BOOL index = NO;
    if ([oldVersion compare:currentoldVersion options:NSNumericSearch] == NSOrderedAscending || NSOrderedSame) {
        index = NO;
    }else{
        index = YES;
    }
    return index;
}

+ (void)alertContorllerWithCurrentVersion:(NSString *)version andTitle:(NSString *)title andController:(UIViewController *)controller{
    BOOL index = [self checkVersionUpdateOldVersion:OLDVERSION andCurrentOldVersion:version];
    
    if (index) {
        return;
    }else{
        UIAlertController *alertController = [self alertControllerWithTitle:@"版本升级" message:[NSString stringWithFormat:@"最新版本：%@\n%@", version, title] preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"暂不升级" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"去升级" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            // 去AppStore下载
            NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/%@",APPID];
            NSURL *url = [NSURL URLWithString:urlStr];
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                NSLog(@"打开了网址");
            }];
            
            
        }];
        
        [alertController addAction:action];
        [alertController addAction:action1];
        
        [controller presentViewController:alertController animated:YES completion:nil];
    }
}

@end
