//
//  ZCustomLayer.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZCustomLayer.h"

@implementation ZCustomLayer

-(void) drawInContext:(CGContextRef)ctx
{
//    // 设置为蓝色
//    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
//    
//    
//    // 设置起点
//    CGContextMoveToPoint(ctx, 50, 0);
//    // 从(50, 0)连线到(0, 100)
//    CGContextAddLineToPoint(ctx, 0, 100);
//    // 从(0, 100)连线到(100, 100)
//    CGContextAddLineToPoint(ctx, 100, 100);
//    // 合并路径，连接起点和终点
//    CGContextClosePath(ctx);
//    
//    // 绘制路径
//    CGContextFillPath(ctx);
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    CGContextMoveToPoint(ctx, 50, 0);
    
    CGContextAddLineToPoint(ctx, 0, 100);
    
    CGContextAddLineToPoint(ctx, 100, 100);
    
    CGContextClosePath(ctx);
    
    // 绘制路径
    CGContextFillPath(ctx);
}

@end
