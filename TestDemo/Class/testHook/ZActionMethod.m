//
//  ZActionMethod.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-14.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZActionMethod.h"

@implementation ZActionMethod

-(void) buttonAction:(UIButton *)sender
{
    ZLOG(@"is anything wrong?");
    [self performSelector:@selector(asdf:) withObject:sender];
    
}

@end
