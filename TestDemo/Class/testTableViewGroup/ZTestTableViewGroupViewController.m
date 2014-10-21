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
#import "ZTableViewTwoCell.h"

@interface ZTestTableViewGroupViewController () <UITableViewDelegate>

@property (strong, nonatomic) ZTestCellDatasource *testDatasource;

@end

@implementation ZTestTableViewGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TestCellBlock cellBlock = ^(ZTableViewOneCell *cell, ZItemsSource *item){
        [cell configureCell:item];
    };
    
    NSArray *datasource = [self forArray];
    
    UITableView *testTableView = [[UITableView alloc]
                                  initWithFrame:CGRectMake(10, 0, 300, 568)
                                  style:UITableViewStyleGrouped];
    NSArray *ids = @[@"ZTableViewOneCell", @"ZTableViewTwoCell"];
    
    self.testDatasource = [[ZTestCellDatasource alloc]
                           initWithItem:datasource
                           cellIdentifier:ids
                           cellBlock:cellBlock];
    
    testTableView.dataSource = self.testDatasource;
    testTableView.delegate = self;
    [testTableView registerClass:[ZTableViewOneCell class] forCellReuseIdentifier:[ids objectAtIndex:0]];
    [testTableView registerClass:[ZTableViewTwoCell class] forCellReuseIdentifier:[ids objectAtIndex:1]];
    [self.view addSubview:testTableView];
}

-(NSArray *) forArray
{
    
    NSMutableArray *mutArray = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        ZItemsSource *z = [[ZItemsSource alloc] init];
        z.name = [NSString stringWithFormat:@"tom%d", i];
//        z.creationDate = [ZTestPackageCell getDateString];
        [mutArray addObject:z];
    }
    return [mutArray copy];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;  // 当前滚动位移
    CGRect bounds = scrollView.bounds;          // UIScrollView 可视高度
    CGSize size = scrollView.contentSize;         // 滚动区域
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    
    ZLOG(@"offset: %f", offset.y);
    ZLOG(@"content.height: %f", size.height);
    ZLOG(@"bounds.height: %f", bounds.size.height);
    ZLOG(@"inset.top: %f", inset.top);
    ZLOG(@"inset.bottom: %f", inset.bottom);
    ZLOG(@"pos: %f of %f", y, h);
    
    float reload_distance = 10;
    if (y > (h + reload_distance)) {
        // 滚动到底部
        // ...
    }
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
