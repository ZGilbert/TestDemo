//
//  ZTestFourViewController.m
//  TestDemo
//
//  Created by zhu_haibo on 15/4/7.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestFourViewController.h"
#import <objc/runtime.h>

@interface ZTestFourViewController () {

    UIView *test;
}

@end

@implementation ZTestFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    test = [[NSClassFromString(@"ZCustomView") alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    
    
    SEL select = NSSelectorFromString(@"changeBackgroundColor");
    
    Method changeMethod = class_getInstanceMethod([test class], select);
    
    Class clazz = object_getClass(test);
    NSString *className = NSStringFromClass(clazz);
    
    [self.view addSubview:test];
    
    
    
    
    
    
    
    
    
    
    // -------------------------------- //
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 200, 300, 50);
    [btn setTitle:@"change" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void) changeColor {
    
    SEL select = NSSelectorFromString(@"changeBackgroundColor");
    if ([test respondsToSelector:select]) {
        [test performSelector:select withObject:nil];
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
