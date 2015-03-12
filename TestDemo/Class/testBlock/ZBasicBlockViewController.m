//
//  ZBasicBlockViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/3/12.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZBasicBlockViewController.h"

@implementation ZBasicBlockViewController


- (void)someMethod
{
    BoolBlock ablock = ^(BOOL bValue) {
        NSLog(@"Bool block!");
    };
    
    ablock;
    
    __block int i = 1024;
    int j = 1;
    void (^blk)(void);
    void (^blkInHeap)(void);
    blk = ^{ printf("%d, %d\n", i, j);};//blk在栈里
//    blkInHeap = Block_copy(blk);//blkInHeap在堆里
}

- (BoolBlock) foo
{
    BoolBlock ablock = ^(BOOL bValue) {
        NSLog(@"Bool block!");
    };
//    return ablock;
//    return [[ablock copy] autorelease];//一定要copy，将其复制到堆上，更详细的原理，将在后续章节讲解
    return [ablock copy];//一定要copy，将其复制到堆上，更详细的原理，将在后续章节讲解
}



@end
