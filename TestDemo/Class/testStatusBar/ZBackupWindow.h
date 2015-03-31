//
//  ZBackupWindow.h
//  TestDemo
//
//  Created by zhu_hbo on 14-10-15.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBackupWindow : UIWindow

/*
 * @brief get the singleton tips window
 */
+ (ZBackupWindow *)shareTipsWindow;

/*
 * @brief show tips message on statusBar
 */
- (void)showTips:(NSString*)tips;

/*
 * @brief show tips message on statusBar
 */
- (void)showTips:(NSString*)tips hideAfterDelay:(NSInteger)seconds;

/*
 * @brief show tips icon and message on statusBar
 */
- (void)showTipsWithImage:(UIImage*)tipsIcon message:(NSString*)message;

/*
 * @brief show tips icon and message on statusBar
 */
- (void)showTipsWithImage:(UIImage*)tipsIcon message:(NSString*)message hideAfterDelay:(NSInteger)seconds;


/*
 * @brief hide tips window
 */
- (void)hideTips;

@end
