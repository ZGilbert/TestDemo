//
//  ZLazyLoadViewController.h
//  TestDemo
//
//  Created by zhu_hbo on 14-9-28.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLazyLoadViewController : UIViewController

@property (nonatomic, strong) UILabel *firstlab;
@property (nonatomic, strong) UILabel *lastlab;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UIButton *leftbtn;
@property(nonatomic,strong)UIButton *rightbtn;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic ,assign)int i;

-(void)change;

@end
