//
//  CustomDatePicker.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/8.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomDatePicker : UIView <UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic)int year;
@property(nonatomic)int month;
@property(nonatomic)int day;

@end

NS_ASSUME_NONNULL_END
