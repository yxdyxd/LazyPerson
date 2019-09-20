//
//  Person.m
//  LazyPersonDemo
//
//  Created by 费城 on 2019/7/1.
//  Copyright © 2019 BUG联盟. All rights reserved.
//

#import "Person.h"

@implementation Person

/*
 此处使用归档来进行数据持久化，需要注意的几个点
 1.需要服从NSSecureCoding协议，并实现supportsSecureCoding方法
 2.需要设置每一个属性的编码和解码获取相应的值
 3.不同值的属性，需要不同的方法去编码(如Integer类型需要，encodeInteger来编码)
 4.key值注意保持一致，所以尽量复制(0.0)
 */

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.name forKey:@"name"];
    
    [aCoder encodeInteger:self.tel forKey:@"tel"];
    
    [aCoder encodeObject:self.youxiang forKey:@"youxiang"];

    [aCoder encodeObject:self.sex forKey:@"sex"];

    [aCoder encodeObject:self.position forKey:@"position"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
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

@end
