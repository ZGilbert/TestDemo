//
//  ZTestTableViewGroupViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/20.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestTableViewGroupViewController.h"
#import "ZTestCellDatasource.h"
#import "ZTableViewOneCell.h"

@interface ZTestTableViewGroupViewController () <UITableViewDelegate>

@property (strong, nonatomic) ZTestCellDatasource *testDatasource;

@end

@implementation ZTestTableViewGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TestCellBlock cellBlock = ^(ZTableViewOneCell *cell, ZTestCellDatasource *item){
        [cell configureCell:item];
    };
    
    NSArray *datasource = [self forArray];
    
    UITableView *testTableView = [[UITableView alloc]
                                  initWithFrame:CGRectMake(10, 0, 300, 568)
                                  style:UITableViewStylePlain];
    NSArray *ids = @[@"ZTableViewOneCell", @"ZTableViewTwoCell"];
    
    self.testDatasource = [[ZTestCellDatasource alloc]
                           initWithItem:datasource
                           cellIdentifier:ids
                           cellBlock:cellBlock];
    
    testTableView.dataSource = self.testDatasource;
    testTableView.delegate = self;
//    testTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [testTableView registerClass:[ZTableViewOneCell class] forCellReuseIdentifier:@"cellIdentifier"];
    [self.view addSubview:testTableView];
}

-(NSArray *) forArray
{
    
    NSMutableArray *mutArray = [NSMutableArray array];
    for (int i = 0; i < 9; i++) {
//        ZItemsSource *z = [[ZItemsSource alloc] init];
//        z.name = [NSString stringWithFormat:@"tom%d", i];
//        z.creationDate = [ZTestPackageCell getDateString];
//        [mutArray addObject:z];
    }
    return [mutArray copy];
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
