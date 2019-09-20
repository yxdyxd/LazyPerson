//
//  JXAlertview.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/6.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomAlertDelegete <NSObject>

-(void)btnindex:(int)index :(int) tag;

@end
@interface JXAlertview : UIImageView <CAAnimationDelegate>
@property(nonatomic,retain)UILabel *title;
@property(nonatomic,retain)UILabel *message;
@property(nonatomic,retain)UIButton *cancelbtn;
@property(nonatomic,retain)UIButton *surebtn;
@property (nonatomic,retain) id<CustomAlertDelegete> delegate;
//-(void)dismmis1;
-(void)initwithtitle:(NSString *)str andmessage:(NSString *)str1 andcancelbtn:(NSString *)cancel andotherbtn:(NSString *)other;
-(void)show;
-(void)showview;
-(void)dismmis;
//-(void)dismmis;

@end
