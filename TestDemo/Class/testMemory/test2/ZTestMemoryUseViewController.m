//
//  ZTestMemoryUseViewController.m
//  TestDemo
//
//  Created by gypsii001 on 14/12/29.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestMemoryUseViewController.h"
#import <mach/mach.h>

@interface ZTestMemoryUseViewController ()

@end

@implementation ZTestMemoryUseViewController

- (double)availableMemory {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if(kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size * vmStats.free_count) / 1024.0) / 1024.0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float mem = [self availableMemory];
    NSLog(@"men ==> %.2f", mem);
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void) test1 {
    
    //    UIButton *label = [UIButton buttonWithType:UIButtonTypeCustom];
    //    label.frame = CGRectMake(10, 100, 200, 50);
    //    label.tag = 100;
    //    [label addTarget:self action:@selector(actionA:) forControlEvents:UIControlEventTouchUpInside];
    //    label.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:label];
    //
    //    label = [UIButton buttonWithType:UIButtonTypeCustom];
    //    label.frame = CGRectMake(10, 300, 200, 50);
    //    label.tag = 200;
    //    [label addTarget:self action:@selector(actionA:) forControlEvents:UIControlEventTouchUpInside];
    //    label.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:label];
    
    
    float width = 0.5;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 45.0, 320.0, 320.0)];
    
    
    UIView *viewTemp = [[UIView alloc] initWithFrame:CGRectMake(0, 106.5, 320, width)];
    [viewTemp setBackgroundColor:[UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:1.0]];
    [view addSubview:viewTemp];
    viewTemp.alpha = 0.8;
    
    
    viewTemp = [[UIView alloc] initWithFrame:CGRectMake(0, 213, 320, width)];
    [viewTemp setBackgroundColor:[UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:1.0]];
    [view addSubview:viewTemp];
    viewTemp.alpha = 0.8;
    
    
    viewTemp = [[UIView alloc] initWithFrame:CGRectMake(106.5, 0, width, 320)];
    [viewTemp setBackgroundColor:[UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:1.0]];
    [view addSubview:viewTemp];
    viewTemp.alpha = 0.8;
    
    
    viewTemp = [[UIView alloc] initWithFrame:CGRectMake(213, 0, width, 320)];
    [viewTemp setBackgroundColor:[UIColor colorWithRed:31/255.0 green:31/255.0 blue:31/255.0 alpha:1.0]];
    [view addSubview:viewTemp];
    viewTemp.alpha = 0.8;
    
    
    [view addSubview:viewTemp];
    
    [self.view addSubview:view];
}

-(void) actionA:(UIButton *)sender
{
    
    if (sender.tag == 100) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"a" message:@"a" delegate:self cancelButtonTitle:@"a" otherButtonTitles:nil];
        [alert show];
    } else if (sender.tag == 200) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"b" message:@"b" delegate:self cancelButtonTitle:@"b" otherButtonTitles:nil];
        [alert show];
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
