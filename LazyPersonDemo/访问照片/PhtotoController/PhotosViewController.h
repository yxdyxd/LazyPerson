//
//  PhotosViewController.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/16.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 返回当前选择的照片数组
typedef void (^photoArrBlock)(NSMutableDictionary *selecedDic);

@interface PhotosViewController : UIViewController

@property (nonatomic, strong) NSDictionary *imageDic;

@property (nonatomic, copy) NSString *maxCountStr;

@property (nonatomic, copy) NSString *isHaveOriginal;

@property (nonatomic, copy) photoArrBlock getSubmitDic;

-(instancetype)initWithMaxCount:(NSString *)maxCount andIsHaveOriginal:(NSString *)haveOriginal andOldImageDic:(NSDictionary *)oldImageDic andIfGetImageArr:(BOOL)ifNeedImageArr;

@end

NS_ASSUME_NONNULL_END
