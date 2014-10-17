//
//  ZTestPackageCell.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZItemsSource.h"

@interface ZTestPackageCell : UITableViewCell

@property (strong, nonatomic) UILabel *textFLabel;
@property (strong, nonatomic) UILabel *detailLabel;

@end


@interface ZTestPackageCell (forMoreMethod)

- (void)configureCell:(ZItemsSource *)aItems;

+ (NSDateFormatter *)dateFormatter;
+(NSString *) getDateString;

@end