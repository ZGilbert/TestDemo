//
//  ZSecondViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-9-22.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZSecondViewController.h"
#import "UMSocial.h"
#import "ZThirdTableViewController.h"

@interface ZSecondViewController ()

@end

@implementation ZSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [MobClick beginLogPageView:@"PageTwo"];
}

-(void) viewWillDisappear:(BOOL)animated {
    
    [MobClick endLogPageView:@"PageTwo"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    
    self.navigationItem.leftItemsSupplementBackButton = YES;
    
//    UIViewController *v = [self.navigationController.viewControllers objectAtIndex:0];
//    self.navigationController.topViewController
//    self.navigationController.visibleViewController
//    [backBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 300, 40)];
    label.text = @"i am second page  git status git fetch dev  git merge dev/dev  git push orign/dev  git co dev/dev git merge orign/dev git push dev dev  git co dev/dev ";
    label.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:label];
    
    UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nameBtn.frame = CGRectMake(10, 170, 300, 40);
    nameBtn.backgroundColor = [UIColor redColor];
    [nameBtn setTitle:@"one" forState:UIControlStateNormal];
    [nameBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
//    UIWindow
//    UIWindowLevel
    
    _inputField = [[UITextField alloc] initWithFrame:CGRectMake(10, 210, 300, 40)];
//    _inputField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
//    _inputField.center = CGPointMake(160, 50);
    _inputField.placeholder = @"string";
    [_inputField setFont:[UIFont systemFontOfSize:24]];
    _inputField.text = @"input you text";
    _inputField.clearsOnBeginEditing = YES;
    _inputField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _inputField.borderStyle = UITextBorderStyleRoundedRect;
    _inputField.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    [self.view addSubview:_inputField];

    [self.view addSubview:nameBtn];
    
    UIButton *hiddenBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    hiddenBtn.frame = CGRectMake(10, 250, 300, 40);
//    hiddenBtn.center = CGPointMake(80, 110);
    [hiddenBtn setTitle:@"Hide TextField" forState:UIControlStateNormal];
    [hiddenBtn addTarget:self action:@selector(hiddenInputView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hiddenBtn];
    hiddenBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    hiddenBtn.titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
    
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showBtn.frame = CGRectMake(10, 300, 300, 40);
//    showBtn.center = CGPointMake(240, 110);
    [showBtn setTitle:@"Show TextField" forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showInputView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    showBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    showBtn.titleLabel.lineBreakMode = UILineBreakModeTailTruncation;
    
    
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareBtn.frame = CGRectMake(10, 350, 300, 40);
    [shareBtn setTitle:@"share" forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareBtn];
    shareBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    shareBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
}

-(void) buttonAction:(UIButton *)sender
{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5428af1afd98c5bf8400dfa0"
                                      shareText:@"我爱你们"
                                     shareImage:[UIImage imageNamed:@"test.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
                                       delegate:nil];
}

-(void) backClick {
    
    self.backBlock(YES);
}

- (void) cancelClicked:(back)complete {

    self.backBlock = complete;
}

- (void)hiddenInputView:(id)sender
{
//    if (_inputField.isFirstResponder) {
//        [_inputField resignFirstResponder];
//    }
    _inputField.hidden = YES;
}

- (void)showInputView:(id)sender
{
//    _inputField.hidden = NO;
    ZThirdTableViewController *third = [[ZThirdTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:third animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
