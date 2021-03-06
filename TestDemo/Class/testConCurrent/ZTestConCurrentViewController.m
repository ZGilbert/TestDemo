//
//  ZTestConCurrentViewController.m
//  TestDemo
//
//  Created by zhu_hbo on 14/10/22.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestConCurrentViewController.h"
#import "ZFindMinMaxThread.h"

@interface ZTestConCurrentViewController ()

@end

@implementation ZTestConCurrentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self testA];

    [self testB];
}

- (void)testB
{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("me.tutuge.test.gcd", DISPATCH_QUEUE_CONCURRENT);
    //立即打印一条信息
    NSLog(@"Begin add block...");
    //提交一个block
    dispatch_async(queue, ^{
        //Sleep 10秒
        [NSThread sleepForTimeInterval:10];
        NSLog(@"First block done...");
    });
    //5 秒以后提交block
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"After...");
    });

}

-(void) testA
{
    size_t const count = 1000000;
    uint32_t inputValues[count];
    
    // 使用随机数字填充 inputValues
    for (size_t i = 0; i < count; ++i) {
        inputValues[i] = arc4random();
    }

    // 开始4个寻找最小值和最大值的线程
    size_t const threadCount = 4;
    pthread_t tid[threadCount];
    for (size_t i = 0; i < threadCount; ++i) {
        struct threadInfo * const info = (struct threadInfo *) malloc(sizeof(*info));
        size_t offset = (count / threadCount) * i;
        info->inputValues = inputValues + offset;
        info->count = MIN(count - offset, count / threadCount);
        int err = pthread_create(tid + i, NULL, &findMinAndMax, info);
        NSCAssert(err == 0, @"pthread_create() failed: %d", err);
    }
    // 等待线程退出
    struct threadResult * results[threadCount];
    for (size_t i = 0; i < threadCount; ++i) {
        int err = pthread_join(tid[i], (void **) &(results[i]));
        NSCAssert(err == 0, @"pthread_join() failed: %d", err);
    }
    // 寻找 min 和 max
    uint32_t min = UINT32_MAX;
    uint32_t max = 0;
    for (size_t i = 0; i < threadCount; ++i) {
        min = MIN(min, results[i]->min);
        max = MAX(max, results[i]->max);
        free(results[i]);
        results[i] = NULL;
    }
    
    ZLOG(@"min = %u", min);
    ZLOG(@"max = %u", max);
}

struct threadInfo {
    uint32_t * inputValues;
    size_t count;
};

struct threadResult {
    uint32_t min;
    uint32_t max;
};

void * findMinAndMax(void *arg)
{
    struct threadInfo const * const info = (struct threadInfo *) arg;
    uint32_t min = UINT32_MAX;
    uint32_t max = 0;
    for (size_t i = 0; i < info->count; ++i) {
        uint32_t v = info->inputValues[i];
        min = MIN(min, v);
        max = MAX(max, v);
    }
    free(arg);
    struct threadResult * const result = (struct threadResult *) malloc(sizeof(*result));
    result->min = min;
    result->max = max;
    return result;
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
