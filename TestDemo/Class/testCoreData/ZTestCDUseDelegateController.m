//
//  ZTestCDUseDelegateController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-17.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestCDUseDelegateController.h"
#import "ZCoreDataAPI.h"

#define CLEARCOLOR [UIColor clearColor]

@interface ZTestCDUseDelegateController () <ZCoreDataAPIDelegate>
{
    UITextField *nameTxt;
    UITextField *ageTxt;
    UITextField *numberTxt;
}

@property(strong, nonatomic) ZCoreDataAPI *api;

@end

@implementation ZTestCDUseDelegateController

-(void)viewDidLoad
{
    //返回在束Info.plist文件中定义的名称
    self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
//    self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
//    self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSLog(@"self.title ==> %@", self.title);
    
    [self initDelegate];
    [self forTxtField];
    [self forButton];
}

-(void) initDelegate
{
    if (self.api == nil) {
        self.api = [[ZCoreDataAPI alloc] init];
        [self.api addDelegate:self];
    }
}

-(void) forTxtField
{
    nameTxt = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 300, 40)];
    nameTxt.backgroundColor = CLEARCOLOR;
    nameTxt.placeholder = @"name";
    nameTxt.borderStyle = UITextBorderStyleRoundedRect;
    nameTxt.layer.cornerRadius = 5;
    nameTxt.delegate = self;
    [self.view addSubview:nameTxt];
    
    ageTxt = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, 300, 40)];
    ageTxt.backgroundColor = CLEARCOLOR;
    ageTxt.placeholder = @"age";
    ageTxt.borderStyle = UITextBorderStyleRoundedRect;
    ageTxt.layer.cornerRadius = 5;
    ageTxt.delegate = self;
    [self.view addSubview:ageTxt];
    
    numberTxt = [[UITextField alloc] initWithFrame:CGRectMake(10, 180, 300, 40)];
    numberTxt.backgroundColor = CLEARCOLOR;
    numberTxt.placeholder = @"number";
    numberTxt.borderStyle = UITextBorderStyleRoundedRect;
    numberTxt.layer.cornerRadius = 5;
    numberTxt.delegate = self;
    [self.view addSubview:numberTxt];
}

-(void) forButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 230, 50, 40);
    [btn setTitle:@"增 加" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addhh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(100, 230, 50, 40);
    [btn1 setTitle:@"查 询" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(queryhh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10, 280, 50, 40);
    [btn2 setTitle:@"删 除" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(alertActionForDeletehh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
//    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn3.frame = CGRectMake(100, 280, 50, 40);
//    [btn3 setTitle:@"更 新" forState:UIControlStateNormal];
//    [btn3 addTarget:self action:@selector(updateThePersonDatahh) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn3];
}

#pragma mark - button event here
#pragma mark - add method here
-(void) addhh
{
    [self.api addData:nameTxt.text :ageTxt.text :numberTxt.text];
}

-(void) addMethod:(NSString *)name
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"添加方法" message:[NSString stringWithFormat:@"%@", name] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    alert.delegate = self;
    [alert show];
}

#pragma mark - query method here
-(void) queryhh
{
    [self.api queryData];
}

-(void) queryMethod:(NSString *)count
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"查询方法" message:count delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    alert.delegate = self;
    [alert show];
}

#pragma mark - delete method here
-(void) alertActionForDeletehh
{
    [self.api alertActionForDelete];
}

-(void) deleteMethod:(NSString *)predicated
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"删除方法" message:predicated delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    alert.delegate = self;
    [alert show];
}

@end
