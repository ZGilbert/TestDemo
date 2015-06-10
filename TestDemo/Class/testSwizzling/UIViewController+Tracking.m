//
//  UIViewController+Tracking.m
//  TestSth
//
//  Created by gypsii001 on 15/4/9.
//  Copyright (c) 2015年 gypsii001. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>

@implementation UIViewController (Tracking)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
//        Class class = object_getClass((id)self);
//        ...
//        Method originalMethod = class_getClassMethod(class, originalSelector);
//        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)xxx_viewWillAppear:(BOOL)animated {
    
    [self xxx_viewWillAppear:animated];
    ZLOG(@"viewWillAppear: %@", self);
    ZLOG(@"viewWillAppear: %@", NSStringFromClass([self class]));
    
    // if we were to call viewWillAppear: in this method, it would cause an infinite loop
//    [self viewWillAppear:animated];
//    NSLog(@"viewWillAppear: %@", NSStringFromClass([self class]));
}

@end
