//
//  ZTableViewOneCell.h
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTestCellDatasource.h"

@interface ZTableViewOneCell : UITableViewCell

@end

@interface ZTableViewOneCell (addMethod)

- (void)configureCell:(ZTestCellDatasource *)aItems;

@end