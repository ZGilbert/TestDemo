//
//  ZArrayDatasource.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZArrayDatasource.h"

@interface ZArrayDatasource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *reuseIdentifier;
@property (nonatomic, strong) PackageCellBlock packageCellBlock;

@end

@implementation ZArrayDatasource

-(id) init
{
    return nil;
}

-(id) initWithItem:(NSArray *)aItem
    cellIdentifier:(NSString *)aIdentifier
cellConfigureBlock:(PackageCellBlock)aPackageBlock
{
    self = [super init];
    if (self) {
        self.items = [NSArray arrayWithArray:aItem];
        self.reuseIdentifier = aIdentifier;
        self.packageCellBlock = [aPackageBlock copy];
    }
    return self;
}

-(id) itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger )indexPath.row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath]; //此方法不用判断!cell
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reuseIdentifier];
        id item = [self itemAtIndexPath:indexPath];
        self.packageCellBlock(cell, item);
//    }
    return cell;
}

@end

