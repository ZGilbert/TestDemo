//
//  ZTestCALayerViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-11.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestCALayerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ZTestCALayerViewController ()
{
    UIImageView *calayerImageView;
}

@end

@implementation ZTestCALayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.]
    
#pragma mark - UIImageView
    /*calayerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test.png"]];
        calayerImageView.frame = CGRectMake(60, 150, 200, 200);
//    calayerImageView.center = CGPointMake(160, 185);
    [self.view addSubview:calayerImageView];
    
    //设置阴影
    calayerImageView.layer.shadowColor = [UIColor redColor].CGColor;
    calayerImageView.layer.shadowOffset = CGSizeMake(10, 10);
    calayerImageView.layer.shadowOpacity = 0.5;
    
    //设置圆角
    calayerImageView.layer.cornerRadius = 10;
    calayerImageView.layer.masksToBounds = YES;  //可以看做是强制内部的所有子层支持圆角效果，少了这个设置，UIImageView是不会有圆角效果的.如果设置了maskToBounds=YES，那将不会有阴影效果
    
    //设置边框宽度和颜色
    calayerImageView.layer.borderWidth = 5;
    calayerImageView.layer.borderColor = [UIColor redColor].CGColor;
    
    //设置旋转
    calayerImageView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//    calayerImageView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);*/
    
#pragma mark - 自定义CALayer
    /*
     UIView内部默认有个CALayer对象(层)，通过layer属性可以访问这个层。要注意的是，这个默认的层不允许重新创建，但可以往层里面添加子层
     UIView可以通过addSubview:方法添加子视图，类似地，CALayer可以通过addSublayer:方法添加子层
     */
    CALayer *myLayer1 = [CALayer layer];
    myLayer1.bounds = CGRectMake(0, 0, 100, 100);
    myLayer1.position = CGPointMake(150, 200);
//    myLayer1.backgroundColor = [UIColor yellowColor].CGColor;
    myLayer1.contents = (id)[UIImage imageNamed:@"test.png"].CGImage;
    myLayer1.cornerRadius = 30;
    [self.view.layer addSublayer:myLayer1];
    
    CALayer *myLayer = [CALayer layer];
    // 设置层的宽度和高度（100x100）
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    // 设置层的位置
    myLayer.position = CGPointMake(100, 100);
    // 设置层的背景颜色：红色
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    // 设置层的圆角半径为10
    myLayer.cornerRadius = 10;
    
    // 添加myLayer到控制器的view的layer中
    [self.view.layer addSublayer:myLayer];
    
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
