//
//  PhotoDetailViewController.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/16.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^getSubmitDic)(NSMutableDictionary *submitDic);

@interface PhotoDetailViewController : UIViewController

@property(nonatomic,copy)PHFetchResult *PHFetchR;

@property(nonatomic,assign)NSInteger maxCount;

@property(nonatomic,copy)NSString *isOriginal;

@property(nonatomic,strong)NSDictionary *mySubmitDic;

@property(nonatomic,strong)NSDictionary *imageDic;

@property(nonatomic,copy)NSString *albumIdentifier;

@property(nonatomic,copy)getSubmitDic getSubmitDictionary;

@property(nonatomic,assign)NSInteger haveCount;

@property(nonatomic,assign)BOOL isNeed;

@property(nonatomic,strong)NSMutableArray *dataArr;

- (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize;

@end

NS_ASSUME_NONNULL_END
