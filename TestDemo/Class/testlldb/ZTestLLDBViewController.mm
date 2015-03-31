//
//  ZTestLLDBViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/3/11.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestLLDBViewController.h"
#import "ZLLDBWebViewController.h"
#import "ZTestOC.h"

@interface ZTestLLDBViewController ()

@end

@implementation ZTestLLDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotification) name:@"testNotification" object:nil];
    
    [self testNotification];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor = [UIColor purpleColor];
    btn.frame = CGRectMake(80, 300, 160, 50);
    [btn addTarget:self action:@selector(testNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.backgroundColor = [UIColor purpleColor];
    btn1.frame = CGRectMake(80, 400, 160, 50);
    [btn1 addTarget:self action:@selector(showWebView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    ZTestC test;
    test.setVar(100);
    ZTestOC *t = [[ZTestOC alloc] init];
    [t setVar:100];
}

-(void) showWebView
{
    ZLLDBWebViewController *zlldb = [[ZLLDBWebViewController alloc] initWithNibName:@"ZLLDBWebViewController" bundle:nil];
    [self.navigationController pushViewController:zlldb animated:YES];
}

-(void)testNotification
{
    ZLOG(@"I am bigger !");
    
    UITextField *t = (UITextField *)[self.view viewWithTag:100];
    if (t) {
        [t removeFromSuperview];
    }
    int y = 80;
    int twidth = 300;
    int theight = 50;
    UITextField *tst= [[UITextField alloc] initWithFrame:CGRectMake(10, y, twidth, theight)];
    tst.backgroundColor = [UIColor redColor];
    tst.tag = 100;
    [self.view addSubview:tst];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
     //Set Search Button Title to Done 2
//    for (UIView *searchBarSubview in [self.searchBar subviews]) {
//        if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
//            // Before iOS 7.0 5
//            @try { 6 [(UITextField *)searchBarSubview setReturnKeyType:UIReturnKeyDone];
//                [(UITextField *)searchBarSubview setKeyboardAppearance:UIKeyboardAppearanceAlert];
//                @catch (NSException * e) {10 // ignore exception11 }12 }
//                    else {13
//                        // iOS 7.014
//                        for(UIView *subSubView in [searchBarSubview subviews]) {
//                            if([subSubView conformsToProtocol:@protocol(UITextInputTraits)]) {
//                                @try {17 [(UITextField *)subSubView setReturnKeyType:UIReturnKeyDone];
//                                    //[(UITextField *)searchBarSubview setKeyboardAppearance:UIKeyboardAppearanceAlert];19 }20
//                                    @catch (NSException * e) {21 // ignore exception22 }23 }24 }25 }26 }
    
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
