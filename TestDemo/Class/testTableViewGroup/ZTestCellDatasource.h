//
//  ZTestCellDatasource.h
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TestCellBlock)(id cell, id item);

@interface ZTestCellDatasource : NSObject <UITableViewDataSource>


-(id) initWithItem:(NSArray *)items
    cellIdentifier:(NSArray *)aIdentifier
         cellBlock:(TestCellBlock)aCellBlock;


-(id) itemAtIndexPath:(NSIndexPath *)indexPath cellIdentifier:(NSString *)aIdentifier;

@end
