//
//  ZCustomView.m
//  TestDemo
//
//  Created by zhu_haibo on 15/4/7.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZCustomView.h"

@implementation ZCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(void) changeBackgroundColor {
    self.backgroundColor = [UIColor purpleColor];
}

@end
