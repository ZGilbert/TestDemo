//
//  ZTestHookTwo.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-14.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestHookTwo.h"
#import <objc/objc.h>
#import <objc/runtime.h>
#import "ZActionMethod.h"

@implementation ZTestHookTwo

+(void)initialize
{
    Method sendEvent = class_getInstanceMethod([UIWindow class], @selector(sendEvent:));
    Method sendEventSelf = class_getInstanceMethod([ZActionMethod class], @selector(buttonAction:));
    
    IMP sendEventImp = method_getImplementation(sendEvent);
    class_addMethod([UIWindow class], @selector(asdf:), sendEventImp, method_getTypeEncoding(sendEvent));
    
    IMP sendEventImpSelf = method_getImplementation(sendEventSelf);
    class_replaceMethod([UIWindow class], @selector(sendEvent:), sendEventImpSelf, method_getTypeEncoding(sendEvent));

}

@end
