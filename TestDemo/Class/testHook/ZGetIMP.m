//
//  ZGetIMP.m
//  TestDemo
//
//  Created by zhu_hbo on 14-10-14.
//  Copyright (c) 2014年 zhu_hbo. All rights reserved.
//

#import "ZGetIMP.h"

@implementation ZGetIMP

IMP impOfCallingMethod(id lookupObject, SEL selector)
{
    NSUInteger returnAddress = (NSUInteger)__builtin_return_address(0);
    NSUInteger closest = 0;
    
    // Iterate over the class and all superclasses
    Class currentClass = object_getClass(lookupObject);
    while (currentClass)
    {
        // Iterate over all instance methods for this class
        unsigned int methodCount;
        Method *methodList = class_copyMethodList(currentClass, &methodCount);
        unsigned int i;
        for (i = 0; i < methodCount; i++)
        {
            // Ignore methods with different selectors
            if (method_getName(methodList[i]) != selector)
            {
                continue;
            }
            
            // If this address is closer, use it instead
            NSUInteger address = (NSUInteger)method_getImplementation(methodList[i]);
            if (address < returnAddress && address > closest)
            {
                closest = address;
            }
        }
        
        free(methodList);
        currentClass = class_getSuperclass(currentClass);
    }
    
    return (IMP)closest;
}

//其使用方法为:
- (void)myMethodWithParam1:(int)someParameter andParam2:(int)otherParameter
{
    IMP myImplementation = impOfCallingMethod([self class], _cmd);
    
//    ...
}

@end
