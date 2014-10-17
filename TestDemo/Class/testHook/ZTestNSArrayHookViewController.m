//
//  ZTestNSArrayHookViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-15.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestNSArrayHookViewController.h"
#import "NSArray+Hook.h"
#import <objc/runtime.h>

@interface ZTestNSArrayHookViewController ()

@end

@implementation ZTestNSArrayHookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *array = @[@"1"];
    
    Method ori_Method = class_getInstanceMethod([NSArray class], @selector(lastObject));
    Method now_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
    method_exchangeImplementations(ori_Method, now_Method);
    
    NSString *str = [array lastObject];
    ZLOG(@"str ==> %@", str);
    
    
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
