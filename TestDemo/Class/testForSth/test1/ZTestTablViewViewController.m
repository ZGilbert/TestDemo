//
//  ZTestTablViewViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/1/7.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestTablViewViewController.h"

@interface ZTestTablViewViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *dataArray;
}

@end

@implementation ZTestTablViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        [dataArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    UITableView *testTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 300, 568) style:UITableViewStyleGrouped];
    testTableView.delegate = self;
    testTableView.dataSource = self;
    [self.view addSubview:testTableView];
    // Do any additional setup after loading the view.
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    UILabel *label = [[UILabel alloc] initWithFrame:titleView.frame];
    label.backgroundColor = [UIColor yellowColor];
    label.textColor = [UIColor redColor];
    [titleView addSubview:label];

    switch (section) {
        case 0:
            label.text = @"话题";
            break;
        case 1:
            label.text = @"兴趣";
            break;
        case 2:
            label.text = @"品牌";
            break;
        case 3:
            label.text = @"关注";
            break;
            
            
        default:
            break;
    }
    return titleView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 40;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count]/4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    switch (section) {
//        case 0:
//            return @"话题";
//        case 1:
//            return @"兴趣";
//        case 2:
//            return @"品牌";
//        case 3:
//            return @"关注";
//        default:
//            break;
//    }
//    return @"";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *simpeTableIdentifier = @"simpeTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpeTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpeTableIdentifier];
    }
//    ZLOG(@"section ==> %d", indexPath.row);
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
            break;
            
        case 1:
            cell.textLabel.text = [dataArray objectAtIndex:indexPath.row+5];
            break;
        case 2:
            cell.textLabel.text = [dataArray objectAtIndex:indexPath.row+10];
            break;
        case 3:
            cell.textLabel.text = [dataArray objectAtIndex:indexPath.row+15];
            break;
        
        default:
            break;
    }

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
