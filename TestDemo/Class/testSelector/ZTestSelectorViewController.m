//
//  ZTestSelectorViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-15.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestSelectorViewController.h"

@interface ZTestSelectorViewController ()

@end

@implementation ZTestSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self firstSegment:@"1" secSegment:@"2" thirdSegment:@"3"];
    [self firstSegment:@"1" secSegment:@"2" :@"3"];
}


#define WQ_FUNC_LOG NSLog(@"%s",__FUNCTION__)
- (void)firstSegment:(id)firstObj secSegment:(id) thirdSegment:(id)thirdObj
{
    WQ_FUNC_LOG;
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
