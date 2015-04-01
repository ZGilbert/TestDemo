//
//  NSObject+ZKVO.m
//  TestDemo
//
//  Created by gypsii001 on 15/4/1.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "NSObject+ZKVO.h"
#import <objc/runtime.h>

@implementation NSObject (ZKVO)


static NSString * setterForGetter(NSString *getter)
{
    if (getter.length <= 0) {
        return nil;
    }
    
    NSString *firstLetter = [[getter substringToIndex:1] uppercaseString];
    NSString *remainingLetters = [getter substringFromIndex:1];
    NSString *setter = [NSString stringWithFormat:@"set%@%@:", firstLetter, remainingLetters];
    
    return setter;
}

#pragma mark - kvo category
- (void) ZB_addObserver:(NSObject *)observer
             forKeyPath:(NSString *)keyPath
              withBlock:(ZB_observerBlock)block {

    SEL setterSelector = NSSelectorFromString(setterForGetter(keyPath));
    Method setterMethod = class_getInstanceMethod([self class], setterSelector);
    if (!setterMethod) {
        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have a setter for key %@", self, keyPath];
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:reason
                                     userInfo:nil];
        return;
    }
    
    Class clazz = object_getClass(self);
    NSString *clazzName = NSStringFromClass([clazz class]);
    
    
    
    
}

-(void) ZB_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {

    
}



@end
