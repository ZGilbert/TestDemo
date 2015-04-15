//
//  ZPublicTableView.h
//  TestDemo
//
//  Created by gypsii001 on 15/4/14.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPublicTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *cellDataArray;

@end
