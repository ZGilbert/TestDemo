//
//  ZTableViewTwoCell.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTableViewTwoCell.h"

@implementation ZTableViewTwoCell


- (void)configureCell:(ZTestCellDatasource *)aItems;
{
    self.textLabel.text = @"two";
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
