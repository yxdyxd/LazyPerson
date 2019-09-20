//
//  DatePickerViewController.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/8.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "DatePickerViewController.h"
#import "JXAlertview.h"
#import "CustomDatePicker.h"

@interface DatePickerViewController () <CustomAlertDelegete>

{
    CustomDatePicker *Dpicker;
}

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    Dpicker = [[CustomDatePicker alloc]initWithFrame:(CGRectMake(0, 20, screenWidth - 20, 200))];
    
    _tf_text = [[UITextField alloc]init];
    _tf_text.frame = CGRectMake(30, 100, screenWidth - 60, 40);
    _tf_text.placeholder = @"展示日期选择器";
    _tf_text.textAlignment = NSTextAlignmentCenter;
    _tf_text.layer.borderWidth = 2;
    _tf_text.layer.borderColor = [UIColor blackColor].CGColor;
    _tf_text.layer.cornerRadius = 10;
    _tf_text.delegate = self;
    [self.view addSubview:_tf_text];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    JXAlertview *alert = [[JXAlertview alloc] initWithFrame:CGRectMake(10, (self.view.frame.size.height-260)/2, self.view.frame.size.width-20, 260)];
    //alert.image = [UIImage imageNamed:@"dikuang"];
    alert.delegate = self;
    [alert initwithtitle:@"请选择日期" andmessage:@"" andcancelbtn:@"取消" andotherbtn:@"确定"];
    
    //我把Dpicker添加到一个弹出框上展现出来 当然大家还是可以以任何其他动画形式展现
    [alert addSubview:Dpicker];
    [alert show];
    return NO;
}

-(void)btnindex:(int)index :(int)tag
{
    if (index == 2) {
        self.tf_text.text = [NSString stringWithFormat:@"%d年%d月%d日",Dpicker.year,Dpicker.month,Dpicker.day];
        [self.tf_text resignFirstResponder];
    }
}

@end
