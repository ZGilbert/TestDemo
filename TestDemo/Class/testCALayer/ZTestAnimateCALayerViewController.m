//
//  ZTestAnimateCALayerViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestAnimateCALayerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ZTestAnimateCALayerViewController ()
{
    CALayer *myLayer2;
    BOOL flag;
}

@end

@implementation ZTestAnimateCALayerViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     * position和anchorPoint属性都是CGPoint类型的
     
     * position可以用来设置CALayer在父层中的位置，它是以父层的左上角为坐标原点(0, 0)
     
     * anchorPoint称为"定位点"，它决定着CALayer身上的哪个点会在position属性所指的位置。它的x、y取值范围都是0~1，默认值为(0.5, 0.5)
     
     */
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    myLayer.position = CGPointMake(100, 200);
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    
    // 添加myLayer到控制器的view的layer中
    [self.view.layer addSublayer:myLayer];
    
    /*CALayer *myLayer1 = [CALayer layer];
    myLayer1.bounds = CGRectMake(0, 0, 100, 100);
    myLayer1.position = CGPointMake(100, 200);
    myLayer1.anchorPoint = CGPointMake(0, 0);
    myLayer1.backgroundColor = [UIColor yellowColor].CGColor;
    
    // 添加myLayer到控制器的view的layer中
    [self.view.layer addSublayer:myLayer1];*/
    
    myLayer2 = [CALayer layer];
    myLayer2.bounds = CGRectMake(0, 0, 100, 100);
    myLayer2.position = CGPointMake(100, 200);
    myLayer2.anchorPoint = CGPointMake(1, 1);
    myLayer2.backgroundColor = [UIColor yellowColor].CGColor;
    
    // 添加myLayer到控制器的view的layer中
    [self.view.layer addSublayer:myLayer2];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 300, 200, 40);
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) btnAction
{
    myLayer2.anchorPoint = CGPointMake(0, 0);
    myLayer2.backgroundColor = [UIColor orangeColor].CGColor;
    myLayer2.cornerRadius = 20;
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
