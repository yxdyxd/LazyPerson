//
//  SaveInfoView.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/6/28.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "SaveInfoView.h"
#import <objc/runtime.h>
#import "Person.h"
//#import "YLButton.h"
#import "UIButton+Layout.h"

@interface SaveInfoView () <NSSecureCoding>

@property (nonatomic, strong) UITextField *tf1;
@property (nonatomic, strong) UITextField *tf2;
@property (nonatomic, strong) UITextField *tf3;
@property (nonatomic, strong) UITextField *tf4;
@property (nonatomic, strong) UITextField *tf5;

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) NSInteger tel;
@property (nonatomic, copy)   NSString *youxiang;
@property (nonatomic, copy)   NSString *sex;
@property (nonatomic, copy)   NSString *position;
// 在对NSMutableArray使用修饰符copy是会使对象变为NSArray，变为不可变数组
// 所以使用strong修饰符，来保证属性不会被修改
@property (nonatomic, strong) NSMutableArray *labelArr;
@property (nonatomic, strong) NSMutableArray *textFieldArr;

/** 校验数据*/
@property (strong, nonatomic) NSData *archivedData;

@end

@implementation SaveInfoView

/*
 1.iOS中的instancetype具备检测对象类型功能，会在编译期间对非本函数的
 对象进行警告⚠️，而id类型就比较随意了，可以泛指所以的类，不会进行报警
 2.instancetype只能作为函数的返回值，不能用来定义变量
 3.用instancetype作为函数返回值返回的是在函数所在的类型
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 布局界面
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    // label的名称
    NSArray *nameArr = @[@"姓名", @"电话", @"邮箱", @"性别", @"住址"];
    // 创建的label数组
    self.labelArr = [NSMutableArray array];
    // 创建的textfield数组
    self.textFieldArr = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        // 创建label
        UILabel *label = [self setLabelWithFrame:(CGRectMake(20*ScaleSize, (30+55*i)*ScaleSize, 50*ScaleSize, 45*ScaleSize)) text:[NSString stringWithFormat:@"%@", nameArr[i]] font:[UIFont systemFontOfSize:15] backgroundColor:[UIColor whiteColor] type:( NSTextAlignmentCenter) addView:self];
        label.layer.borderWidth = 2;
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.layer.cornerRadius = 10;
        label.layer.masksToBounds = YES;
        
        [self.labelArr addObject:label];
        
        // 创建textfield
        UITextField *textField = [self setTextFieldWithFrame:(CGRectMake(80*ScaleSize, (30+55*i)*ScaleSize, screenWidth - 100*ScaleSize, 45*ScaleSize)) backgroundColor:[UIColor whiteColor] borderWidth:2 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES cleaeMode:(UITextFieldViewModeWhileEditing) textColor:[UIColor blackColor] placeHolder:@"" textFont:15 secureEntry:NO leftDistance:10 addView:self];
        
        [self.textFieldArr addObject:textField];
    }
    
    // btn的标题
    NSArray *btnName = @[@"列表保存", @"列表加载", @"归档保存", @"归档加载"];
    // 创建btn
    for (int i = 0; i < 4; i++) {
        UILabel *labelA = self.labelArr[4];
        UIButton *btn = [self addBtnWithframe:(CGRectMake((screenWidth - 220*ScaleSize)*(i%2) + 70*ScaleSize, labelA.bottom + 40*ScaleSize + 80*ScaleSize*(i/2), 80*ScaleSize, 60*ScaleSize)) title:[NSString stringWithFormat:@"%@", btnName[i]] backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] borderWidth:2 borderColor:[UIColor blackColor] cornerRadius:10 masksToBounds:YES titleFont:15 addView:self target:self action:@selector(btnClick:) alpha:1];
        // 通过runtime给btn动态的添加属性，来设置
//        btn.titleRect = CGRectMake(0, 0, 60, 40);
//        [btn setImage:[UIImage imageNamed:@"11"] forState:(UIControlStateNormal)];
//        btn.imageRect = CGRectMake(10, 10, 60, 40);
        // 设置btn下角标，通过下标来表示某个btn
        btn.tag = i;
    }
    
//    NSLog(@"11 == %@, 22 == %@", self.labelArr, self.textFieldArr);
}

/*
 switch...case中只能使用，整型数字来代表判断
 在每个判断之后加上break，来结束本段代码
 在一个case语句中使用{}，括起来否则会报错
 */
