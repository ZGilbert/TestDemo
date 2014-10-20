//
//  ZToggleView.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZToggleView.h"

@implementation ZToggleView

#define BIGRECT CGRectMake(0.0f,0.0f,320.0f,435.0f)
#define SMALLRECT CGRectMake(130.0f,187.0f,60.0f,60.0f)

- (id)initWithFrame:(CGRect)aFrame
{
    self=[super initWithFrame:aFrame];
    
    //Load both views,make them noninteractive
    imgView1=[[UIImageView alloc] initWithFrame:BIGRECT];
    imgView2=[[UIImageView alloc] initWithFrame:SMALLRECT];
    [imgView1 setImage:[UIImage imageNamed:@"test.png"]];
    [imgView2 setImage:[UIImage imageNamed:@"gitgit.gif"]];
    imgView1.userInteractionEnabled = NO;
    imgView2.userInteractionEnabled = NO;
    
    //image 1 is in front of image 2 to begin
    [self addSubview:imgView2];
    [self addSubview:imgView1];
    isOne = YES;
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Determine which view occupies which role
    UIImageView *big = isOne?imgView1:imgView2;
    UIImageView *little = isOne?imgView2:imgView1;
    isOne=!isOne;
    
    //Pack all the changes into the animation block
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    
    [big setFrame:SMALLRECT];
    [big setAlpha:0.5];
    [little setFrame:BIGRECT];
    [little setAlpha:1.0];
    
    [UIView commitAnimations];
    
    //Hide the shrunken "big" image
    [big setAlpha:0.0f];
    [[big superview] bringSubviewToFront:big];
}

//- (void)dealloc
//{
//    [imgView1 release];
//    [imgView2 release];
//    [super dealloc];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
