//
//  ZTestStatusBarViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-15.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestStatusBarViewController.h"
#import "ZBackupWindow.h"
#import "UIImage+Rotate_Flip.h"

@interface ZTestStatusBarViewController ()

@end

@implementation ZTestStatusBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    ZBackupWindow *s = [[ZBackupWindow alloc] init];
    [s showTips:@"加载成功"];
    
    UIImage *testImage = [UIImage imageNamed:@"test.png"];
    [testImage rotateImageWithRadian:0.5f cropMode:1];
    UIImageView *testImageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 150, 100, 100)];
    testImageView.image = testImage;
    [self.view addSubview:testImageView];
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