- (void)btnClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 0:
        {NSLog(@"点击了列表保存")
            // 保存数据(先取到textfield中的数据)
            NSMutableArray *array = [NSMutableArray array];
            for (int i = 0; i < 5; i++) {
                UITextField *text1 = self.textFieldArr[i];
                [array addObject:text1.text];
            }
            NSLog(@"输入框中的数据为：%@", array);
            NSString *str = [NSHomeDirectory() stringByAppendingString:@"/Documents/person.plist"];
            [array writeToFile:str atomically:YES];
            break;
            
        }
        case 1:
        {
            NSLog(@"点击了列表加载")
            // 加载列表保存的数据
            NSString *str = [NSHomeDirectory() stringByAppendingString:@"/Documents/person.plist"];
            NSArray *array = [NSArray arrayWithContentsOfFile:str];
            // 取数据赋值给输入框
            for (int i = 0; i < 5; i++) {
                UITextField *textA = self.textFieldArr[i];
                textA.text = array[i];
            }
            break;
        }
        case 2:
        {
            NSLog(@"点击了归档保存")
            // 在归档的存取之前，需要对每个属性进行编码和解码获取相应的值
            Person *per = [[Person alloc]init];
            NSMutableArray *array = [NSMutableArray array];
            for (int i = 0; i < 5; i++) {
                UITextField *textA = self.textFieldArr[i];
                [array addObject:textA.text];
            }
            per.name = array[0];
            per.youxiang = array[2];
            per.tel = [array[1] integerValue];
            per.sex = array[3];
            per.position = array[4];
            
            // 使用requiringSecureCoding归档数据
            //1.对需要保存的数据进行编码 ->NSdata *
            self.archivedData = [NSKeyedArchiver archivedDataWithRootObject:per requiringSecureCoding:YES error:nil];
            
            //2.将二进制数据保存到文件
            //创建文件
            NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/guidang.zhengmengxin"];
            //创建文件
            [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
            [self.archivedData writeToFile:path atomically:YES];
            
            
            // 归档数据(使用initForWritingWithMutableData)
//            NSMutableData *data = [[NSMutableData alloc]init];
//            NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//
//            [archive encodeObject:per forKey:@"me"];
//
//            // 结束归档
//            [archive finishEncoding];
//
//            // 将归档数据写入磁盘
//            NSString *str = [NSHomeDirectory() stringByAppendingString:@"/Documents/guidang.zhengmengxin"];
//            [data writeToFile:str atomically:YES];
//            NSLog(@"123321: %@", str);
            break;
        }
        case 3:
        {
            NSLog(@"点击了归档加载")
            
            //使用解档
            //获取文件路径(有时候路径会影响正常的存取操作)
            NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/guidang.zhengmengxin"];
            //读取文件的内容
            NSData *data = [NSData dataWithContentsOfFile:path];
            //将二进制数据转化为对应的对象类型
            Person *vc = [NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:data error:nil];
            
            NSMutableArray *array = [NSMutableArray array];
            [array addObject:vc.name];
            [array addObject:[NSString stringWithFormat:@"%ld",vc.tel]];
            [array addObject:vc.youxiang];
            [array addObject:vc.sex];
            [array addObject:vc.position];
            for (int i = 0; i < 5; i++) {
                UITextField *textA = self.textFieldArr[i];
                textA.text = array[i];
            }
            
            // 使用initForReadingWithData解档
//            NSString *str = [NSHomeDirectory() stringByAppendingString:@"/Documents/guidang.zhengmengxin"];
//            NSData *data = [NSData dataWithContentsOfFile:str];
//
//            NSKeyedUnarchiver *unarchive = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
//
//            // 解档数据
//            SaveInfoView *vc = [unarchive decodeObjectForKey:@"me"];
//            [unarchive finishDecoding];
//            NSMutableArray *array = [NSMutableArray array];
//            [array addObject:vc.name];
//            [array addObject:[NSString stringWithFormat:@"%ld",vc.tel]];
//            [array addObject:vc.youxiang];
//            [array addObject:vc.sex];
//            [array addObject:vc.position];
//            for (int i = 0; i < 5; i++) {
//                UITextField *textA = self.textFieldArr[i];
//                textA.text = array[i];
//            }
            
            break;
        }
        default:
            break;
    }
    
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    
    [aCoder encodeObject: [NSNumber numberWithInteger:self.tel] forKey:@"tel"];
    
    [aCoder encodeObject:self.youxiang forKey:@"youxiang"];
    
    [aCoder encodeObject:self.sex forKey:@"sex"];
    
    [aCoder encodeObject:self.position forKey:@"position"];
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//
//        self.tel = [[aDecoder decodeObjectForKey:@"tel"] integerValue];
//
//        self.youxiang = [aDecoder decodeObjectForKey:@"youxiang"];
//
//        self.sex = [aDecoder decodeObjectForKey:@"sex"];
//
//        self.position = [aDecoder decodeObjectForKey:@"position"];
        
        self.name = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"name"];
        self.tel = [aDecoder decodeIntegerForKey:@"tel"];
        self.youxiang = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"youxiang"];
        self.sex = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"sex"];
        self.position = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"position"];
        
    }
    return self;
    
}
/**
 支持加密编码
 */
