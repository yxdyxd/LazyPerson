//
//  PhotoScrViewController.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/16.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^selectedBlock)(NSDictionary *newSelectDic);

typedef void (^isOriginalBlock)(NSString *isOriginalStr);

typedef void (^submitDicBlock)(NSMutableDictionary *submitDic);


@interface PhotoScrViewController : UIViewController

@property(nonatomic,copy)PHFetchResult *PHFetchR;

@property(nonatomic,copy)NSString *whichOne;

@property(nonatomic,strong)NSArray *lowQualityArr;

@property(nonatomic,strong)NSArray *selectedBtnArr;

@property(nonatomic,copy)selectedBlock selectedDicBlock;

@property(nonatomic,copy)isOriginalBlock OriginalBlock;

@property(nonatomic,strong)NSMutableDictionary *submitDic;

@property(nonatomic,strong)NSDictionary *lastDic;

@property(nonatomic,copy)NSString *albumIdentifier;

@property(nonatomic,copy)submitDicBlock getSubmitDic;


@property(nonatomic,assign)BOOL isNeed;

@property(nonatomic,assign)NSInteger maxCount;

@property(nonatomic,copy)NSString *isOriginal;

@end

NS_ASSUME_NONNULL_END
