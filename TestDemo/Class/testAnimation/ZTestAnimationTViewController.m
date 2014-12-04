//
//  ZTestAnimationTViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/29.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestAnimationTViewController.h"

#define APP_SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define APP_SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height

@interface ZTestAnimationTViewController ()
{
    UIView *upMaskView;
    UIView *downMaskView;
}
@end

@implementation ZTestAnimationTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"touch" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 200, 40);
    [btn addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    upMaskView = [[UIView alloc]
                   initWithFrame:CGRectMake(0.0f, -(APP_SCREEN_HEIGHT/2-10), APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT/2-10)];
    upMaskView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
    upMaskView.hidden = NO;
    [self.view addSubview:upMaskView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 200, 40)];
    label.text = @"i am the label";
    label.backgroundColor = [UIColor redColor];
//    [self.view addSubview:label];
    [self.navigationController.view addSubview:label];
    [self.navigationController.view addSubview:upMaskView];
    
    downMaskView = [[UIView alloc]
                  initWithFrame:CGRectMake(0.0f, APP_SCREEN_HEIGHT, APP_SCREEN_WIDTH, APP_SCREEN_HEIGHT/2-10)];
    downMaskView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
    downMaskView.hidden = NO;
    [self.view addSubview:downMaskView];
}

- (void) touch
{
    [UIView animateWithDuration:0.3 animations:^{
        [upMaskView setCenter:CGPointMake(upMaskView.center.x,
                                             upMaskView.center.y + (APP_SCREEN_HEIGHT/2-10))];
        
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        [downMaskView setCenter:CGPointMake(downMaskView.center.x,
                                          downMaskView.center.y - (APP_SCREEN_HEIGHT/2-10))];
        
    } completion:^(BOOL finished) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, APP_SCREEN_HEIGHT/2-10, APP_SCREEN_WIDTH, 20)];
        label.text = @"加载中...";
        [self.view addSubview:label];
    }];
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
