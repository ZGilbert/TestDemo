//
//  ZTestAnimationViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-16.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>
//#import "ZTestFadeView.h"
#import "ZToggleView.h"

@interface ZTestAnimationViewController ()

@end

@implementation ZTestAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZToggleView *testView = [[ZToggleView alloc] initWithFrame:CGRectMake(10, 100, 200, 200)];
    [self.view addSubview:testView];
    
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
