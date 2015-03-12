//
//  ZOBJ1.m
//  TestDemo
//
//  Created by gypsii001 on 15/3/12.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZOBJ1.h"

static int(^maxIntBlock)(int, int) = ^(int a, int b){return a>b?a:b;}; //全局区

@implementation ZOBJ1

-(id) init
{
    self = [super init];
    if (self) {
        self.block = ^(BOOL bValue) {
            NSLog(@"Bool block!");
        };
    }
    return self;
}

- (BoolBlock)foo:(BoolBlock)block
{
//    int(^maxIntBlockCopied)(int, int) = Block_copy(maxIntBlock); //复制过后的block依旧位于全局区，实际上，复制操作是直接返回了原block对象。
    
    if (block) {
        return block;
    }
    return nil;
}

- (void)fooBar
{
    int(^maxIntBlockCopied)(int, int) =[maxIntBlock copy]; //复制过后的block依旧位于全局区，实际上，复制操作是直接返回了原block对象。
    ZOBJ1* oj = self;
    void (^oblk)(void) = ^{ printf("%d\n", 2);};
    void (^oblkInHeap)(void) = [oblk copy];//oblkInHeap在堆中
}

// block引用的变量在哪里
//全局区的变量存储位置与block无关 注意，static变量是不允许添加__block标记的

@end
