//
//  ZTestSthTwoViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/1/5.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestSthTwoViewController.h"

@interface ZTestSthTwoViewController () <UITextFieldDelegate>

@end

@implementation ZTestSthTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextField *test = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    test.backgroundColor = [UIColor clearColor];
    test.tag = 100;
//    test.delegate = self;
    test.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:test];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange1:) name:@"UITextFieldTextDidChangeNotification" object:nil];
}


-(void)textDidChange1:(NSNotification*)noti
{
    
    UITextField *tf2 = (UITextField*)[self.view viewWithTag:100];
    if([noti object] == tf2)
    {
        NSString *tmp = tf2.text;
        NSLog(@"tf2.text ==>　%@", tmp);
    }
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
