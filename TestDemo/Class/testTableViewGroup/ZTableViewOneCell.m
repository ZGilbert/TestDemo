//
//  ZTableViewOneCell.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTableViewOneCell.h"

@implementation ZTableViewOneCell


- (void)configureCell:(ZTestCellDatasource *)aItems;
{
    self.textLabel.text = @"one";
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
