//
//  ZTestNotificationViewController.h
//  TestDemo
//
//  Created by gypsii001 on 15/4/2.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTestNotificationViewController : UIViewController

// part II ====================== start ====================== //
@property (nonatomic) NSMutableArray    *notifications;         // 通知队列
@property (nonatomic) NSThread          *notificationThread;    // 期望线程
@property (nonatomic) NSLock            *notificationLock;      // 用于对通知队列加锁的锁对象，避免线程冲突
@property (nonatomic) NSMachPort        *notificationPort;      // 用于向期望线程发送信号的通信端口
// part II ====================== end ====================== //

@end
