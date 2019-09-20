//
//  DatePickerViewController.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/8.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DatePickerViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *tf_text;

@end

NS_ASSUME_NONNULL_END
