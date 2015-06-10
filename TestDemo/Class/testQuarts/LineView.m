//
//  LineView.m
//  asdfa
//
//  Created by gypsii001 on 15/5/26.
//  Copyright (c) 2015年 gypsii001. All rights reserved.
//

#import "LineView.h"

@interface LineView ()
{
    UIImage *img;
}

@end
@implementation LineView

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"aaa" ofType:@"png"];
        img = [UIImage imageWithContentsOfFile:path];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
   /* CGContextRef context = UIGraphicsGetCurrentContext();
    
//    // Create a graphics image context
//    UIGraphicsBeginImageContext(CGSizeMake(image.size.width,image.size.height));
//    // Tell the old image to draw in this new context, with the desired
//    // new size
//    [image drawInRect:CGRectMake(0, 0, 20, 20)];
//    // Get the new image from the context
//    UIImage* imageAfterClip = UIGraphicsGetImageFromCurrentImageContext();
//    // End the context
//    UIGraphicsEndImageContext();
    
    
//    //NO.1画一条线
//    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"aaa" ofType:@"png"];
//    UIImage *img = [UIImage imageWithContentsOfFile:path];
    
    
    CGImageRef image = img.CGImage;
    CGContextSaveGState(context);
    
    CGContextRotateCTM(context, M_PI);
    CGContextTranslateCTM(context, -img.size.width, -img.size.height);
    
    CGRect touchRect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextDrawImage(context, touchRect, image);
    CGContextRestoreGState(context);*/

    CGFloat width = rect.size.width;
    
    CGFloat height = rect.size.height;
    
    // 简便起见，这里把圆角半径设置为长和宽平均值的1/10
    
//    CGFloat radius = (width + height) * 0.05;
    CGFloat radius = 5;
    
    // 获取CGContext，注意UIKit里用的是一个专门的函数
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
    // 移动到初始点
    
    CGContextMoveToPoint(context, radius, 0);
    
    // 绘制第1条线和第1个1/4圆弧，右上圆弧
    
    CGContextAddLineToPoint(context, 50 - radius,0);
    
    CGContextAddArc(context, 50 - radius, radius, radius, -0.5 *M_PI,0.0, 0);
    
    // 绘制第2条线和第2个1/4圆弧，右下圆弧
    
    CGContextAddLineToPoint(context, 50, height - radius);
    
    CGContextAddArc(context, 50 - radius, height - radius, radius,0.0,0.5 * M_PI,0);
    
    // 绘制第3条线和第3个1/4圆弧，左下圆弧
    
    CGContextAddLineToPoint(context, radius, height);
    
    CGContextAddArc(context, radius, height - radius, radius,0.5 *M_PI, M_PI,0);
    
    // 绘制第4条线和第4个1/4圆弧，左上圆弧
    
    CGContextAddLineToPoint(context, 0, radius);
    
    CGContextAddArc(context, radius, radius, radius,M_PI,1.5 * M_PI,0);
    
    // 闭合路径
    
    CGContextClosePath(context);
    
    // 填充半透明红色
    
    CGContextSetRGBFillColor(context,1.0,0.0,0.0,0.5);
    
    CGContextDrawPath(context,kCGPathFill);
    
    
    
    //第一张图
    CGImageRef image = img.CGImage;
    CGContextSaveGState(context);
    
    CGContextRotateCTM(context, M_PI);
    CGContextTranslateCTM(context, -48, -48);
    
    CGRect touchRect = CGRectMake(-55, 0, 48, 48);
    CGContextDrawImage(context, touchRect, image);
    CGContextRestoreGState(context);
    
    
    
    
    
    //第二张图
    CGImageRef image1 = img.CGImage;
    CGContextSaveGState(context);
    
    CGContextRotateCTM(context, M_PI);
    CGContextTranslateCTM(context, -48, -48);
    
    CGRect touchRect1 = CGRectMake(-110, 0, 48, 48);
    CGContextDrawImage(context, touchRect1, image1);
    CGContextRestoreGState(context);
    
    
}


@end
