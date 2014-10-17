//
//  ZIncrementallyImageViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-16.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZIncrementallyImageViewController.h"
#import "ZIncrementlyImage.h"

@interface ZIncrementallyImageViewController ()

@end

@implementation ZIncrementallyImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZIncrementlyImage *image = [[ZIncrementlyImage alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img1.gtimg.com/edu/pics/hv1/114/64/1569/102040659.jpg"]]];
    UIImageView *test = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    test.image = image;
//    UIImageView *test = [[UIImageView alloc] initWithImage:image];
//    test.frame = CGRectMake(10, 100, 100, 100);
    [self.view addSubview:test];
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
