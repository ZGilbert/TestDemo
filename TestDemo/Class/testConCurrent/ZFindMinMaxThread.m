//
//  ZFindMinMaxThread.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/23.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZFindMinMaxThread.h"

@implementation ZFindMinMaxThread {
    
    NSArray *_numbers;
}

- (instancetype)initWithNumbers:(NSArray *)numbers
{
    self = [super init];
    if (self) {
        _numbers = numbers;
    }
    return self;
}

- (void)main
{
    NSUInteger min;
    NSUInteger max;
    // 进行相关数据的处理
    self.min = min;
    self.max = max;
}

-(void) testB
{
    /*NSSet *threads = [NSMutableSet set];
    NSUInteger numberCount = _numbers.count;
    NSUInteger threadCount = 4;
    for (NSUInteger i = 0; i < threadCount; i++) {
        NSUInteger offset = (count / threadCount) * i;
        NSUInteger count = MIN(numberCount - offset, numberCount / threadCount);
        NSRange range = NSMakeRange(offset, count);
        NSArray *subset = [self.numbers subarrayWithRange:range];
        ZFindMinMaxThread *thread = [[ZFindMinMaxThread alloc] initWithNumbers:subset];
        [threads addObject:thread];
        [thread start];
    }*/
}

@end
