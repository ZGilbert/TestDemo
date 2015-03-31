//
//  ZPerson.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-8.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZPerson.h"

@implementation ZPerson

//类方法
+(id) personWithName:(NSString *)aName
{
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
    ZPerson *p = [[ZPerson alloc] init];
    p->_name = aName;
    return p;
}

+(id) personWithName:(NSString *)aName withAge:(int)aAge
{
    ZPerson *p = [[ZPerson alloc] init];
    p->_name = aName;
    p->_age = aAge;
    return p;
}

//...

-(id) initWithName:(NSString *)aName
{
    self = [super init];
    if (self) {
        _name = aName;
    }
    return self;
}

-(id) initWithName:(NSString *)aName withAge:(int)aAge
{
    self = [super init];
    if (self) {
        _name = aName;
        _age = aAge;
    }
    return self;
}

@end
