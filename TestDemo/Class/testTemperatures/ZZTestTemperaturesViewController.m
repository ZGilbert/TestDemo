//
//  ZZTestTemperaturesViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZZTestTemperaturesViewController.h"
#import "ZTestTemperatures.h"

@interface ZZTestTemperaturesViewController ()

@end

@implementation ZZTestTemperaturesViewController

- (void) loadView
{
    [super loadView];
    self.view.autoresizesSubviews=YES;
    self.view.autoresizingMask=(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZTestTemperatures *testView = [[ZTestTemperatures alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
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
