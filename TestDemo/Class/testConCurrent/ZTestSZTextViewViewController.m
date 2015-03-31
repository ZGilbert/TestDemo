//
//  ZTestSZTextViewViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14/11/4.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestSZTextViewViewController.h"

@interface ZTestSZTextViewViewController ()

@end

@implementation ZTestSZTextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //要使字体从最上开始输入,必须定义一个UIScrollView来作为背景图
    
    // Do any additional setup after loading the view.
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT)];
    scroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scroll];
    self.textView = [[SZTextView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    self.textView.placeholder = @"It's just a test for textView";
    self.textView.layer.borderWidth = 1.0;//边宽
    self.textView.layer.cornerRadius = 2.0;//设置圆角
//    self.textView.layer.borderColor =[[UIColor grayColor] colorWithAlphaComponet:0,5];
    
//    [self.view addSubview:self.textView];
    [scroll addSubview:self.textView];
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
