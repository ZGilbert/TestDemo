//
//  NSArray+Hook.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-15.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "NSArray+Hook.h"

@implementation NSArray (Hook)


-(id) myLastObject
{
    static int i = 0;
    i++;
    id ret = [self myLastObject];
    
    ZLOG(@"===========int i = %d=========", i);
    return ret;
}

@end
