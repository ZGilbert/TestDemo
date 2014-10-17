//
//  Ztest.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-14.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestCell.h"

@implementation ZTestCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) configureCell:(ZItemsSource *)aItems
{
    self.textLabel.text = aItems.name;
//    self.textFLabel.backgroundColor = [UIColor yellowColor];
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 300, 40)];
    self.detailLabel.backgroundColor = [UIColor clearColor];
    self.detailLabel.text = [NSString stringWithFormat:@"%@", aItems.creationDate];
    [self addSubview:self.detailLabel];
    
    self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 230, 40)];
    self.testLabel.backgroundColor = [UIColor clearColor];
    self.testLabel.text = aItems.name;
    [self addSubview:self.testLabel];
    //    self.detailTextLabel.text = [NSString stringWithFormat:@"%@", aItems.creationDate];
    ZLOG(@"%@", aItems.creationDate);
}

@end
