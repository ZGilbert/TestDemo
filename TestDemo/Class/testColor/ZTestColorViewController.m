//
//  ZTestColorViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-9-29.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestColorViewController.h"

@interface ZTestColorViewController ()

@end

@implementation ZTestColorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CGColorCreate(<#CGColorSpaceRef space#>, <#const CGFloat *components#>)
    /*CGColorRef cgColor = [UIColor redColor].CGColor;
    CGColorSpaceRef colorSpace = CGColorGetColorSpace(cgColor);
    NSLog(@"colorSpace ==> %@", colorSpace);
    
    NSUInteger num = CGColorGetNumberOfComponents(cgColor);
    NSLog(@"num ==> %d", num);
    const CGFloat *colorComponents = CGColorGetComponents(cgColor);
    for (int i = 0; i < num; ++i) {
        NSLog(@"color components %d: %f", i, colorComponents[i]);
    }
    
//    sizeof(<#expression-or-type#>);*/
    
   /* // test init uicolor with CGColor
    UIColor *color = [UIColor colorWithCGColor:[UIColor whiteColor].CGColor];
    
    // CGColor property is always valid
    NSLog(@"CGColor from UIColor %@", color.CGColor);
    
    // don't use CIColor property
    // This property throws an exception if the color object was not initialized with a Core Image color.
    NSLog(@"CIColor from UIColor %@", color.CIColor);   // crush*/
    
   /* // test kCGColorSpaceDeviceCMYK
    CGColorSpaceRef cmykSpace = CGColorSpaceCreateDeviceCMYK();
    CGFloat cmykValue[] = {1, 1, 0, 0, 1};      // blue
    CGColorRef colorCMYK = CGColorCreate(cmykSpace, cmykValue);
    CGColorSpaceRelease(cmykSpace);
    NSLog(@"colorCMYK: %@", colorCMYK);
    
    // color with CGColor, uicolor will just retain it
    UIColor *color = [UIColor colorWithCGColor:colorCMYK];
    NSLog(@"CGColor from UIColor: %@", color.CGColor);*/
    
    // test kCGColorSpaceDeviceGray
    NSLog(@"CGColor white color:%@", [UIColor whiteColor].CGColor);
    
    CIColor *ciColor = [CIColor colorWithCGColor:[UIColor whiteColor].CGColor];
    NSLog(@"cicolor: %@", ciColor);
    NSLog(@"cicolor colorspace: %@", ciColor.colorSpace);
    
    UIColor *color = [UIColor colorWithCIColor:ciColor];
    NSLog(@"color %@", color);
    
    // Core Image converts all color spaces to the Core Image working color
    // space before it passes the color space to the filter kernel.
    // kCGColorSpaceDeviceGray ---> kCGColorSpaceDeviceRGB
    NSLog(@"cicolor from UIColor: %@", color.CIColor);
    NSLog(@"cicolor's colorspace: %@", color.CIColor.colorSpace);
    NSLog(@"color's CGColor: %@", color.CGColor);
    NSLog(@"cicolor from UIColor: %@", color.CIColor);
    NSLog(@"cicolor's colorspace: %@", color.CIColor.colorSpace);
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
