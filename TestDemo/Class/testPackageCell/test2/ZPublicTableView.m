//
//  ZPublicTableView.m
//  TestDemo
//
//  Created by gypsii001 on 15/4/14.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZPublicTableView.h"

@implementation ZPublicTableView


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"simpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(NO)
    {   cell.selectedBackgroundView =[[UIView alloc] initWithFrame:cell.frame];
        cell.selectedBackgroundView.alpha=0.0;
    }
    else
    {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
//    id celldata = [_cellDataArray objectAtIndex:indexPath.row];
//    if ([celldata isKindOfClass:[GDataObjectV2 class]])
//    {
//        if (!bolUseCellBuffer || bolNil)
//        {
//            UIView *v = [(GDataObjectV2*)celldata createCell];
//            [cell.contentView addSubview:v];
//            [v release];
//        }
//        else
//        {
//            [(GDataObjectV2*)celldata changeSubView:cell.contentView];
//        }
//    }
    cell.backgroundColor=[UIColor clearColor];
    
    return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
