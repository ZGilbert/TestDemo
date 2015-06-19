//
//  ZTestWebViewViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/6/15.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestWebViewViewController.h"

@interface ZTestWebViewViewController ()

@end

@implementation ZTestWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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
