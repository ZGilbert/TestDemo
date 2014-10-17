//
//  ZSecondViewController.h
//  TestDemo
//
//  Created by zhu_hbo on 14-9-22.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^back)(BOOL back);

@interface ZSecondViewController : UIViewController {

    UITextField *_inputField;
}

@property (strong, nonatomic) void (^backBlock)(BOOL back);

- (void) cancelClicked:(back)complete;

@end