+ (BOOL)supportsSecureCoding{
    return YES;
}

#pragma mark - 设置Button
- (UIButton *)addBtnWithframe:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius masksToBounds:(BOOL)masksToBounds titleFont:(CGFloat)titleFont addView:(UIView *)view target:(id)target action:(SEL)action alpha:(CGFloat)alpha
{
    UIButton *btn = [[UIButton alloc] init];
    
    btn.frame = frame;
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    
    btn.backgroundColor = backgroundColor;
    
    btn.alpha = alpha;
    
    btn.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitleColor:titleColor forState:(UIControlStateNormal)];
    btn.layer.borderWidth = borderWidth;
    btn.layer.borderColor = borderColor.CGColor;
    btn.layer.cornerRadius = cornerRadius;
    btn.layer.masksToBounds = masksToBounds;
    
    [view addSubview:btn];
    
    return btn;
}

#pragma mark - 设置label
- (UILabel *)setLabelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font backgroundColor:(UIColor *)color type:(enum NSTextAlignment)type addView:(UIView *)view
{
    UILabel *label = [[UILabel alloc]init];
    label.adjustsFontSizeToFitWidth = YES;
    label.frame = frame;
    label.text = text;
    label.font = font;
    label.backgroundColor = color;
    label.textAlignment = type;
    [view addSubview:label];
    
    return label;
}

#pragma mark - 设置TextFile
/**
 textField创建
 
 @param frame 大小
 @param color 背景颜色
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @param cornerRadius 边角弧度
 @param masksToBounds 是否切角
 @param clearmode 是否显示右边的叉号
 @param textcolor 输入的字体颜色
 @param placeholder 初始提示
 @param textfont 输入字体大小
 @param secure 是否密文输入（显示小黑点）
 @param distance 字体距离左边的距离
 @param view 添加的界面
 @return 返回textField
 */
- (UITextField *)setTextFieldWithFrame:(CGRect)frame backgroundColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius masksToBounds:(BOOL)masksToBounds cleaeMode:(UITextFieldViewMode)clearmode textColor:(UIColor *)textcolor placeHolder:(NSString *)placeholder textFont:(CGFloat)textfont secureEntry:(BOOL)secure leftDistance:(CGFloat)distance addView:(UIView *)view
{
    UITextField *text = [[UITextField alloc]init];
    text.backgroundColor = color;
    text.frame = frame;
    text.placeholder = placeholder;
    text.clearButtonMode = clearmode;
    text.textColor = textcolor;
    text.font = [UIFont systemFontOfSize:textfont];
    text.secureTextEntry = secure;
    text.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, distance, 0)];
    //设置显示模式为永远显示(默认不显示)
    text.leftViewMode = UITextFieldViewModeAlways;
    
    text.layer.borderWidth = borderWidth;
    text.layer.borderColor = borderColor.CGColor;
    text.layer.cornerRadius = cornerRadius;
    text.layer.masksToBounds = masksToBounds;
    
    [view addSubview:text];
    return text;
}

@end
