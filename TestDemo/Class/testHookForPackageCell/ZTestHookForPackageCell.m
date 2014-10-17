//
//  ZTestHookForPackageCell.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-14.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZTestHookForPackageCell.h"
#import <objc/runtime.h>
#import <objc/objc.h>
//#import "ZTestCell.h"
#import "ZArrayDatasource.h"

@implementation ZTestHookForPackageCell

-(id) init
{
    self = [super init];
    if (self) {
        NSLog(@"==");
    }
    return self;
    
}
+(void)initialize
{
    Method sendEvent = class_getInstanceMethod([ZArrayDatasource class], @selector(init));
    Method sendEventSelf = class_getInstanceMethod([self class], @selector(init));
    
    IMP sendEventImp = method_getImplementation(sendEvent);
    class_addMethod([ZArrayDatasource class], @selector(configureSelfCell:), sendEventImp, method_getTypeEncoding(sendEvent));
    
    IMP sendEventSelfImp = method_getImplementation(sendEventSelf);
    class_replaceMethod([ZArrayDatasource class], @selector(init), sendEventSelfImp, method_getTypeEncoding(sendEvent));
}



@end
