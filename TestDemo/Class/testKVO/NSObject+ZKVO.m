//
//  NSObject+ZKVO.m
//  TestDemo
//
//  Created by gypsii001 on 15/4/1.
//  Copyright (c) 2015年 zhu_hbo. All rights reserved.
//

#import "NSObject+ZKVO.h"
#import <objc/runtime.h>

#define ZKVOClassPrefix @"Pre"


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

#pragma mark - Overridden Methods
static void kvo_setter(id self, SEL _cmd, id newValue)
{
//    NSString *setterName = NSStringFromSelector(_cmd);
//    NSString *getterName = getterForSetter(setterName);
//    
//    if (!getterName) {
//        NSString *reason = [NSString stringWithFormat:@"Object %@ does not have setter %@", self, setterName];
//        @throw [NSException exceptionWithName:NSInvalidArgumentException
//                                       reason:reason
//                                     userInfo:nil];
//        return;
//    }
//    
//    id oldValue = [self valueForKey:getterName];
//    
//    struct objc_super superclazz = {
//        .receiver = self,
//        .super_class = class_getSuperclass(object_getClass(self))
//    };
//    
//    // cast our pointer so the compiler won't complain
//    void (*objc_msgSendSuperCasted)(void *, SEL, id) = (void *)objc_msgSendSuper;
//    
//    // call super's setter, which is original class's setter method
//    objc_msgSendSuperCasted(&superclazz, _cmd, newValue);
//    
//    // look up observers and call the blocks
//    NSMutableArray *observers = objc_getAssociatedObject(self, (__bridge const void *)(kPGKVOAssociatedObservers));
//    for (PGObservationInfo *each in observers) {
//        if ([each.key isEqualToString:getterName]) {
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                each.block(self, getterName, oldValue, newValue);
//            });
//        }
//    }
}

static Class kvo_class(id self, SEL _cmd)
{
    return class_getSuperclass(object_getClass(self));
}
//end

- (Class)makeKvoClassWithOriginalClassName:(NSString *)originalClazzName
{
    NSString *kvoClazzName = [ZKVOClassPrefix stringByAppendingString:originalClazzName];
    Class clazz = NSClassFromString(kvoClazzName);
    
    if (clazz) {
        return clazz;
    }
    
    // class doesn't exist yet, make it
    Class originalClazz = object_getClass(self);
    Class kvoClazz = objc_allocateClassPair(originalClazz, kvoClazzName.UTF8String, 0);
    
    // grab class method's signature so we can borrow it
    Method clazzMethod = class_getInstanceMethod(originalClazz, @selector(class));
    const char *types = method_getTypeEncoding(clazzMethod);
    class_addMethod(kvoClazz, @selector(class), (IMP)kvo_class, types);
    
    objc_registerClassPair(kvoClazz);
    
    return kvoClazz;
}

- (BOOL)hasSelector:(SEL)selector
{
    Class clazz = object_getClass(self);
    unsigned int methodCount = 0;
    Method* methodList = class_copyMethodList(clazz, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++) {
        SEL thisSelector = method_getName(methodList[i]);
        if (thisSelector == selector) {
            free(methodList);
            return YES;
        }
    }
    
    free(methodList);
    return NO;
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
    NSString *clazzName = NSStringFromClass(clazz);
    
    // if not an KVO class yet
    if (![clazzName hasPrefix:ZKVOClassPrefix]) {
        clazz = [self makeKvoClassWithOriginalClassName:clazzName];
        object_setClass(self, clazz);
    }
    
    // add our kvo setter if this class (not superclasses) doesn't implement the setter?
    if (![self hasSelector:setterSelector]) {
        const char *types = method_getTypeEncoding(setterMethod);
        class_addMethod(clazz, setterSelector, (IMP)kvo_setter, types);
    }
    
    
}

-(void) ZB_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {

    
}



@end
