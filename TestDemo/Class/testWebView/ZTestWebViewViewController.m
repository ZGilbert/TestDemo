//
//  ZTestWebViewViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/6/15.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestWebViewViewController.h"
#import <mach-o/fat.h>
#import <mach-o/loader.h>
#import <mach/machine.h>

@interface ZTestWebViewViewController ()

@end

@implementation ZTestWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    CPU_TYPE_ARM; //可以不用导头文件 Cputype段用于只是当前文件的目标架构，即当前代码只能在指定CPU上运行。
//    MH_MAGIC;
//    MH_MAGIC_64;
//    Filetype字段用于标识文件的布局包括对齐方式等。在/usr/include/mach-o/loader.h
    
    
    
    
    
    self.navigationItem.title = @"积分使用规则";
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT)];

//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://openapi.idc.nonobank.com/nono-web/agreement/getCreditServiceAgreement?request={'openId':'168766','merchant':'10000','msgKey':'A2dKIgmd75gfRo3dLwuQ2w=='}"]];
    NSDictionary *dict1;
    
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://openapi.idc.nonobank.com/nono-web/agreement/getCreditServiceAgreement?request=%@", dict1]];
    
    NSString *urlString = [[dict1 objectForKey:@"map"] objectForKey:@"agreementUrl"];
    //不转义
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes
                                                            (kCFAllocatorDefault,
                                                             (CFStringRef)urlString,
                                                             (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,
                                                              kCFStringEncodingUTF8));
    
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:encodedString]];
    
    [self.webView loadRequest:request];
    
//    if (self.tabBarController == nil){
//        self.webViewContraint.constant = 0;
//    }
    
    [self.view addSubview:self.webView];

    NSDictionary *dict = @{@"aaa":@"bbb", @"ccc":@"ddd"};
    NSString *str = dict[@"aaa"];
    ZLOG(@"str ==> %@", str);


    //    QOS_CLASS_USER_INTERACTIVE
    
    //QOS_CLASS_USER_INTERACTIVE: user interactive类代表着为了提供良好的用户体验而需要被立即执行的任务。它经常用来刷新UI、处理一些要求低延迟的加载工作。在App运行的期间，这个类中的工作完成总量应该很小。
    //
    //QOS_CLASS_USER_INITIATED:user initiated类代表着从UI端初始化并可异步运行的任务。它在用户等待及时反馈时和涉及继续运行用户交互的任务时被使用。
    //
    //QOS_CLASS_UTILITY:utility类代表着长时间运行的任务，尤其是那种用户可见的进度条。它经常用来处理计算、I/O、网络通信、持续数据反馈及相似的任务。这个类被设计得具有高效率处理能力。
    //
    //QOS_CLASS_BACKBROUND:background类代表着那些用户并不需要立即知晓的任务。它经常用来完成预处理、维护及一些不需要用户交互的、对完成时间并无太高要求的任务。
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
