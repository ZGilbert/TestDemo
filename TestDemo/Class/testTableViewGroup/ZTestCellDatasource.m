//
//  ZTestCellDatasource.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestCellDatasource.h"

@interface ZTestCellDatasource ()

@property (nonatomic, strong) NSArray *itemsArray;
@property (nonatomic, strong) NSArray *reuseIdentifier;
@property (nonatomic, strong) TestCellBlock cellBlock;

@end
@implementation ZTestCellDatasource

-(id) initWithItem:(NSArray *)items
    cellIdentifier:(NSArray *)aIdentifier
         cellBlock:(TestCellBlock)aCellBlock
{
    self = [super init];
    if (self) {
        self.itemsArray = [NSArray arrayWithArray:items];
        self.reuseIdentifier = [NSArray arrayWithArray:aIdentifier];;
        self.cellBlock = [aCellBlock copy];
    }
    return self;
}

-(id) itemAtIndexPath:(NSIndexPath *)indexPath cellIdentifier:(NSString *)aIdentifier
{
    if ([aIdentifier isEqualToString:[self.reuseIdentifier objectAtIndex:0]])
        return self.itemsArray[(NSUInteger )indexPath.row];
    else
        return self.itemsArray[(NSUInteger )indexPath.row+8];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowsNumber;
    switch (section) {
        case 0:
            rowsNumber = 8;
            break;
        case 1:
            rowsNumber = 1;
            break;
        default:
            break;
    }
    return rowsNumber;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuserID = [self.reuseIdentifier objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID]; //此方法也需要registerClass这个方法的支持,不然后报错
    id item = [self itemAtIndexPath:indexPath cellIdentifier:reuserID];
    self.cellBlock(cell, item);
    return cell;
}


@end
