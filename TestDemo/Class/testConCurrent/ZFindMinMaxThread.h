//
//  ZFindMinMaxThread.h
//  TestDemo
//
//  Created by zhu_hbo on 14/10/23.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFindMinMaxThread : NSThread

@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger max;

- (instancetype)initWithNumbers:(NSArray *)numbers;

@end
