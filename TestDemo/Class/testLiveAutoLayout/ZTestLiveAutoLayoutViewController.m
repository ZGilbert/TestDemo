//
//  ZTestLiveAutoLayoutViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/6/10.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestLiveAutoLayoutViewController.h"
#import "LiveView.h"

@interface ZTestLiveAutoLayoutViewController ()

@end

@implementation ZTestLiveAutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    LiveView *liveView = [[LiveView alloc] initWithFrame:self.view.bounds];
    self.view = liveView;
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
