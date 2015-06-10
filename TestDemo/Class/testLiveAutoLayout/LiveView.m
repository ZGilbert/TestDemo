//
//  LiveView.m
//  Demo
//
//  Created by gypsii001 on 15/5/14.
//  Copyright (c) 2015年 EasyIOS. All rights reserved.
//

#import "LiveView.h"
#import "Masonry.h"
#import "ClassyLiveLayout.h"
#import "Classy.h"

@implementation LiveView


- (void)addSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.redBoxView];
    [self addSubview:self.blueBoxView];
}

- (void)defineLayout
{
    [self.redBoxView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.redBoxView.cas_marginTop));
        make.left.equalTo(@(self.redBoxView.cas_marginLeft));
        make.width.equalTo(@(self.redBoxView.cas_sizeWidth));
        make.height.equalTo(@(self.redBoxView.cas_sizeHeight));
    }];
    
    [self.blueBoxView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.blueBoxView.cas_marginTop));
        make.right.equalTo(@(self.blueBoxView.cas_marginRight));
        make.width.equalTo(@(self.blueBoxView.cas_sizeWidth));
        make.height.equalTo(@(self.blueBoxView.cas_sizeHeight));
    }];
}

#pragma mark - Lazy initialization
- (UIView*)redBoxView
{
    if (!_redBoxView) {
        _redBoxView = [UIView new];
        _redBoxView.cas_styleClass = @"redBox";
        _redBoxView.backgroundColor = [UIColor redColor];
    }
    return _redBoxView;
}
- (UIView*)blueBoxView
{
    if (!_blueBoxView) {
        _blueBoxView = [UIView new];
        _blueBoxView.cas_styleClass = @"blueBox";
        _blueBoxView.backgroundColor = [UIColor blueColor];
    }
    return _blueBoxView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
