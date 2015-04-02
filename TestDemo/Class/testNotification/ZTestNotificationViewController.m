//
//  ZTestNotificationViewController.m
//  TestDemo
//
//  Created by gypsii001 on 15/4/2.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "ZTestNotificationViewController.h"

#define TEST_NOTIFICATION @"testNotification"

@interface ZPoster : NSObject

@end

@implementation ZPoster

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self performSelectorInBackground:@selector(postNotification) withObject:nil];
    }
    
    return self;
}

- (void)postNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil];
}

@end

#pragma mark - Observer

@interface Observer : NSObject
{
    ZPoster  *_poster;
}

@property (nonatomic, assign) NSInteger i;

@end

@implementation Observer

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _poster = [[ZPoster alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:TEST_NOTIFICATION object:nil];
    }
    
    return self;
}

- (void)handleNotification:(NSNotification *)notification
{
    NSLog(@"handle notification begin");
    sleep(1);
    NSLog(@"handle notification end");
    
    self.i = 10;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(@"Observer dealloc");
}

@end

#pragma mark - viewcontroller
@interface ZTestNotificationViewController () <NSMachPortDelegate>

@end

@implementation ZTestNotificationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // part I ====================== start ====================== //
    /*ZLOG(@"current thread = %@", [NSThread currentThread]);
    
    //主线程中注册的通知的观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:TEST_NOTIFICATION object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil userInfo:nil]; //二级线程接收不到.不在一个线程
        
        if (YES) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil userInfo:nil]; //接收到了.
            });
        }
    });*/
    // part I ====================== end ====================== //
    
    
    // part II ====================== start ====================== //
    /*NSLog(@"current thread = %@", [NSThread currentThread]);
    
    // 初始化
    self.notifications = [[NSMutableArray alloc] init];
    self.notificationLock = [[NSLock alloc] init];
    self.notificationThread = [NSThread currentThread];
    self.notificationPort = [[NSMachPort alloc] init];
    
    self.notificationPort.delegate = self;
    
    // 往当前线程的run loop添加端口源
    // 当Mach消息到达而接收线程的run loop没有运行时，则内核会保存这条消息，直到下一次进入run loop
    [[NSRunLoop currentRunLoop] addPort:self.notificationPort
                                forMode:(__bridge NSString *)kCFRunLoopCommonModes];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:TEST_NOTIFICATION object:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil userInfo:nil];
    });*/
    // part II ====================== end ====================== //
    
    
    // part III ====================== start ====================== //
     __autoreleasing Observer *observer = [[Observer alloc] init];
    // part III ===================== end ====================== //
    
}

-(void) processNotification:(NSNotification *)notification
{
    if ([NSThread currentThread] != _notificationThread) {
        
        // Forward the notification to the correct thread.
        [self.notificationLock lock];
        [self.notifications addObject:notification];
        [self.notificationLock unlock];
        [self.notificationPort sendBeforeDate:[NSDate date]
                                   components:nil
                                         from:nil
                                     reserved:0];
        
    } else {
        // Process the notification here;
        NSLog(@"current thread = %@", [NSThread currentThread]);
        NSLog(@"process notification");
    }

}

#pragma mark - delegate implemented here
- (void)handleMachMessage:(void *)msg {
    
    [self.notificationLock lock];
    
    while ([self.notifications count]) {
        NSNotification *notification = [self.notifications objectAtIndex:0];
        [self.notifications removeObjectAtIndex:0];
        [self.notificationLock unlock];
        [self processNotification:notification];
        [self.notificationLock lock];
    };
    
    [self.notificationLock unlock];
}


-(void) handleNotification:(NSNotification *)notification
{
    ZLOG(@"current thread = %@", [NSThread currentThread]);
    ZLOG(@"test notification");
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
