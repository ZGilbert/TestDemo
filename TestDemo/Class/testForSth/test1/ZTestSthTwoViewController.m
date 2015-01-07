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


/*
//单击和双击方法之一
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch=[touches anyObject];
    
    UILabel *label = (UILabel *)[self.view viewWithTag:100];
    label.userInteractionEnabled = NO;
    CGPoint point = [touch locationInView:self.view];
    if (point.x >= label.frame.origin.x && point.x <= label.frame.size.width+label.frame.origin.x
        &&point.y >= label.frame.origin.y && point.y <= label.frame.origin.y+label.frame.size.height) {
        
        if ([touch tapCount] == 1) {
            [self performSelector:@selector(fun1) withObject:nil afterDelay:1];
        }
        else if ([touch tapCount] ==2)
        {
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(fun1) object:nil];
            [self performSelector:@selector(fun2) withObject:nil afterDelay:1];
        }
    }
    
//    [((UITextField*)[self.view viewWithTag:100]) resignFirstResponder];
    
}

-(void) fun1 {
    ZLOG(@"fun1");
};*/
-(void) fun2 {
    ZLOG(@"fun2");
};

//复制文字到剪切板
-(void) copyTheText {
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//    UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:@"yaoqingma" create:YES];
    [pasteboard setString:((UITextField*)[self.view viewWithTag:100]).text];
}

-(void)textDidChange1:(NSNotification*)noti
{
//    UIApplicationOpenSettingsURLString //没有网络的时候跳到系统的设置页面
    UITextField *tf2 = (UITextField*)[self.view viewWithTag:100];
    if([noti object] == tf2)
    {
        NSString *tmp = tf2.text;
        ZLOG(@"tf2.text ==>　%@", tmp);
    }
}

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
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 150, 300, 40);
    btn.tag = 1;
    [btn setTitle:@"复制" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(copyTheText) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    label.backgroundColor = [UIColor redColor];
    label.tag = 101;
    [self.view addSubview:label];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fun2)];
    recognizer.numberOfTapsRequired = 2;
    [label addGestureRecognizer:recognizer];
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
