//
//  ZTestCustomCALayerViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestCustomCALayerViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ZCustomLayer.h"

@interface ZTestCustomCALayerViewController ()

@end

@implementation ZTestCustomCALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* 自定义层的方法1
     
     方法描述：创建一个CALayer的子类，然后覆盖drawInContext:方法，使用Quartz2D API进行绘图
     */
    ZCustomLayer *myLayer = [ZCustomLayer layer];
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    myLayer.position = CGPointMake(100, 200);
    
    //需要调用setNeedsDisplay这个方法，才会触发drawInContext:方法的调用，然后进行绘图
    [myLayer setNeedsDisplay];
    
    [self.view.layer addSublayer:myLayer];
    
    /*
     自定义层的方法2
     
     方法描述：设置CALayer的delegate，然后让delegate实现drawLayer:inContext:方法，当CALayer需要绘图时，会调用delegate的drawLayer:inContext:方法进行绘图。
     
     * 这里要注意的是：不能再将某个UIView设置为CALayer的delegate，因为UIView对象已经是它内部根层的delegate，再次设置为其他层的delegate就会出问题。
     
     */
    CALayer *sysLayer = [CALayer layer];
    sysLayer.bounds = CGRectMake(0, 0, 100, 100);
    sysLayer.position = CGPointMake(100, 320);
//    sysLayer.anchorPoint = CGPointMake(0, 0);
    sysLayer.backgroundColor = [UIColor yellowColor].CGColor;
    sysLayer.delegate = self;
    [sysLayer setNeedsDisplay];
    [self.view.layer addSublayer:sysLayer];
    
    //无论采取哪种方法来自定义层，都必须调用CALayer的setNeedsDisplay方法才能正常绘图。
    /*
     UIView的详细显示过程
     * 当UIView需要显示时，它内部的层会准备好一个CGContextRef(图形上下文)，然后调用delegate(这里就是UIView)的drawLayer:inContext:方法，并且传入已经准备好的CGContextRef对象。而UIView在drawLayer:inContext:方法中又会调用自己的drawRect:方法
     
     * 平时在drawRect:中通过UIGraphicsGetCurrentContext()获取的就是由层传入的CGContextRef对象，在drawRect:中完成的所有绘图都会填入层的CGContextRef中，然后被拷贝至屏幕
     */
    
}

#pragma mark 画一个矩形框
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//    // 设置蓝色
//    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
//    // 设置边框宽度
//    CGContextSetLineWidth(ctx, 10);
//    
//    // 添加一个跟层一样大的矩形到路径中
//    CGContextAddRect(ctx, layer.bounds);
//    
//    // 绘制路径
//    CGContextStrokePath(ctx);
    
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    
    CGContextSetLineWidth(ctx, 10);
    
    CGContextAddRect(ctx, layer.bounds);
    
    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
