//
//  ZTestSteperViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/5/13.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestSteperViewController.h"

@interface ZTestSteperViewController ()

@end

@implementation ZTestSteperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStepper *stepper = [[UIStepper alloc] init];
    stepper.tag = 10;
    stepper.center = CGPointMake(160, 240);
    stepper.minimumValue = 1; //设置最小值
    stepper.maximumValue = 30; //设置最大值
    stepper.stepValue = 2; //每次递增2
    stepper.value = 15; //初始值
    [stepper setWraps:YES]; //是否循环
    [stepper addTarget:self action:@selector(doTest) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:stepper];
}

-(void)doTest
{
    UIStepper *per = (UIStepper*)[self.view viewWithTag:10];
    
    if (per.continuous)
    {
        NSLog(@"Y");
        int a = per.value;  //获取当前值
        NSLog(@"%d", a);
    }
    else
    {
        NSLog(@"N");
    }
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
