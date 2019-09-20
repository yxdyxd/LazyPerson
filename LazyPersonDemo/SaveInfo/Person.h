//
//  Person.h
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/1.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 此处使用归档来进行数据持久化，需要注意的几个点
 1.需要服从NSSecureCoding协议，并实现supportsSecureCoding方法
 2.需要设置每一个属性的编码和解码获取相应的值
 3.不同值的属性，需要不同的方法去编码(如Integer类型需要，encodeInteger来编码)
 4.key值注意保持一致，所以尽量复制(0.0)
 */

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSSecureCoding>

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) NSInteger tel;
@property (nonatomic, copy)   NSString *youxiang;
@property (nonatomic, copy)   NSString *sex;
@property (nonatomic, copy)   NSString *position;

@end

NS_ASSUME_NONNULL_END
