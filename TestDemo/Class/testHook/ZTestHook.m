//
//  ZTestHook.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-14.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestHook.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation ZTestHook

// this method will just excute once
+ (void)initialize
{
    // 获取到UIWindow中sendEvent对应的method
    Method sendEvent = class_getInstanceMethod([UIWindow class], @selector(sendEvent:)); //这一行主要目的是获取到UIWindow原生的sendEvent的Method(一个结构体，用来对方法进行描述)
    Method sendEventMySelf = class_getInstanceMethod([self class], @selector(sendEventHooked:)); //获取到我们自己定义的类中的sendEvent的Method(这两个方法的签名必须一样，否则运行时报错)
    
    // 将目标函数的原实现绑定到sendEventOriginalImplemention方法上
    IMP sendEventImp = method_getImplementation(sendEvent); //通过UIWindow原生的sendEvent的Method获取到对应的IMP(一个函数指针)
    class_addMethod([UIWindow class], @selector(sendEventOriginal:), sendEventImp, method_getTypeEncoding(sendEvent)); //使用运行时API Class_addMethod给UIWindow类添加了一个叫sendEventOriginal的方法，该方法使用UIWindow原生的sendEvent的实现，并且有着相同的方法签名(必须相同，否则运行时报错)。
    
    // 然后用我们自己的函数的实现，替换目标函数对应的实现
    IMP sendEventMySelfImp = method_getImplementation(sendEventMySelf); //获取我们自定义类中的sendEventMySelf的IMP
    class_replaceMethod([UIWindow class], @selector(sendEvent:), sendEventMySelfImp, method_getTypeEncoding(sendEvent)); //关键的一行，这一行的主要目的是为UIWindow原生的sendEvent指定一个新的实现，我们看到我们将该实现指定到了我们自己定义的sendEventMySelf上。到了这儿我们就完成了偷梁换柱，大功告成。
    
    /*
     执行上面这些行以后，我们就成功的将UIWindow的sendEvent重定向到了我们自己的写的sendEventMySelf的实现，然后将其原本的实现重定向到了我们给它新添加的方法sendEventOriginal中。而sendEventMySelf中，我们首先可以对这个消息进行我们想要的处理，然后再通过41行调用sendEventOriginal方法转到正常的执行流程。
     
     　　这块儿你可能有个困惑 “我们自定义类中明明是没有sendEventOriginal方法的啊？”
     
     　　为什么执行起来不报错，而且还会正常执行？因为sendEventMySelf是UIWindow的sendEvent重定向过来的，所以在运行时该方法中的self代表的就是UIWindow的实例，而不再是TestHookObject的实例了。加上sendEventOriginal是我们通过运行时添加到UIWindow的实例方法，所以可以正常调用。当然如果直接通过下面这种方式调用也是可以的，只不过编译器会提示警告(编译器没那么智能)，因此我们采用了performSelector的调用方式。
     
     [self sendEventOriginal:event];
     　　以上就是Hook的实现，使用时我们只需要让TestHookObject类执行一次初始话操作就可以了，执行完以后。UIWindow的sendEvent消息就会会hook到我们的sendEventMySelf中了。
     */
}

/*
 * 截获到window的sendEvent
 * 我们可以先处理完以后，再继续调用正常处理流程
 */
- (void)sendEventHooked:(UIEvent *)event
{
    // do something what ever you want
    NSLog(@"haha, this is my self sendEventMethod!!!!!!!");
    
    // invoke original implemention
    [self performSelector:@selector(sendEventOriginal:) withObject:event];
}

@end
