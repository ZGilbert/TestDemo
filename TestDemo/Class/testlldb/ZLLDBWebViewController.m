//
//  ZLLDBWebViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/3/11.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZLLDBWebViewController.h"

@interface ZLLDBWebViewController ()

@end

@implementation ZLLDBWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://wap.baidu.com"]];
    [self.testWebView loadRequest:request];
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
