//
//  ZTestMemoryViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-9-28.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestMemoryViewController.h"
#import "ZTestMemroyView.h"
//#import <libkern/OSMemoryNotification.h>

@interface ZTestMemoryViewController ()

@end

@implementation ZTestMemoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZTestMemroyView *testView = [[ZTestMemroyView alloc] initWithFrame:CGRectMake(10, 64, 300, 300)];
    testView.backgroundColor = [UIColor blueColor];
    UIColor *clo = [[UIColor alloc] init];
    [clo setFill];
    
    [self.view addSubview:testView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Recieve memory warning");
//    NSLog(@"~~~~~~~~~~~~~~level~~~~~~~~~~~~~~~ %d", (int)OSMemoryNotificationCurrentLevel());
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
