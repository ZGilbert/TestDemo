//
//  ZTestKVOViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/4/1.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestKVOViewController.h"

@interface ZTestKVOViewController ()

@end

@implementation ZTestKVOViewController
@synthesize iPhone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    iPhone = [[ZiPhone alloc] init];
    
    [iPhone addObserver:self forKeyPath:@"storage" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    iPhone.storage = @"";
//    iPhone.iPhone6 = @"";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 200, 300, 50);
    [btn setTitle:@"change" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addNumber) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSString *aaa = @"hello world!";
    NSString *firstLetter = [[aaa substringToIndex:1] uppercaseString];
}

-(void) addNumber
{
    static int count = 0;
    count++;
    iPhone.storage = [NSString stringWithFormat:@"storage add %d", count];
    ZLOG(@"count ==> %@", iPhone.storage);
//    ZLOG(@"count ==> %d", count);
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"storage"]) {
        ZLOG(@"adsf");
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
