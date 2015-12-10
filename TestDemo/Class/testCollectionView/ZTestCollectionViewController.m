//
//  ZTestCollectionViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 15/12/10.
//  Copyright © 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestCollectionViewController.h"
#import "ZTestCollectionViewCell.h"

@interface ZTestCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ZTestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 2;
    flowLayout.minimumLineSpacing = 2;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat fwidth = 50;
    flowLayout.itemSize = CGSizeMake(fwidth, fwidth);
    
    UICollectionView *cv = [[UICollectionView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, fwidth+4) collectionViewLayout:flowLayout];
    cv.showsHorizontalScrollIndicator = NO;
    cv.contentInset = UIEdgeInsetsZero;
    [cv registerClass:[ZTestCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ZTestCollectionViewCell class])];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 0);
    
    cv.dataSource = self;
    cv.delegate = self;
    cv.backgroundColor = [UIColor redColor];
    [self.view addSubview:cv];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"");
    return 9;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ZTestCollectionViewCell class]) forIndexPath:indexPath];
    if (!cell) {
        cell = [[ZTestCollectionViewCell alloc] init];
    }
    
//    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
//    img.image = [UIImage imageNamed:@"test.png"];
//    [cell addSubview:img];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

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
