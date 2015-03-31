//
//  ZArrayDatasource.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PackageCellBlock)(id cell, id item);

@interface ZArrayDatasource : NSObject <UITableViewDataSource>

-(id) initWithItem:(NSArray *)aItem
    cellIdentifier:(NSString *)aIdentifier
cellConfigureBlock:(PackageCellBlock)aPackageBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
