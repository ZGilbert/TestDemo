//
//  ZTestTemperatures.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestTemperatures.h"

@implementation ZTestTemperatures

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        isVisible=YES;
        imgView=[[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        [imgView setImage:[UIImage imageNamed:@"gitgit.gif"]];
        imgView.userInteractionEnabled=NO;
        [self addSubview:imgView];
    }
    
    return self;
}

- (IBAction) convert :(id)sender
{
    [outfield setText:[NSString stringWithFormat:@"The temperature is below 0"]];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if ([touch phase] != UITouchPhaseBegan) return;
    
    isVisible = !isVisible;
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [imgView setAlpha:(float)isVisible];
    [UIView commitAnimations];
}

@end
