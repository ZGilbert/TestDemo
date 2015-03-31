//
//  ZTestGifPictureViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-15.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestGifPictureViewController.h"
#import "ZGifView.h"

@interface ZTestGifPictureViewController ()

@end

@implementation ZTestGifPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIImageView *imag = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
//    imag.image = [UIImage imageNamed:@"gitgit.gif"];
//    [self.view addSubview:imag];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"png"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"gitgit" ofType:@"gif"];
//    NSArray *array = [[NSBundle mainBundle] pathsForResourcesOfType:@"gif" inDirectory:nil];
//    array = nil;
    NSURL *url = [NSURL fileURLWithPath:path];
    ZGifView *gif = [[ZGifView alloc] initWithCenter:CGPointMake(170, 300) fileURL:url];
    [self.view addSubview:gif];

    [gif startGif];
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
