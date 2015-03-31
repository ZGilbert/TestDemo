//
//  ZTestStringViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-8.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestStringViewController.h"

@interface ZTestStringViewController ()

@end

@implementation ZTestStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建空的字符串
    NSString *str1 = [[NSString alloc] init];
    NSString *str2 = [NSString string];
    ZLOG(@"str1 ==> %@", str1);
    ZLOG(@"str2 ==> %@", str2);
    
//    NSString *str3 = [[NSString alloc] initWithString:@"abc"];
//    NSString *str4 = [NSString stringWithString:@"xyz"];
//    ZLOG(@"str3 ==> %c", &str3);
//    ZLOG(@"str3 ==> %c", &str3);
    
    
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
