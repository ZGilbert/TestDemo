//
//  ZTestRuntimeViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/10/16.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestRuntimeViewController.h"
#import <objc/runtime.h>
//#import "ZLender.h"

@interface ZTestRuntimeViewController ()

@end

@implementation ZTestRuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id LenderClass = objc_getClass("ZLender");
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);

    
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "==> %s || %s\n", property_getName(property), property_getAttributes(property));
        printf("==> %s || %s\n", property_getName(property), property_getAttributes(property));
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
