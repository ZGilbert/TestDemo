//
//  ZBasicBlockViewController.h
//  TestDemo
//
//  Created by gypsii001 on 15/3/12.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BoolBlock)(BOOL);//一个只接受一个BOOL参数，没有返回值的block
typedef int (^IntBlock)(void);//一个没有参数，返回int的block
typedef BoolBlock (^HugeBlock)(IntBlock);//看看，这个HugeBlock的参数和返回值都是block

@interface ZBasicBlockViewController : UIViewController

@end
