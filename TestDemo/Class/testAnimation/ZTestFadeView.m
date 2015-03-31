//
//  ZTestFadeView.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestFadeView.h"

@implementation ZTestFadeView

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        isVisible=YES;
//        imgView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        imgView = [[UIImageView alloc] initWithFrame:frame];
        [imgView setImage:[UIImage imageNamed:@"test.png"]];
        imgView.userInteractionEnabled = NO;
        [self addSubview:imgView];
    }
    
    return self;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
