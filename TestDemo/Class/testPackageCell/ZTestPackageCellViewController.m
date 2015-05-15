//
//  ZTestPackageCellViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-13.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestPackageCellViewController.h"
#import "ZArrayDatasource.h"
#import "ZTestPackageCell.h"
//#import "Ztest.h"

@interface ZTestPackageCellViewController () <UITableViewDelegate>
{
//    UITableView *testTableView;
}

@property (nonatomic, strong) ZArrayDatasource *testDatasource;

@end

@implementation ZTestPackageCellViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PackageCellBlock packageBlock = ^(ZTestPackageCell *cell, ZItemsSource *item) {
        [cell configureCell:item];
    };
    
    NSArray *datasource = [self forArray];
    
    UITableView *testTableView = [[UITableView alloc]
                                  initWithFrame:CGRectMake(10, 0, 300, 568)
                                  style:UITableViewStylePlain];

    self.testDatasource = [[ZArrayDatasource alloc]
                           initWithItem:datasource
                           cellIdentifier:@"cellIdentifier"
                           cellConfigureBlock:packageBlock];
    
    testTableView.dataSource = self.testDatasource;
    testTableView.delegate = self;
    testTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [testTableView registerClass:[ZTestPackageCell class] forCellReuseIdentifier:@"cellIdentifier"];
    [testTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[datasource count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    // 为什么会先取消上一个cell的选中状态呢？因为tableView默认是不支持多选的，我们可以通过设置allowsMultipleSelection为YES来设置支持多选。
    // cell的高亮状态是不能持久的，即tap的时候会变成高亮，松手的时候就会自动设置为非高亮状态。而cell的选中状态则是可以持久的，我们不去触发它改变状态，则选中状态就不会改变。
//    testTableView.allowsMultipleSelection = YES;
    [self.view addSubview:testTableView];

}


//找出字符串中的中文
-(int)IsChinese:(NSString *)str {
    
    for (int i=0; i< [str length];i++) {
        int a = [str characterAtIndex:i];
        
        if( a > 0x4e00 && a < 0x9fff) {
            return i;
        }
        
    }
    return -1;
}

-(NSArray *) forArray
{
    
    NSMutableArray *mutArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        ZItemsSource *z = [[ZItemsSource alloc] init];
        z.name = [NSString stringWithFormat:@"tom%d", i];
        z.creationDate = [ZTestPackageCell getDateString];
        [mutArray addObject:z];
    }
    return [mutArray copy];
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
